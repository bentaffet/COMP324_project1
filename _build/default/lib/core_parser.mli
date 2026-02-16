
(* The type of tokens. *)

type token = 
  | TIMES
  | THEN
  | SEMI
  | RPAREN
  | PLUS
  | OR
  | NUM of (int)
  | NOT
  | NE
  | MOD
  | MINUS
  | LT
  | LPAREN
  | LETREC
  | LET
  | LE
  | KWAND
  | IN
  | IF
  | ID of (string)
  | GT
  | GE
  | EQ
  | EOF
  | ELSE
  | DIV
  | BOOL of (bool)
  | AND

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val terminated_pgm: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Core_ast.Script.t)

val terminated_exp: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (Core_ast.Expr.t)
