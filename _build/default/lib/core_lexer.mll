(* Ocaml- lexer.
 * 
 * Much of this (especially string lexing) is taken directly from Minsky, Y.
 * and Madhavapeddy, A., *Real World OCaml*, 2nd ed., 2022, in particular the
 * "Parsing with Ocamllex and Menhiir" chapter, online at
 * https://dev.realworldocaml.org/parsing-with-ocamllex-and-menhir.html
 *
 * N. Danner
 *)

{
    open Core_parser

    exception SyntaxError of string
}

let digit = ['0'-'9']
let letter = ['A'-'Z'] | ['a'-'z']

let number = digit+
let bool = "true" | "false"
let ident = letter (letter | digit | "_")*

(* We don't include newline in whitespace, because we need to catch it
 * separately in order to update the line number in the lexer, for error
 * reporting.
 *)
let newline = '\n' | '\r' | "\r\n"
let whitespace = ( ' ' | '\t' )+

rule read_token =
    parse
    | "(*"          { read_comment 0 lexbuf ; read_token lexbuf }

    | "||"          { OR }
    | "&&"          { AND }
    | "="           { EQ }
    | "!="          { NE }
    | "<"           { LT }
    | "<="          { LE }
    | ">"           { GT }
    | ">="          { GE }
    | "+"           { PLUS }
    | "-"           { MINUS }
    | "*"           { TIMES }
    | "/"           { DIV }
    | "mod"         { MOD }
    | "not"         { NOT }

    | "("           { LPAREN }
    | ")"           { RPAREN }

    | "if"          { IF }
    | "else"        { ELSE }
    | "then"        { THEN }

    | "let"         { LET }
    | "in"          { IN }

    | "let rec"     { LETREC }
    | "and"         { KWAND }

    | ";"           { SEMI }

    | number        { NUM (int_of_string (Lexing.lexeme lexbuf)) }
    | bool          { BOOL (bool_of_string (Lexing.lexeme lexbuf)) }
    | ident         { ID (Lexing.lexeme lexbuf) }

    | newline       { Lexing.new_line lexbuf ; read_token lexbuf }

    | whitespace    { read_token lexbuf }

    | eof           { EOF }

and read_comment n =
  parse
  | "*)"      { if n = 0 then () else read_comment (n-1) lexbuf }
  | "(*"      { read_comment (n+1) lexbuf }
  | newline   { Lexing.new_line lexbuf ; read_comment n lexbuf }
  | _         { read_comment n lexbuf }
  | eof       { raise (SyntaxError ("Comment is not terminated")) }


