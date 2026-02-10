module type S = sig

  module Ast : sig 

    module Id : sig
      type t
      val show : t -> string
    end

    module Expr : sig
      type t
      val show : t -> string
    end

    module Script : sig
      type fundef
      type t = Pgm of (fundef list)*Expr.t
      val show : t -> string
    end

  end

  module Parser : sig 
    exception Error

    type token

    val terminated_pgm :
      (Lexing.lexbuf -> token) -> Lexing.lexbuf -> Ast.Script.t

    val terminated_exp :
      (Lexing.lexbuf -> token) -> Lexing.lexbuf -> Ast.Expr.t

  end

  module Lexer : sig 
    val read_token : Lexing.lexbuf -> Parser.token
  end

  module Interp : sig
    exception UnboundVariable of Ast.Id.t
    exception UndefinedFunction of Ast.Id.t
    exception TypeError of string

    module Value : sig
      type t
      val to_string : t -> string
    end

    module Env : sig
      type t
    end

    val exec : Ast.Script.t -> Value.t
  end

end

module Challenge : S = struct
  module Ast = Challenge_ast
  module Interp = Challenge_interp
  module Lexer = Challenge_lexer
  module Parser = Challenge_parser
end

module Core : S = struct
  module Ast = Core_ast
  module Interp = Core_interp
  module Lexer = Core_lexer
  module Parser = Core_parser
end

let choose_impl (mode : string) : (module S) =
  match mode with
  | "core" -> (module Core)
  | "challenge" -> (module Challenge)
  | _ -> raise @@ Invalid_argument mode

