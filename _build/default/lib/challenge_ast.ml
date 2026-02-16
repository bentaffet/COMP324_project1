(* OCaml- abstract syntax.
 *
 * N. Danner
 *)

(* Module for identifiers/varaibles.
 *)
module Id = struct
    type t = string
    [@@deriving show]

    let compare = String.compare
end

(* Module for expressions.
 *)
module Expr= struct

  type unop =
    | Neg
    | Not
  [@@deriving show]

  type binop =
    | Plus
    | Minus
    | Times
    | Div
    | Mod
    | And
    | Or
    | Eq
    | Ne
    | Lt
    | Le
    | Gt
    | Ge
    [@@deriving show]

  type t =
      (* For a variable x, x parses to Var x.
       *)
    | Var of Id.t
      (* For a number n, n parses to Num n.
       *)
    | Num of int
      (* For a boolean b, b parses to Bool b.
       *)
    | Bool of bool
      (* -e parses to Unop(Neg, e), !e parses to Unop(Not, e).
       *)
    | Unop of unop*t
      (* e <op> e' parses to Binop(<op>, e, e') in the obvious way.
       *)
    | Binop of binop*t*t
      (* if e then e_0 else e_1 parses to If(e, e0, e1).
       *)
    | If of t*t*t
      (* let x = e0 in e1 parses to Let(x, e0, e1).
       *)
    | Let of Id.t*t*t
      (* f e0 e1 ... e_{n-1} parses to Call(Var f, [e0;...; e_{n-1}]).
       *)
    | Call of t * t list
      (* fun x_0 x_1 ... x_{n-1} -> e parses to Fun([x_0;...; x_{n-1}], e).
       *)
    | Fun of Id.t list * t
    [@@deriving show]
end

(* Module for programs.
 *)
module Script = struct
  (* f x_0 ... x_{n-1} = e parses to FunDef(f, [x_0;...;x_{n-1}], e).
   *)
  type fundef = Id.t*Id.t list*Expr.t
  [@@deriving show]

  (* let rec f_0 xs_0 ... = e_0
   *     and f_1 xs_1 ... = e_1
   *     ...
   *     and f_{n-1} xs_{n-1} = e_{n-1} ;;
   *     e ;;
   * parses to
   *   Pgm(
   *     [FunDef(f_0, xs_0, e_0);...;FunDef(f_{n-1}, xs_{n-1}, e_{n-1})],
   *     e
   *   )
   *)
  type t = Pgm of (fundef list)*Expr.t
  [@@deriving show]
end

