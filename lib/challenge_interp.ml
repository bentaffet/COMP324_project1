(* Ocaml- interpreter.
 *
 * N. Danner
 *)

module Ast = Challenge_ast
module E = Ast.Expr

exception UndefinedFunction of Ast.Id.t
exception UnboundVariable of Ast.Id.t
exception TypeError of string

type value_t = 
  | V_Int of int
  | V_Bool of bool
  | V_Fun of env_t * Ast.Id.t list * Ast.Expr.t
and env_t = (Ast.Id.t * value_t) list
[@@deriving show]

module Value = struct
  type t = value_t = 
    | V_Int of int
    | V_Bool of bool
    | V_Fun of env_t * Ast.Id.t list * Ast.Expr.t

  let to_string (v : t) : string =
    match v with
    | V_Int n -> Int.to_string n
    | V_Bool b -> Bool.to_string b
    | V_Fun _ -> "<fun>" 
end

module Env = struct
  type t = env_t

  let empty : t = [] 

  let lookup (rho : t) (x : Ast.Id.t) : Value.t = 
    List.assoc x rho

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



 | E.Call (e_fn, arg_expressions) ->
    let v_fn = eval funs rho e_fn in

    (match v_fn with
    | Value.V_Fun (closure_rho, params, body) ->   
      let n = List.length arg_expressions in
      let m = List.length params in

      let arg_values = List.map (eval funs rho) arg_expressions in

    if n > m then
      raise (TypeError "Too many arguments for function") 

    (* Use previous logic from core interpreter *)
    else if n = m then 
      let paired_args = List.combine params arg_values in
      let new_rho = List.fold_left (fun env (p, v) -> Env.update env p v) closure_rho paired_args in
      eval funs new_rho body

    (* Case when n < m 
    Split the params into the ones we bind now and the leftovers
    *)
    else 
      let rec split_params k params_acc remaining_params = 
        (* Where n is num of args we have, params_acc is accumilator for first n params we bind now, remaining params is rest of param list we go through*)
        (* Base case is n = 0 or no params left, recursive step i'm not sure *)
          match k, remaining_params with
            | 0, _ -> (List.rev params_acc, remaining_params)   
            | _, [] -> (List.rev params_acc, remaining_params)  
            | k, p::ps -> split_params (k - 1) (p :: params_acc) ps

          in

          let (bound_params, leftover_params) = split_params n [] params in

          let paired_args = List.combine bound_params arg_values in
          let new_rho = List.fold_left (fun env (p, v) -> Env.update env p v) closure_rho paired_args in

          Value.V_Fun (new_rho, leftover_params, body)
            
      | _ -> raise(UnboundVariable "Error") )

| E.Fun (params, body) ->
  Value.V_Fun (rho, params, body)


(* exec p = v, where `v` is the result of executing `p`.
 *)
let exec (p : Ast.Script.t) : Value.t =
  match p with
  | Ast.Script.Pgm (funs, e) ->
      eval funs Env.empty e

