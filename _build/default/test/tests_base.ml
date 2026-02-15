
module Make (Ocminus : sig include Ocminus.S val tests_dir : string end) = struct

  module YJ = Yojson.Basic
  module YJU = YJ.Util

  (* Raised when there is an error extracting a specification from a test
   * file.
   *)
  exception BadSpec of string

  (* iotest test_code expected = a test that executes `test_code` and passes
   * if the output matches `expected`, and fails otherwise.
   *)
  let iotest test_file test_code expected : Alcotest.return =
    Alcotest.(check string)
      test_file
      expected
      (
        test_code 
          |> Ocminus.Interp.exec
          |> Ocminus.Interp.Value.to_string
      )

  (* extest test_code input expected = a test that succeeds when executing
   * `test_code` with `input` raises an exception e such that
   * Printexc_to_string e = `expected`.
   *
   * We don't use assert_raise here, because that expects an exception value,
   * which requires us to know the arguments to the constructor when the
   * exception is raised, which is not something we can rely upon.  So instead
   * we compare to the string representation of the exception, which we expect
   * to be fixed by an appropriate call to `Printexc.register_printer`.
   *)
  let extest test_file test_code expected : Alcotest.return =
    Alcotest.(check (option string))
      test_file
      (Some expected)
      (
        try
          let _ = Ocminus.Interp.exec test_code in
          None
        with
        | e -> Some (Printexc.to_string e)
      )

  (* make_test_from_spec fname spec = tf, where `tf` is a test function
   * corresponding to the test defined by `spec` in the file `fname`.
   *)
  let make_test_from_spec (test_file : string) (spec : YJ.t) : unit -> Alcotest.return =

    fun () ->

    (* test_code = the program parsed from `fname`.
     *)
    let test_code = In_channel.with_open_text test_file (
      fun ic ->
        let lexbuf = Lexing.from_channel ic in
        try
          Ocminus.Parser.terminated_pgm Ocminus.Lexer.read_token lexbuf
        with
        | Ocminus.Parser.Error ->
          let pos = Lexing.lexeme_start_p lexbuf in
          failwith @@ Printf.sprintf
            ("Parser error in %s near line %d, character %d.\n")
            test_file
            pos.pos_lnum
            (pos.pos_cnum - pos.pos_bol)

    ) in

    (* Are we testing against expected output or an exception?
     *)
    let keys : string list = YJU.keys spec in

    if List.exists (fun k -> k = "output") keys then
      let expected : string =
        match spec |> YJU.member "output" |> YJU.to_list |> YJU.filter_string
        with
        | [output] -> output
        | _ -> raise @@ BadSpec "Multiple outputs specified"
      in

      iotest test_file test_code expected

    else if List.exists (fun k -> k = "exception") keys then
      let ex : string =
        spec |> YJU.member "exception" |> YJU.to_string in
      extest test_file test_code ex
    else
      raise @@ BadSpec "No output or exception attribute"


  (*  is_dir f = true,  f is the name of a directory
   *             false, o/w.
   *)
  let is_dir (f : string) : bool =
    match Unix.stat f with
    | {st_kind = S_DIR; _} -> true
    | _ -> false

  (* tests_from_file f = ts, where ts is a test suite with name `f`, where the
   * tests are specified as described in the module documentation.  Note that
   * for OCaml- programs, each test file specifies exactly one test, so each
   * test "suite" consists of a single test.
   *)
  let tests_from_file (test_file : string) : unit Alcotest.test_case list =

    (* read_test_specs = ts, where ts is a list of JSON test specs read from
     * `test_file`.
     *)
    let read_test_specs () : YJ.t list =
      let inch : In_channel.t = In_channel.open_text test_file in

      let spec_start : string = "(*!tests!" in
      let spec_leader_regexp : Str.regexp = Str.regexp {|^\([ \t]\|\*\)*|} in

      (* Read from `inch` until we find the start of the specifications.
       * The start is indicated by a line that begins with `spec_start` and
       * `inch` will be positioned at the line following the first line that
       * starts with `spec_start`.
       *)
      let rec find_spec_start () =
        match In_channel.input_line inch with
        | None ->
          raise @@ BadSpec "No specs found"
        | Some s ->
          if String.starts_with ~prefix:spec_start s then ()
          else find_spec_start ()
      in

      (* read_specs () = the list of lines that are test specifications.
       *)
      let rec read_specs () : string list =
        match In_channel.input_line inch with
        | None -> raise @@ BadSpec "Unterminated spec comment"
        | Some s ->
          if String.trim s = "*)" then []
          else if not (Str.string_match spec_leader_regexp s 0)
               then raise @@ BadSpec ("Bad spec line: " ^ s)
          else Str.replace_first spec_leader_regexp "" s :: read_specs ()
      in

      try
        find_spec_start() ;
        read_specs () |> String.concat "\n" |> YJ.seq_from_string |> List.of_seq 
      with
      | BadSpec msg -> 
        Printf.eprintf "Bad test spec in %s: %s\n" test_file msg ; []

    in

      try
        (* specs = the test specifications.
         *)
        let specs = read_test_specs() in

        (
          List.mapi
            (
              fun n s ->
                try
                  (*
                  Int.to_string n >:: make_test_from_spec test_file s
                  *)
                  Alcotest.test_case
                    (Int.to_string n)
                    `Quick
                    (make_test_from_spec test_file s)
                with
                | BadSpec msg ->
                  raise @@ BadSpec (
                    Printf.sprintf "%s(%d): %s" test_file n msg
                  )
            )
            specs
        )
      with
      | Yojson.Json_error s ->
        raise @@ BadSpec (
          Printf.sprintf "%s: JSON: %s" test_file s
        )
      | Yojson.Basic.Util.Type_error (s, _) -> 
        raise @@ BadSpec (
          Printf.sprintf "%s: JSON type error: %s" test_file s
        )

  let run_tests() =
    try

      (* Define the strings by which to identify exceptions that are raised.
       *)
      Printexc.register_printer (
        function
        | Ocminus.Interp.UnboundVariable _ -> Some "UnboundVariable"
        | Ocminus.Interp.UndefinedFunction _ -> Some "UndefinedFunction"
        | Ocminus.Interp.TypeError _ -> Some "TypeError"
        | _ -> None
      ) ;

      (* test_file suite_dir = the list of files in `suite_dir` with suffix
       * `.ml.
       *
       * We sort in reverse order because the tests seem to be run in the
       * reverse order from this list, so this way the tests are executed in
       * alphabetical order.
       *)
      let test_files (suite_dir : string) : string list =
        List.filter
          (fun f -> Filename.check_suffix f "ml")
          (Sys.readdir suite_dir |> Array.to_list)
        |> List.sort Stdlib.compare
      in

      (* suite_dirs = directories that contain test files.
       *)
      let suite_dirs : string Array.t =
        Sys.readdir Ocminus.tests_dir 
        |> Array.to_list 
        |> List.map (Filename.concat Ocminus.tests_dir)
        |> List.filter is_dir 
        |> List.sort Stdlib.compare
        |> List.to_seq
        |> Array.of_seq
      in

      for i = 0 to Array.length suite_dirs - 1 do
        let suite_dir = suite_dirs.(i) in
        print_endline "========================================" ;
        begin
          try
            Alcotest.run
              ~and_exit:false
              ~show_errors:true
              ~record_backtrace:false
              suite_dir
              (
                List.map (
                  fun test_file ->
                    (
                      test_file,
                      tests_from_file (Filename.concat suite_dir test_file)
                    )
                ) (test_files suite_dir)
              )
          with
          | Alcotest.Test_error -> ()
        end ;
        print_endline ""
      done


    with
    | BadSpec msg ->
      Printf.eprintf "%s" msg



end

