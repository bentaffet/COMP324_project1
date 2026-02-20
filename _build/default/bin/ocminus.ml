(** COMP 324 Project 1:  implementation of an expression language.
 *
 * `ocminus` driver program.
 *
 * @author N. Danner
 *)

(* ****************************************
 * Usage
 * ****************************************
 *)

exception Usage_error of string

let usage = {|
  ocminus impl parse e:  parse expression e and print parse tree
  ocminus impl parsepgm f: parse program file f and print parse tree
  ocminus impl eval e:  evaluate expression e and print result
  ocminus impl exec f:  execute program file f and print result

The `impl` argument must be either "core" or "challenge", to indicate which
language implementation to use.
|}


exception ParseError of string

module Cli (Impl : Ocminus.S) = struct

  open Impl

  (* parse prsr lexbuf = the result of parsing `lexbuf` using `prsr`.
   *
   * We catch Parser.Error here and reraise its message as ParseError because
   * otherwise we need to repeat the error handling in each `*_and_show`
   * function, or alternatively, do the error handling in the main block, but
   * then we have to construct the lexer and call `parse` for each `!cmd`
   * variant, which also seems ugly.
   *)
  let parse prsr lexbuf =
    try
      prsr Lexer.read_token lexbuf
    with
    | Parser.Error ->
      let pos = Lexing.lexeme_start_p lexbuf in
      raise @@ ParseError (
        Printf.sprintf
          "Parser error near line %d, character %d.\n"
          pos.pos_lnum
          (pos.pos_cnum - pos.pos_bol)
      )

  (* parse_and_show fname : print a string representation of the result of
   * parsing the program in `fname` to obtain an `Ast.Script.t` value.
   *)
  let parse_and_show (fname : string) : unit =
    In_channel.with_open_text fname (fun inch ->
      inch |> Lexing.from_channel
           |> parse Parser.terminated_pgm
           |> Ast.Script.show
           |> print_endline
    )

  (* parse_exp_and_show s : print a string representation of the result of
   * parsing `s` to obtain an `Ast.Expr.t` value.
   *
   * Precondition:  `s` parses to an expression (not a program, not a program
   * file!).
   *)
  let parse_exp_and_show (s : string) : unit =
    s |> Lexing.from_string
      |> parse Parser.terminated_exp
      |> Ast.Expr.show
      |> print_endline

  (* eval_and_show s : print a string representation of
   * `Interp.Value.to_string(Interp.exec(Ast.Script.Pgm([], e)))`, where `e` is
   * the result of parsing `s` as an expression.
   *
   *)
  let eval_and_show (s : string) : unit =
    s |> Lexing.from_string
      |> parse Parser.terminated_exp
      |> (fun e -> Interp.exec (Ast.Script.Pgm([], e)))
      |> Interp.Value.to_string
      |> print_endline

  (* exec_and_show f : print a string representation of
   * `Interp.Value.to_string(Interp.exec p)`, where `p` is the result of
   * parsing the program file `f`.
   *)
  let exec_and_show (fname : string) : unit =
    In_channel.with_open_text fname (fun inch ->
      inch |> Lexing.from_channel
           |> parse Parser.terminated_pgm
           |> Interp.exec
           |> Interp.Value.to_string
           |> print_endline
    )

end

let () =
  try
    let args = ref [] in
    Arg.parse [] (fun a -> args := a :: !args) usage ;

    let (mode, command, arg) =
      match List.rev !args with
      | [mode; command; arg] -> (mode, command, arg)
      | _ -> raise @@ Usage_error "wrong number of command line arguments"
    in

    (*
    let module Impl = (val 
                    match mode with
                    | "core" -> (module Ocminus.Core : Ocminus.S)
                    | "challenge" -> (module Ocminus.Challenge : Ocminus.S)
                    | _ -> raise @@ Usage_error (
                        Printf.sprintf
                        "bad implementation %s"
                          mode
                      )
                  )
    in
       *)
    let module Impl =
      (val
        try Ocminus.choose_impl mode
        with
        | Invalid_argument _ ->
          raise @@ Usage_error (
            Printf.sprintf "bad implementation '%s'" mode
          )
      )
    in
    let module Cli = Cli(Impl) in
    let cmd =
      match command with
      | "parse" -> Cli.parse_exp_and_show
      | "parsepgm" -> Cli.parse_and_show
      | "eval" -> Cli.eval_and_show
      | "exec" -> Cli.exec_and_show
      | _ -> raise @@ Usage_error "bad command"

    in

    try
      cmd arg
    with
    | Impl.Interp.UnboundVariable x ->
      Printf.printf
        "Error: variable '%s' used but not declared\n"
        (Impl.Ast.Id.show x) ;
    | Impl.Interp.UndefinedFunction f ->
      Printf.printf
        "Error: undefined function '%s' called but not defined.\n"
        (Impl.Ast.Id.show f)

  with
  | ParseError msg -> print_endline ("Parse error: " ^ msg)
  | Usage_error msg ->
    Printf.printf
      "Bad command line usage:  %s"
      msg ;
    print_endline "" ;
    print_endline usage

