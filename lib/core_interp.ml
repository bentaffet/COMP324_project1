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
(*! end !*)
(*! binop plus !*)
  | (E.Plus, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n + n')
(*! end !*)
  | (E.Minus, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n - n')
  | (E.Times, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n * n')
  | (E.Div, Value.V_Int n, Value.V_Int n') -> Value.V_Int (n / n')
  | _ -> failwith "Unimplemented"


let rec exec(rho:Env.t) (e: E.t) : Value.t =
  match e with
(*! end !*)
  | E.Var x -> Env.lookup rho x
  | E.Num n -> Value.V_Int n
  (*| E.Neg  ->
    let V_Int n = exec rho e in
    V_Int (-n)*)
(*! eval binop !*)
  | E.Binop (op, e, e') ->
    let v = exec rho e in
    let v' = exec rho e' in
    binop op v v'
(*! end !*)
(*! eval let !*)
  | E.Let (x, e', e) ->
    let v' = exec rho e' in
    exec (Env.update rho x v') e
  | E.Call (x, e) -> e
    


(* exec p = v, where `v` is the result of executing `p`.
 *)
let exec (_ : Ast.Script.t) : Value.t =
  failwith "Unimplemented:  Core.Interp.exec"

