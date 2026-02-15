(* Ocaml- interpreter.
 *
 * N. Danner
 *)

module Ast = Core_ast

module E=Ast.Expr

(* UndefinedFunction f is raised when f is called but not defined.
 *)
exception UndefinedFunction of Ast.Id.t

(* UnboundVariable x is raised when x is used but not declared.
 *)
exception UnboundVariable of Ast.Id.t

(* TypeError s is raised when an operator or function is applied to operands
 * of the incorrect type.  s is any (hopefuly useful) message.
 *)
exception TypeError of string

(* Values.
 *)
module Value = struct
  type t = 
    | V_Int of int
    | V_Bool of bool
    [@@deriving show]

  (* to_string v = a string representation of v (more human-readable than
   * `show`.
   *)
  let to_string (v : t) : string =
    match v with
    | V_Int n -> Int.to_string n
    | V_Bool b -> Bool.to_string b
end

(* Environments.  An environment is a finite map from identifiers to values.
 * We will interchangeably treat environments as functions or sets or lists
 * of pairs in documentation.  We will use ρ as a metavariable over
 * environments.
 *)
module Env = struct

  type t = (Ast.Id.t * Value.t) list
  [@@deriving show]

  (*  empty = ρ, where dom ρ = ∅.
   *)
  let empty : t = []

  let lookup (rho : t) (x : Ast.Id.t) : Value.t = 
    List.assoc x rho
(*! end !*)

  (*  update ρ x v = ρ{x → v}.
   *)
  let update (rho : t) (x : Ast.Id.t) (v : Value.t) : t =
    (x, v) :: List.remove_assoc x rho
end

(*  binop op v v' = v'', where v'' is the result of applying the semantic
 *  denotation of `op` to `v` and `v''`.
 *)
(*! binop header !*)
let binop (op : E.binop) (v : Value.t) (v' : Value.t) : Value.t =
  match (op, v, v') with

  | (E.Plus, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n + n')
  | (E.Minus, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n - n')
  | (E.Times, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n * n')
  | (E.Div, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n / n')
  | (E.Mod, Value.V_Int n, Value.V_Int n') -> Value.V_Int()
  | (E.And, Value.V_Int n, Value.V_Int n') -> failwith "typeerror"
  | (E.Or, Value.V_Int n, Value.V_Int n') -> failwith "typeerror"
  | (E.Eq, Value.V_Int n, Value.V_Int n') -> Value.V.Bool(n=n')
  | (E.Ne, Value.V_Int n, Value.V_Int n') -> Value.V.Bool(n not = n')
  | (E.Lt, Value.V_Int n, Value.V_Int n') -> Value.V.Bool(n < n')
  | (E.Le, Value.V_Int n, Value.V_Int n') -> Value.V.Bool(n <= n')
  | (E.Gt, Value.V_Int n, Value.V_Int n') -> Value.V.Bool(n > n')
  | (E.Ge, Value.V_Int n, Value.V_Int n') -> Value.V.Bool(n >= n')
  | (E.Plus, Value.V.Bool b, Value.V.Bool b') -> failwith "typeerror"
  | (E.Minus, Value.V.Bool b, Value.V.Bool b') -> failwith "typeerror"
  | (E.Times, Value.V.Bool b, Value.V.Bool b') -> failwith "typeerror"
  | (E.Div, Value.V.Bool b, Value.V.Bool b') -> failwith "typeerror"
  | (E.Mod, Value.V.Bool b, Value.V.Bool b') -> failwith "typeerror"
  | (E.And, Value.V.Bool b, Value.V.Bool b') -> Value.V.Bool(b & b')
  | (E.Or, Value.V.Bool b, Value.V.Bool b') -> Value.V.Bool(b or b')
  | (E.Eq, Value.V.Bool b, Value.V.Bool b') -> Value.V.Bool(b = b)
  | (E.Ne, Value.V.Bool b, Value.V.Bool b') -> Value.V.Bool(b not = b')
  | _ -> failwith "Unimplemented"

  (*
  | (E.Lt, Value.V.Bool b, Value.V.Bool b') -> Value.V.Bool(b < b')
  | (E.Le, Value.V.Bool b, Value.V.Bool b') -> Value.V.Bool(b <= n')
  | (E.Gt, Value.V.Bool b, Value.V.Bool b') -> Value.V.Bool(b > b')
  | (E.Ge, Value.V.Bool b, Value.V.Bool b') -> Value.V.Bool(b >= b')

  | (E.Plus, Value.V_Int n, Value.V.Bool b) -> 
  | (E.Minus, Value.V_Int n, Value.V.Bool b) -> 
  | (E.Times, Value.V_Int n, Value.V.Bool b) -> 
  | (E.Div, Value.V_Int n, Value.V.Bool b) -> 
  | (E.Mod, Value.V_Int n, Value.V.Bool b) -> 
  | (E.And, Value.V_Int n, Value.V.Bool b) -> 
  | (E.Or, Value.V_Int n, Value.V.Bool b) ->
  | (E.Eq, Value.V_Int n, Value.V.Bool b) -> 
  | (E.Ne, Value.V_Int n, Value.V.Bool b) ->
  | (E.Lt, Value.V_Int n, Value.V.Bool b) -> 
  | (E.Le, Value.V_Int n, Value.V.Bool b) -> 
  | (E.Gt, Value.V_Int n, Value.V.Bool b) -> 
  | (E.Ge, Value.V_Int n, Value.V.Bool b) -> 
*)

let unop(sign: E.unop) (v: Value.t): Value.t =
  match (sign, v) with
  | (E.Neg, Value.V_Int n) -> Value.V_Int(-n)
  | (E.Neg, Value.V_Bool b) -> failwith "typeerror"
  | (E.Not, Value.V_Bool b) -> Value.V_Bool(not b)
  | (E.Not, Value.V_Int n) -> failwith "typeerror"
  
let if(v:Value.t) (v0:Value.t) (v1:Value.t): Value.t =
  match (v,v0,v1) with
  | (Value.V_Bool b = true, , ) ->
  | (Value.V_Bool) b = false, , ) ->

  (*NEED TO FINISH IMPLEMEENTING*)




let rec exec(rho:Env.t) (e: E.t) : Value.t =
  match e with
(*! end !*)
  | E.Var x -> Env.lookup rho x

  | E.Num n -> Value.V_Int n

  | E.Bool (b) -> Value.V_Bool b

  | E.Unop (sign,e) -> 
    let v=exec rho e in
    unop sign v

  | E.Binop (op, e, e') ->
    let v = exec rho e in
    let v' = exec rho e' in
    binop op v v'

  | E.If(e,e0,e1) -> 
    let v=exec rho e in
    let v0=exec rho e0 in
    let v1=exec rho e1 in
    if v v0 v1

  | E.Let (x, e', e) ->
    let v' = exec rho e' in
    exec (Env.update rho x v') e

  | E.Call (x, e) -> 
    (*NEED TO IMPLEMEENT*)
  


(* exec p = v, where `v` is the result of executing `p`.
 *)
let exec (_ : Ast.Script.t) : Value.t =
  failwith "Unimplemented:  Core.Interp.exec"

