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
  | (E.Mod, Value.V_Int n, Value.V_Int n') -> Value.V_Int(n mod n')
  | (E.Eq, Value.V_Int n, Value.V_Int n') -> Value.V_Bool(n=n')
  | (E.Ne, Value.V_Int n, Value.V_Int n') -> Value.V_Bool(n <> n')
  | (E.Lt, Value.V_Int n, Value.V_Int n') -> Value.V_Bool(n < n')
  | (E.Le, Value.V_Int n, Value.V_Int n') -> Value.V_Bool(n <= n')
  | (E.Gt, Value.V_Int n, Value.V_Int n') -> Value.V_Bool(n > n')
  | (E.Ge, Value.V_Int n, Value.V_Int n') -> Value.V_Bool(n >= n')
  | (E.And, Value.V_Bool b, Value.V_Bool b') -> Value.V_Bool(b && b')
  | (E.Or, Value.V_Bool b, Value.V_Bool b') -> Value.V_Bool(b || b')
  | (E.Eq, Value.V_Bool b, Value.V_Bool b') -> Value.V_Bool(b = b')
  | (E.Ne, Value.V_Bool b, Value.V_Bool b') -> Value.V_Bool(b <> b')
  | _ -> raise (TypeError "invalid operands for binary operator")


  

let unop(sign: E.unop) (v: Value.t): Value.t =
  match (sign, v) with
  | (E.Neg, Value.V_Int n) -> Value.V_Int(-n)
  | (E.Not, Value.V_Bool b) -> Value.V_Bool(not b)
  | _ -> raise (TypeError "invalid operands for unary operator")

 

let conditional(v:Value.t) (v0:Value.t) (v1:Value.t): Value.t =
  match v with
  | Value.V_Bool true  -> v0
  | Value.V_Bool false -> v1
  | _ -> raise (TypeError "if condition must be boolean")

let rec eval (rho:Env.t) (e: E.t) : Value.t =
  match e with
(*! end !*)
  | E.Var x -> Env.lookup rho x

  | E.Num n -> Value.V_Int n

  | E.Bool (b) -> Value.V_Bool b

  | E.Unop (sign,e) -> 
    let v=eval rho e in
    unop sign v

  | E.Binop (op, e, e') ->
    let v = eval rho e in
    let v' = eval rho e' in
    binop op v v'

  | E.If(e,e0,e1) -> 
    let v = eval rho e in
    let v0 = eval rho e0 in
    let v1 = eval rho e1 in 
    conditional v v0 v1
      

  | E.Let (x, e', e) ->
    let v' = eval rho e' in
    eval (Env.update rho x v') e

 (* | E.Call (x, e) -> *)
    (*NEED TO IMPLEMEENT*)

  | _ -> failwith "Unimplemented"

  


(* exec p = v, where `v` is the result of executing `p`.
 *)
let exec (p : Ast.Script.t) : Value.t =
  match p with
  | Ast.Script.Pgm (_funs, e) ->
      eval Env.empty e

