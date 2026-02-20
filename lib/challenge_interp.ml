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
    | V_Fun of Env.t * Ast.Id.t list * Ast.Expr.t
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

let rec lookup_fundef (funs :Ast.Script.fundef list) (f : Ast.Id.t) : (Ast.Id.t list * E.t) =
  match funs with
  | [] -> raise (UndefinedFunction f)
  | (name, params, body) :: rest ->
      if name = f then (params, body)
      else lookup_fundef rest f


let rec eval (funs : Ast.Script.fundef list)(rho:Env.t) (e: E.t) : Value.t =
  match e with
(*! end !*)
  | E.Var x -> Env.lookup rho x

  | E.Num n -> Value.V_Int n

  | E.Bool (b) -> Value.V_Bool b

  | E.Unop (sign,e) -> 
    let v=eval funs rho e in
    unop sign v

  | E.Binop (op, e, e') ->
    let v = eval funs rho e in
    let v' = eval funs rho e' in
    binop op v v'

  | E.If(e,e0,e1) -> 
    let v = eval funs rho e in
    (match v with
  | Value.V_Bool true  -> eval funs rho e0 
  | Value.V_Bool false -> eval funs rho e1
  | _ -> raise (TypeError "if condition must be boolean"))
      

  | E.Let (x, e', e) ->
    let v' = eval funs rho e' in
    eval funs (Env.update rho x v') e


 | E.Call (f, arg_expressions) ->
    let (params, body) = lookup_fundef funs f in
    let n = List.length arg_expressions in
    let m = List.length params in
    if n > m then
      raise (TypeError "Too many arguments for function") (* error here bc n > m *)


    (* Use previous logic from core interpreter *)
    else if n = m then 
      let arg_values = List.map (fun arg_e -> eval funs rho arg_e) arg_expressions in
      let new_rho = List.combine params arg_values in
      eval funs new_rho body

    (* Case when n < m 
    Split the params into the ones we bind now and the leftovers
    *)
    else 
      let arg_values = List.map (fun arg_e -> eval funs rho arg_e) arg_expressions in
      let rec split_params n params_acc remaining_params = 
        (* Where n is num of args we have, params_acc is accumilator for first n params we bind now, remaining params is rest of param list we go through*)
        (* Base case is n = 0 or no params left, recursive step i'm not sure *)
          match n, remaining_params with
            | 0, _ -> (List.rev params_acc, remaining_params)   
            | _, [] -> (List.rev params_acc, remaining_params)  
            | n, p::ps -> 
     
  

            
      | _ -> raise(UnboundVariable "Error")



(* exec p = v, where `v` is the result of executing `p`.
 *)
let exec (p : Ast.Script.t) : Value.t =
  match p with
  | Ast.Script.Pgm (funs, e) ->
      eval funs Env.empty e

