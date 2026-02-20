(* OCaml- tests.
 *
 * N. Danner
 *
 * Tests are defined by a test specification in the OCaml- source code
 * files.  Each source code file must have a block comment of the form
 *
 *   (*!tests!
 *    *  spec
 *    *)
 *
 * I.e., the opening comment line must be exactly `(*!tests!`, followed by
 * exactly one test specification, followed by the close comment.  After the
 * first line, the leading characters are defined to be any combination of
 * whitespace and "*" characters, and the closing line must have nothing but
 * whitespace before `*)`.  When the leading characters are stripped from
 * the specification lines, the result must be a valid JSON object.
 *
 * A test specification is a JSON object with exactly one of the following
 * attributes:
 *
 *   - "output": a string list consisting of exactly one expected output
 *     value.
 *   - "exception": an exception that is expected to be raised.
 *
 * There must be exactly one `output` or `exception` attribute.
 *
 * The test is conducted as follows.  The source code file is executed by 
 * parsing the source code file and calling `Interp.exec` on the result.
 * Then:
 *
 * If there is an `output` attribute, then `Interp.exec` must return a value
 * `v` such that `Value.to_string v` is exactly the same string as the value
 * of the `output` attribute.  If they are the same, the test passes;
 * otherwise the test fails.  So, for example, consider
 *
 *   {
 *       "output":   [ "12" ]
 *   }
 *
 * The test passes if `Interp.exec` returns a value `v` such that
 * `Value.to_string v = "12"`, fails otherwise.
 *
 * If there is an `exception` attribute, then the test passes if the program
 * execution raises the given exception, and fails otherwise.  Notice that
 * the exception is specified as a string that is the same as the exception
 * type, and that any parameters to the exception constructor are ignored.
 *
 * If there is an `output` and an `exception` attribute, the test is as if
 * there were just an `exception` attribute (i.e., output is ignored).
 * Later versions of this testing framework could require that the program
 * output match the `output` attribute, then raise the indicated exception.
 *)

let () =
  let module Ocminus = Ocminus.Core in
  let module Tests = 
    Tests_base.Make
      (struct include Ocminus let tests_dir = "suites/core" end)
  in

  Tests.run_tests ()

