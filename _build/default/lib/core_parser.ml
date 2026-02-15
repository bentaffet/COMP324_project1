
module MenhirBasics = struct
  
  exception Error
  
  let _eRR =
    fun _s ->
      raise Error
  
  type token = 
    | TIMES
    | THEN
    | SEMI
    | RPAREN
    | PLUS
    | OR
    | NUM of (
# 18 "lib/core_parser.mly"
       (int)
# 21 "lib/core_parser.ml"
  )
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
    | ID of (
# 16 "lib/core_parser.mly"
       (string)
# 38 "lib/core_parser.ml"
  )
    | GT
    | GE
    | EQ
    | EOF
    | ELSE
    | DIV
    | BOOL of (
# 19 "lib/core_parser.mly"
       (bool)
# 49 "lib/core_parser.ml"
  )
    | AND
  
end

include MenhirBasics

# 6 "lib/core_parser.mly"
  
    open Core_ast.Expr
    open Core_ast.Script

    let rec left_assoc e es =
        match es with
        | [] -> e
        | (b, e') :: es -> left_assoc (Binop(b, e, e')) es

# 67 "lib/core_parser.ml"

type ('s, 'r) _menhir_state = 
  | MenhirState000 : ('s, _menhir_box_terminated_exp) _menhir_state
    (** State 000.
        Stack shape : .
        Start symbol: terminated_exp. *)

  | MenhirState002 : (('s, 'r) _menhir_cell1_NOT, 'r) _menhir_state
    (** State 002.
        Stack shape : NOT.
        Start symbol: <undetermined>. *)

  | MenhirState003 : (('s, 'r) _menhir_cell1_LPAREN, 'r) _menhir_state
    (** State 003.
        Stack shape : LPAREN.
        Start symbol: <undetermined>. *)

  | MenhirState004 : (('s, 'r) _menhir_cell1_MINUS, 'r) _menhir_state
    (** State 004.
        Stack shape : MINUS.
        Start symbol: <undetermined>. *)

  | MenhirState005 : (('s, 'r) _menhir_cell1_ID, 'r) _menhir_state
    (** State 005.
        Stack shape : ID.
        Start symbol: <undetermined>. *)

  | MenhirState009 : (('s, 'r) _menhir_cell1_aexp, 'r) _menhir_state
    (** State 009.
        Stack shape : aexp.
        Start symbol: <undetermined>. *)

  | MenhirState015 : (('s, 'r) _menhir_cell1_LET _menhir_cell0_ID, 'r) _menhir_state
    (** State 015.
        Stack shape : LET ID.
        Start symbol: <undetermined>. *)

  | MenhirState016 : (('s, 'r) _menhir_cell1_IF, 'r) _menhir_state
    (** State 016.
        Stack shape : IF.
        Start symbol: <undetermined>. *)

  | MenhirState017 : (('s, 'r) _menhir_cell1_unop, 'r) _menhir_state
    (** State 017.
        Stack shape : unop.
        Start symbol: <undetermined>. *)

  | MenhirState018 : (('s, 'r) _menhir_cell1_TIMES, 'r) _menhir_state
    (** State 018.
        Stack shape : TIMES.
        Start symbol: <undetermined>. *)

  | MenhirState021 : (('s, 'r) _menhir_cell1_MOD, 'r) _menhir_state
    (** State 021.
        Stack shape : MOD.
        Start symbol: <undetermined>. *)

  | MenhirState023 : (('s, 'r) _menhir_cell1_DIV, 'r) _menhir_state
    (** State 023.
        Stack shape : DIV.
        Start symbol: <undetermined>. *)

  | MenhirState025 : (('s, 'r) _menhir_cell1_op_sep_list_rest_mdops_unop_, 'r) _menhir_state
    (** State 025.
        Stack shape : op_sep_list_rest(mdops,unop).
        Start symbol: <undetermined>. *)

  | MenhirState029 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 029.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState033 : (('s, 'r) _menhir_cell1_mdexp, 'r) _menhir_state
    (** State 033.
        Stack shape : mdexp.
        Start symbol: <undetermined>. *)

  | MenhirState034 : (('s, 'r) _menhir_cell1_PLUS, 'r) _menhir_state
    (** State 034.
        Stack shape : PLUS.
        Start symbol: <undetermined>. *)

  | MenhirState036 : (('s, 'r) _menhir_cell1_MINUS, 'r) _menhir_state
    (** State 036.
        Stack shape : MINUS.
        Start symbol: <undetermined>. *)

  | MenhirState038 : (('s, 'r) _menhir_cell1_op_sep_list_rest_pmops_mdexp_, 'r) _menhir_state
    (** State 038.
        Stack shape : op_sep_list_rest(pmops,mdexp).
        Start symbol: <undetermined>. *)

  | MenhirState041 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 041.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState043 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 043.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState045 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 045.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState047 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 047.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState049 : (('s, 'r) _menhir_cell1_pmexp, 'r) _menhir_state
    (** State 049.
        Stack shape : pmexp.
        Start symbol: <undetermined>. *)

  | MenhirState056 : ((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 056.
        Stack shape : IF exp.
        Start symbol: <undetermined>. *)

  | MenhirState058 : (((('s, 'r) _menhir_cell1_IF, 'r) _menhir_cell1_exp, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 058.
        Stack shape : IF exp exp.
        Start symbol: <undetermined>. *)

  | MenhirState060 : (('s, 'r) _menhir_cell1_compexp, 'r) _menhir_state
    (** State 060.
        Stack shape : compexp.
        Start symbol: <undetermined>. *)

  | MenhirState061 : (('s, 'r) _menhir_cell1_AND, 'r) _menhir_state
    (** State 061.
        Stack shape : AND.
        Start symbol: <undetermined>. *)

  | MenhirState063 : (('s, 'r) _menhir_cell1_op_sep_list_rest___anonymous_1_compexp_, 'r) _menhir_state
    (** State 063.
        Stack shape : op_sep_list_rest(__anonymous_1,compexp).
        Start symbol: <undetermined>. *)

  | MenhirState066 : (('s, 'r) _menhir_cell1_andexp, 'r) _menhir_state
    (** State 066.
        Stack shape : andexp.
        Start symbol: <undetermined>. *)

  | MenhirState067 : (('s, 'r) _menhir_cell1_OR, 'r) _menhir_state
    (** State 067.
        Stack shape : OR.
        Start symbol: <undetermined>. *)

  | MenhirState069 : (('s, 'r) _menhir_cell1_op_sep_list_rest___anonymous_0_andexp_, 'r) _menhir_state
    (** State 069.
        Stack shape : op_sep_list_rest(__anonymous_0,andexp).
        Start symbol: <undetermined>. *)

  | MenhirState073 : ((('s, 'r) _menhir_cell1_LET _menhir_cell0_ID, 'r) _menhir_cell1_exp, 'r) _menhir_state
    (** State 073.
        Stack shape : LET ID exp.
        Start symbol: <undetermined>. *)

  | MenhirState082 : ('s, _menhir_box_terminated_pgm) _menhir_state
    (** State 082.
        Stack shape : .
        Start symbol: terminated_pgm. *)

  | MenhirState083 : (('s, _menhir_box_terminated_pgm) _menhir_cell1_ID, _menhir_box_terminated_pgm) _menhir_state
    (** State 083.
        Stack shape : ID.
        Start symbol: terminated_pgm. *)

  | MenhirState084 : ((('s, _menhir_box_terminated_pgm) _menhir_cell1_ID, _menhir_box_terminated_pgm) _menhir_cell1_ID, _menhir_box_terminated_pgm) _menhir_state
    (** State 084.
        Stack shape : ID ID.
        Start symbol: terminated_pgm. *)

  | MenhirState087 : ((('s, _menhir_box_terminated_pgm) _menhir_cell1_ID, _menhir_box_terminated_pgm) _menhir_cell1_list_ID_, _menhir_box_terminated_pgm) _menhir_state
    (** State 087.
        Stack shape : ID list(ID).
        Start symbol: terminated_pgm. *)

  | MenhirState089 : (('s, _menhir_box_terminated_pgm) _menhir_cell1_fundef, _menhir_box_terminated_pgm) _menhir_state
    (** State 089.
        Stack shape : fundef.
        Start symbol: terminated_pgm. *)

  | MenhirState090 : (('s, _menhir_box_terminated_pgm) _menhir_cell1_KWAND, _menhir_box_terminated_pgm) _menhir_state
    (** State 090.
        Stack shape : KWAND.
        Start symbol: terminated_pgm. *)

  | MenhirState092 : (('s, _menhir_box_terminated_pgm) _menhir_cell1_morefundefs, _menhir_box_terminated_pgm) _menhir_state
    (** State 092.
        Stack shape : morefundefs.
        Start symbol: terminated_pgm. *)

  | MenhirState100 : ('s _menhir_cell0_option_mainfundef_, _menhir_box_terminated_pgm) _menhir_state
    (** State 100.
        Stack shape : option(mainfundef).
        Start symbol: terminated_pgm. *)


and ('s, 'r) _menhir_cell1_aexp = 
  | MenhirCell1_aexp of 's * ('s, 'r) _menhir_state * (Core_ast.Expr.t)

and ('s, 'r) _menhir_cell1_andexp = 
  | MenhirCell1_andexp of 's * ('s, 'r) _menhir_state * (Core_ast.Expr.t)

and ('s, 'r) _menhir_cell1_compexp = 
  | MenhirCell1_compexp of 's * ('s, 'r) _menhir_state * (Core_ast.Expr.t)

and ('s, 'r) _menhir_cell1_exp = 
  | MenhirCell1_exp of 's * ('s, 'r) _menhir_state * (Core_ast.Expr.t)

and ('s, 'r) _menhir_cell1_fundef = 
  | MenhirCell1_fundef of 's * ('s, 'r) _menhir_state * (Core_ast.Script.fundef)

and ('s, 'r) _menhir_cell1_list_ID_ = 
  | MenhirCell1_list_ID_ of 's * ('s, 'r) _menhir_state * (string list)

and ('s, 'r) _menhir_cell1_mdexp = 
  | MenhirCell1_mdexp of 's * ('s, 'r) _menhir_state * (Core_ast.Expr.t)

and ('s, 'r) _menhir_cell1_morefundefs = 
  | MenhirCell1_morefundefs of 's * ('s, 'r) _menhir_state * (Core_ast.Script.fundef)

and ('s, 'r) _menhir_cell1_op_sep_list_rest___anonymous_0_andexp_ = 
  | MenhirCell1_op_sep_list_rest___anonymous_0_andexp_ of 's * ('s, 'r) _menhir_state * (Core_ast.Expr.binop * Core_ast.Expr.t)

and ('s, 'r) _menhir_cell1_op_sep_list_rest___anonymous_1_compexp_ = 
  | MenhirCell1_op_sep_list_rest___anonymous_1_compexp_ of 's * ('s, 'r) _menhir_state * (Core_ast.Expr.binop * Core_ast.Expr.t)

and ('s, 'r) _menhir_cell1_op_sep_list_rest_mdops_unop_ = 
  | MenhirCell1_op_sep_list_rest_mdops_unop_ of 's * ('s, 'r) _menhir_state * (Core_ast.Expr.binop * Core_ast.Expr.t)

and ('s, 'r) _menhir_cell1_op_sep_list_rest_pmops_mdexp_ = 
  | MenhirCell1_op_sep_list_rest_pmops_mdexp_ of 's * ('s, 'r) _menhir_state * (Core_ast.Expr.binop * Core_ast.Expr.t)

and 's _menhir_cell0_option_mainfundef_ = 
  | MenhirCell0_option_mainfundef_ of 's * (Core_ast.Script.fundef list option)

and ('s, 'r) _menhir_cell1_pmexp = 
  | MenhirCell1_pmexp of 's * ('s, 'r) _menhir_state * (Core_ast.Expr.t)

and ('s, 'r) _menhir_cell1_unop = 
  | MenhirCell1_unop of 's * ('s, 'r) _menhir_state * (Core_ast.Expr.t)

and ('s, 'r) _menhir_cell1_AND = 
  | MenhirCell1_AND of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_DIV = 
  | MenhirCell1_DIV of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_ID = 
  | MenhirCell1_ID of 's * ('s, 'r) _menhir_state * (
# 16 "lib/core_parser.mly"
       (string)
# 326 "lib/core_parser.ml"
)

and 's _menhir_cell0_ID = 
  | MenhirCell0_ID of 's * (
# 16 "lib/core_parser.mly"
       (string)
# 333 "lib/core_parser.ml"
)

and ('s, 'r) _menhir_cell1_IF = 
  | MenhirCell1_IF of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_KWAND = 
  | MenhirCell1_KWAND of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LET = 
  | MenhirCell1_LET of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_LPAREN = 
  | MenhirCell1_LPAREN of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MINUS = 
  | MenhirCell1_MINUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_MOD = 
  | MenhirCell1_MOD of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_NOT = 
  | MenhirCell1_NOT of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_OR = 
  | MenhirCell1_OR of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_PLUS = 
  | MenhirCell1_PLUS of 's * ('s, 'r) _menhir_state

and ('s, 'r) _menhir_cell1_TIMES = 
  | MenhirCell1_TIMES of 's * ('s, 'r) _menhir_state

and _menhir_box_terminated_pgm = 
  | MenhirBox_terminated_pgm of (Core_ast.Script.t) [@@unboxed]

and _menhir_box_terminated_exp = 
  | MenhirBox_terminated_exp of (Core_ast.Expr.t) [@@unboxed]

let _menhir_action_02 =
  fun x ->
    (
# 136 "lib/core_parser.mly"
        ( Var x )
# 377 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_03 =
  fun i ->
    (
# 138 "lib/core_parser.mly"
        ( Num i )
# 385 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_04 =
  fun b ->
    (
# 140 "lib/core_parser.mly"
        ( Bool b )
# 393 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_05 =
  fun e ->
    (
# 142 "lib/core_parser.mly"
        ( e )
# 401 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_06 =
  fun p ->
    (
# 87 "lib/core_parser.mly"
        ( let (e, opsexps) = p in left_assoc e opsexps )
# 409 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_07 =
  fun es f ->
    (
# 130 "lib/core_parser.mly"
        ( Call(f, es) )
# 417 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_08 =
  fun e ->
    (
# 132 "lib/core_parser.mly"
        ( e )
# 425 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_09 =
  fun e0 e1 ->
    let op = 
# 90 "lib/core_parser.mly"
            ( Eq )
# 433 "lib/core_parser.ml"
     in
    (
# 99 "lib/core_parser.mly"
        ( Binop(op, e0, e1) )
# 438 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_10 =
  fun e0 e1 ->
    let op = 
# 91 "lib/core_parser.mly"
            ( Ne )
# 446 "lib/core_parser.ml"
     in
    (
# 99 "lib/core_parser.mly"
        ( Binop(op, e0, e1) )
# 451 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_11 =
  fun e0 e1 ->
    let op = 
# 92 "lib/core_parser.mly"
            ( Lt )
# 459 "lib/core_parser.ml"
     in
    (
# 99 "lib/core_parser.mly"
        ( Binop(op, e0, e1) )
# 464 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_12 =
  fun e0 e1 ->
    let op = 
# 93 "lib/core_parser.mly"
            ( Le )
# 472 "lib/core_parser.ml"
     in
    (
# 99 "lib/core_parser.mly"
        ( Binop(op, e0, e1) )
# 477 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_13 =
  fun e0 e1 ->
    let op = 
# 94 "lib/core_parser.mly"
            ( Gt )
# 485 "lib/core_parser.ml"
     in
    (
# 99 "lib/core_parser.mly"
        ( Binop(op, e0, e1) )
# 490 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_14 =
  fun e0 e1 ->
    let op = 
# 95 "lib/core_parser.mly"
            ( Ge )
# 498 "lib/core_parser.ml"
     in
    (
# 99 "lib/core_parser.mly"
        ( Binop(op, e0, e1) )
# 503 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_15 =
  fun e ->
    (
# 101 "lib/core_parser.mly"
        ( e )
# 511 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_16 =
  fun e ->
    (
# 71 "lib/core_parser.mly"
        ( e )
# 519 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_17 =
  fun e f ps ->
    (
# 146 "lib/core_parser.mly"
        ( (f, ps, e) )
# 527 "lib/core_parser.ml"
     : (Core_ast.Script.fundef))

let _menhir_action_18 =
  fun e e0 e1 ->
    (
# 75 "lib/core_parser.mly"
        ( If(e, e0, e1) )
# 535 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_19 =
  fun e0 e1 x ->
    (
# 77 "lib/core_parser.mly"
        ( Let(x, e0, e1) )
# 543 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_20 =
  fun e ->
    (
# 79 "lib/core_parser.mly"
        ( e )
# 551 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_21 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 559 "lib/core_parser.ml"
     : (string list))

let _menhir_action_22 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 567 "lib/core_parser.ml"
     : (string list))

let _menhir_action_23 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 575 "lib/core_parser.ml"
     : (Core_ast.Script.fundef list))

let _menhir_action_24 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 583 "lib/core_parser.ml"
     : (Core_ast.Script.fundef list))

let _menhir_action_25 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 591 "lib/core_parser.ml"
     : ((Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_26 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 599 "lib/core_parser.ml"
     : ((Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_27 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 607 "lib/core_parser.ml"
     : ((Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_28 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 615 "lib/core_parser.ml"
     : ((Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_29 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 623 "lib/core_parser.ml"
     : ((Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_30 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 631 "lib/core_parser.ml"
     : ((Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_31 =
  fun () ->
    (
# 216 "<standard.mly>"
    ( [] )
# 639 "lib/core_parser.ml"
     : ((Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_32 =
  fun x xs ->
    (
# 219 "<standard.mly>"
    ( x :: xs )
# 647 "lib/core_parser.ml"
     : ((Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_33 =
  fun f fs ->
    (
# 154 "lib/core_parser.mly"
        ( f :: fs )
# 655 "lib/core_parser.ml"
     : (Core_ast.Script.fundef list))

let _menhir_action_34 =
  fun p ->
    (
# 118 "lib/core_parser.mly"
        ( let (e, opsexps) = p in left_assoc e opsexps )
# 663 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_35 =
  fun fd ->
    (
# 150 "lib/core_parser.mly"
        ( fd )
# 671 "lib/core_parser.ml"
     : (Core_ast.Script.fundef))

let _menhir_action_36 =
  fun x ->
    (
# 228 "<standard.mly>"
    ( [ x ] )
# 679 "lib/core_parser.ml"
     : (Core_ast.Expr.t list))

let _menhir_action_37 =
  fun x xs ->
    (
# 231 "<standard.mly>"
    ( x :: xs )
# 687 "lib/core_parser.ml"
     : (Core_ast.Expr.t list))

let _menhir_action_38 =
  fun e ->
    let o = 
# 82 "lib/core_parser.mly"
                                     ( Or )
# 695 "lib/core_parser.ml"
     in
    (
# 67 "lib/core_parser.mly"
        ( (o, e) )
# 700 "lib/core_parser.ml"
     : (Core_ast.Expr.binop * Core_ast.Expr.t))

let _menhir_action_39 =
  fun e ->
    let o = 
# 86 "lib/core_parser.mly"
                                      ( And )
# 708 "lib/core_parser.ml"
     in
    (
# 67 "lib/core_parser.mly"
        ( (o, e) )
# 713 "lib/core_parser.ml"
     : (Core_ast.Expr.binop * Core_ast.Expr.t))

let _menhir_action_40 =
  fun e ->
    let o = 
# 112 "lib/core_parser.mly"
            ( Times )
# 721 "lib/core_parser.ml"
     in
    (
# 67 "lib/core_parser.mly"
        ( (o, e) )
# 726 "lib/core_parser.ml"
     : (Core_ast.Expr.binop * Core_ast.Expr.t))

let _menhir_action_41 =
  fun e ->
    let o = 
# 113 "lib/core_parser.mly"
            ( Div )
# 734 "lib/core_parser.ml"
     in
    (
# 67 "lib/core_parser.mly"
        ( (o, e) )
# 739 "lib/core_parser.ml"
     : (Core_ast.Expr.binop * Core_ast.Expr.t))

let _menhir_action_42 =
  fun e ->
    let o = 
# 114 "lib/core_parser.mly"
            ( Mod )
# 747 "lib/core_parser.ml"
     in
    (
# 67 "lib/core_parser.mly"
        ( (o, e) )
# 752 "lib/core_parser.ml"
     : (Core_ast.Expr.binop * Core_ast.Expr.t))

let _menhir_action_43 =
  fun e ->
    let o = 
# 104 "lib/core_parser.mly"
            ( Plus )
# 760 "lib/core_parser.ml"
     in
    (
# 67 "lib/core_parser.mly"
        ( (o, e) )
# 765 "lib/core_parser.ml"
     : (Core_ast.Expr.binop * Core_ast.Expr.t))

let _menhir_action_44 =
  fun e ->
    let o = 
# 105 "lib/core_parser.mly"
            ( Minus )
# 773 "lib/core_parser.ml"
     in
    (
# 67 "lib/core_parser.mly"
        ( (o, e) )
# 778 "lib/core_parser.ml"
     : (Core_ast.Expr.binop * Core_ast.Expr.t))

let _menhir_action_45 =
  fun e opsexps ->
    (
# 63 "lib/core_parser.mly"
        ( (e, opsexps) )
# 786 "lib/core_parser.ml"
     : (Core_ast.Expr.t * (Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_46 =
  fun e opsexps ->
    (
# 63 "lib/core_parser.mly"
        ( (e, opsexps) )
# 794 "lib/core_parser.ml"
     : (Core_ast.Expr.t * (Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_47 =
  fun e opsexps ->
    (
# 63 "lib/core_parser.mly"
        ( (e, opsexps) )
# 802 "lib/core_parser.ml"
     : (Core_ast.Expr.t * (Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_48 =
  fun e opsexps ->
    (
# 63 "lib/core_parser.mly"
        ( (e, opsexps) )
# 810 "lib/core_parser.ml"
     : (Core_ast.Expr.t * (Core_ast.Expr.binop * Core_ast.Expr.t) list))

let _menhir_action_49 =
  fun () ->
    (
# 111 "<standard.mly>"
    ( None )
# 818 "lib/core_parser.ml"
     : (Core_ast.Script.fundef list option))

let _menhir_action_50 =
  fun x ->
    (
# 114 "<standard.mly>"
    ( Some x )
# 826 "lib/core_parser.ml"
     : (Core_ast.Script.fundef list option))

let _menhir_action_51 =
  fun p ->
    (
# 83 "lib/core_parser.mly"
        ( let (e, opsexps) = p in left_assoc e opsexps )
# 834 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_52 =
  fun e fs ->
    (
# 158 "lib/core_parser.mly"
        ( Pgm ((match fs with None -> [] | Some fs' -> fs'), e) )
# 842 "lib/core_parser.ml"
     : (Core_ast.Script.t))

let _menhir_action_53 =
  fun p ->
    (
# 109 "lib/core_parser.mly"
        ( let (e, opsexps) = p in left_assoc e opsexps )
# 850 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_54 =
  fun e ->
    (
# 161 "lib/core_parser.mly"
                                    ( e )
# 858 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_55 =
  fun p ->
    (
# 164 "lib/core_parser.mly"
                                    ( p )
# 866 "lib/core_parser.ml"
     : (Core_ast.Script.t))

let _menhir_action_56 =
  fun e ->
    (
# 122 "lib/core_parser.mly"
        ( Unop(Neg, e) )
# 874 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_57 =
  fun e ->
    (
# 124 "lib/core_parser.mly"
        ( Unop(Not, e) )
# 882 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_action_58 =
  fun e ->
    (
# 126 "lib/core_parser.mly"
        ( e )
# 890 "lib/core_parser.ml"
     : (Core_ast.Expr.t))

let _menhir_print_token : token -> string =
  fun _tok ->
    match _tok with
    | AND ->
        "AND"
    | BOOL _ ->
        "BOOL"
    | DIV ->
        "DIV"
    | ELSE ->
        "ELSE"
    | EOF ->
        "EOF"
    | EQ ->
        "EQ"
    | GE ->
        "GE"
    | GT ->
        "GT"
    | ID _ ->
        "ID"
    | IF ->
        "IF"
    | IN ->
        "IN"
    | KWAND ->
        "KWAND"
    | LE ->
        "LE"
    | LET ->
        "LET"
    | LETREC ->
        "LETREC"
    | LPAREN ->
        "LPAREN"
    | LT ->
        "LT"
    | MINUS ->
        "MINUS"
    | MOD ->
        "MOD"
    | NE ->
        "NE"
    | NOT ->
        "NOT"
    | NUM _ ->
        "NUM"
    | OR ->
        "OR"
    | PLUS ->
        "PLUS"
    | RPAREN ->
        "RPAREN"
    | SEMI ->
        "SEMI"
    | THEN ->
        "THEN"
    | TIMES ->
        "TIMES"

let _menhir_fail : unit -> 'a =
  fun () ->
    Printf.eprintf "Internal failure -- please contact the parser generator's developers.\n%!";
    assert false

include struct
  
  [@@@ocaml.warning "-4-37"]
  
  let _menhir_run_101 : type  ttv_stack. ttv_stack _menhir_cell0_option_mainfundef_ -> _ -> _ -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | SEMI ->
              let _tok = _menhir_lexer _menhir_lexbuf in
              let MenhirCell0_option_mainfundef_ (_menhir_stack, fs) = _menhir_stack in
              let e = _v in
              let _v = _menhir_action_52 e fs in
              (match (_tok : MenhirBasics.token) with
              | EOF ->
                  let p = _v in
                  let _v = _menhir_action_55 p in
                  MenhirBox_terminated_pgm _v
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  let _menhir_run_079 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_terminated_exp =
    fun _menhir_stack _v _tok ->
      match (_tok : MenhirBasics.token) with
      | EOF ->
          let e = _v in
          let _v = _menhir_action_54 e in
          MenhirBox_terminated_exp _v
      | _ ->
          _eRR ()
  
  let rec _menhir_run_001 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let i = _v in
      let _v = _menhir_action_03 i in
      _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_aexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState100 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState002 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState016 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState049 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState041 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState034 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_012 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState009 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState005 ->
          _menhir_run_009 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_012 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let e = _v in
      let _v = _menhir_action_08 e in
      _menhir_goto_appexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_appexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState002 ->
          _menhir_run_077 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState100 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState016 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState049 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState041 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState034 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState023 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState021 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState018 ->
          _menhir_run_020 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState004 ->
          _menhir_run_011 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_077 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_NOT -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_NOT (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_57 e in
      _menhir_goto_unop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_unop : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState023 ->
          _menhir_run_024 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState021 ->
          _menhir_run_022 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState018 ->
          _menhir_run_019 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState100 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState049 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState041 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState036 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState034 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState016 ->
          _menhir_run_017 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_024 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_DIV -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_DIV (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_41 e in
      _menhir_goto_op_sep_list_rest_mdops_unop_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_op_sep_list_rest_mdops_unop_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_op_sep_list_rest_mdops_unop_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | MOD ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | DIV ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState025
      | AND | ELSE | EOF | EQ | GE | GT | IN | KWAND | LE | LT | MINUS | NE | OR | PLUS | RPAREN | SEMI | THEN ->
          let _v_0 = _menhir_action_29 () in
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_018 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_TIMES (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState018 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_002 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_NOT (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState002 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_003 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LPAREN (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState003 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_004 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState004 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_005 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v_0 ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState005
      | LPAREN ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState005
      | ID _v_1 ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState005
      | BOOL _v_2 ->
          let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState005
      | AND | DIV | ELSE | EOF | EQ | GE | GT | IN | KWAND | LE | LT | MINUS | MOD | NE | OR | PLUS | RPAREN | SEMI | THEN | TIMES ->
          let x = _v in
          let _v = _menhir_action_02 x in
          _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_006 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let x = _v in
      let _v = _menhir_action_02 x in
      _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_007 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      let b = _v in
      let _v = _menhir_action_04 b in
      _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_013 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_LET (_menhir_stack, _menhir_s) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          let _menhir_stack = MenhirCell0_ID (_menhir_stack, _v) in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | EQ ->
              let _menhir_s = MenhirState015 in
              let _tok = _menhir_lexer _menhir_lexbuf in
              (match (_tok : MenhirBasics.token) with
              | NUM _v ->
                  _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | NOT ->
                  _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | MINUS ->
                  _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LPAREN ->
                  _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | LET ->
                  _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | IF ->
                  _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
              | ID _v ->
                  _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | BOOL _v ->
                  _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
              | _ ->
                  _eRR ())
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_016 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_IF (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState016 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_021 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MOD (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState021 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_023 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_DIV (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState023 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_026 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_op_sep_list_rest_mdops_unop_ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_op_sep_list_rest_mdops_unop_ (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_30 x xs in
      _menhir_goto_list_op_sep_list_rest_mdops_unop__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_op_sep_list_rest_mdops_unop__ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState017 ->
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState025 ->
          _menhir_run_026 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_027 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_unop -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_unop (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let opsexps = _v in
      let _v = _menhir_action_47 e opsexps in
      let p = _v in
      let _v = _menhir_action_34 p in
      _menhir_goto_mdexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_mdexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState036 ->
          _menhir_run_037 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState034 ->
          _menhir_run_035 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState100 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState016 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState049 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState047 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState045 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState043 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState041 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState029 ->
          _menhir_run_033 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_037 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MINUS (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_44 e in
      _menhir_goto_op_sep_list_rest_pmops_mdexp_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_op_sep_list_rest_pmops_mdexp_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_op_sep_list_rest_pmops_mdexp_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | MINUS ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState038
      | AND | ELSE | EOF | EQ | GE | GT | IN | KWAND | LE | LT | NE | OR | RPAREN | SEMI | THEN ->
          let _v_0 = _menhir_action_31 () in
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_034 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_PLUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState034 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_036 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_MINUS (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState036 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_039 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_op_sep_list_rest_pmops_mdexp_ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_op_sep_list_rest_pmops_mdexp_ (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_32 x xs in
      _menhir_goto_list_op_sep_list_rest_pmops_mdexp__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_op_sep_list_rest_pmops_mdexp__ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState033 ->
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState038 ->
          _menhir_run_039 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_040 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_mdexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_mdexp (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let opsexps = _v in
      let _v = _menhir_action_48 e opsexps in
      let p = _v in
      let _v = _menhir_action_53 p in
      _menhir_goto_pmexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_pmexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState049 ->
          _menhir_run_050 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState047 ->
          _menhir_run_048 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState045 ->
          _menhir_run_046 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState043 ->
          _menhir_run_044 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState041 ->
          _menhir_run_042 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState029 ->
          _menhir_run_030 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState100 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState061 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState016 ->
          _menhir_run_028 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_050 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_09 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_compexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState061 ->
          _menhir_run_062 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState100 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState016 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState067 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_060 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_062 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_AND -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_AND (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_39 e in
      let _menhir_stack = MenhirCell1_op_sep_list_rest___anonymous_1_compexp_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AND ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState063
      | ELSE | EOF | IN | KWAND | OR | RPAREN | SEMI | THEN ->
          let _v_0 = _menhir_action_27 () in
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_061 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_AND (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState061 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_064 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_op_sep_list_rest___anonymous_1_compexp_ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_op_sep_list_rest___anonymous_1_compexp_ (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_28 x xs in
      _menhir_goto_list_op_sep_list_rest___anonymous_1_compexp__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_op_sep_list_rest___anonymous_1_compexp__ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState060 ->
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState063 ->
          _menhir_run_064 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_065 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_compexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_compexp (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let opsexps = _v in
      let _v = _menhir_action_46 e opsexps in
      let p = _v in
      let _v = _menhir_action_06 p in
      _menhir_goto_andexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_andexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState067 ->
          _menhir_run_068 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState100 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState087 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState000 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState003 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState015 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState073 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState016 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState056 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_066 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_068 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_OR -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_OR (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_38 e in
      let _menhir_stack = MenhirCell1_op_sep_list_rest___anonymous_0_andexp_ (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OR ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState069
      | ELSE | EOF | IN | KWAND | RPAREN | SEMI | THEN ->
          let _v_0 = _menhir_action_25 () in
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_067 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_OR (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState067 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_070 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_op_sep_list_rest___anonymous_0_andexp_ -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_op_sep_list_rest___anonymous_0_andexp_ (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_26 x xs in
      _menhir_goto_list_op_sep_list_rest___anonymous_0_andexp__ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_list_op_sep_list_rest___anonymous_0_andexp__ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState066 ->
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState069 ->
          _menhir_run_070 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_071 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_andexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_andexp (_menhir_stack, _menhir_s, e) = _menhir_stack in
      let opsexps = _v in
      let _v = _menhir_action_45 e opsexps in
      let p = _v in
      let _v = _menhir_action_51 p in
      let e = _v in
      let _v = _menhir_action_20 e in
      _menhir_goto_ifletexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_ifletexp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let e = _v in
      let _v = _menhir_action_16 e in
      _menhir_goto_exp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_exp : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState100 ->
          _menhir_run_101 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState087 ->
          _menhir_run_088 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState000 ->
          _menhir_run_079 _menhir_stack _v _tok
      | MenhirState003 ->
          _menhir_run_075 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState073 ->
          _menhir_run_074 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState015 ->
          _menhir_run_072 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState058 ->
          _menhir_run_059 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState056 ->
          _menhir_run_057 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | MenhirState016 ->
          _menhir_run_055 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_088 : type  ttv_stack. ((ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_ID, _menhir_box_terminated_pgm) _menhir_cell1_list_ID_ -> _ -> _ -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_list_ID_ (_menhir_stack, _, ps) = _menhir_stack in
      let MenhirCell1_ID (_menhir_stack, _menhir_s, f) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_17 e f ps in
      _menhir_goto_fundef _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_goto_fundef : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState090 ->
          _menhir_run_091 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState082 ->
          _menhir_run_089 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_091 : type  ttv_stack. (ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_KWAND -> _ -> _ -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_KWAND (_menhir_stack, _menhir_s) = _menhir_stack in
      let fd = _v in
      let _v = _menhir_action_35 fd in
      let _menhir_stack = MenhirCell1_morefundefs (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | KWAND ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState092
      | SEMI ->
          let _v_0 = _menhir_action_23 () in
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_090 : type  ttv_stack. ttv_stack -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s ->
      let _menhir_stack = MenhirCell1_KWAND (_menhir_stack, _menhir_s) in
      let _menhir_s = MenhirState090 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v ->
          _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_083 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState083
      | EQ ->
          let _v_1 = _menhir_action_21 () in
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState083
      | _ ->
          _eRR ()
  
  and _menhir_run_084 : type  ttv_stack. ((ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_ID (_menhir_stack, _menhir_s, _v) in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | ID _v_0 ->
          _menhir_run_084 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState084
      | EQ ->
          let _v_1 = _menhir_action_21 () in
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1
      | _ ->
          _eRR ()
  
  and _menhir_run_085 : type  ttv_stack. ((ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_ID, _menhir_box_terminated_pgm) _menhir_cell1_ID -> _ -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_22 x xs in
      _menhir_goto_list_ID_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_ID_ : type  ttv_stack. ((ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState083 ->
          _menhir_run_086 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | MenhirState084 ->
          _menhir_run_085 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_086 : type  ttv_stack. ((ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_ID as 'stack) -> _ -> _ -> _ -> ('stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      let _menhir_stack = MenhirCell1_list_ID_ (_menhir_stack, _menhir_s, _v) in
      let _menhir_s = MenhirState087 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  and _menhir_run_093 : type  ttv_stack. (ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_morefundefs -> _ -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let MenhirCell1_morefundefs (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_24 x xs in
      _menhir_goto_list_morefundefs_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
  
  and _menhir_goto_list_morefundefs_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s ->
      match _menhir_s with
      | MenhirState089 ->
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | MenhirState092 ->
          _menhir_run_093 _menhir_stack _menhir_lexbuf _menhir_lexer _v
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_094 : type  ttv_stack. (ttv_stack, _menhir_box_terminated_pgm) _menhir_cell1_fundef -> _ -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | SEMI ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_fundef (_menhir_stack, _, f) = _menhir_stack in
          let fs = _v in
          let _v = _menhir_action_33 f fs in
          let x = _v in
          let _v = _menhir_action_50 x in
          _menhir_goto_option_mainfundef_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_option_mainfundef_ : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let _menhir_stack = MenhirCell0_option_mainfundef_ (_menhir_stack, _v) in
      match (_tok : MenhirBasics.token) with
      | NUM _v_0 ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState100
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | LET ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | IF ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState100
      | ID _v_1 ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState100
      | BOOL _v_2 ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState100
      | _ ->
          _eRR ()
  
  and _menhir_run_089 : type  ttv_stack. ttv_stack -> _ -> _ -> _ -> (ttv_stack, _menhir_box_terminated_pgm) _menhir_state -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_fundef (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | KWAND ->
          _menhir_run_090 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState089
      | SEMI ->
          let _v_0 = _menhir_action_23 () in
          _menhir_run_094 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0
      | _ ->
          _eRR ()
  
  and _menhir_run_075 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_LPAREN -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      match (_tok : MenhirBasics.token) with
      | RPAREN ->
          let _tok = _menhir_lexer _menhir_lexbuf in
          let MenhirCell1_LPAREN (_menhir_stack, _menhir_s) = _menhir_stack in
          let e = _v in
          let _v = _menhir_action_05 e in
          _menhir_goto_aexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_074 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_ID, ttv_result) _menhir_cell1_exp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_exp (_menhir_stack, _, e0) = _menhir_stack in
      let MenhirCell0_ID (_menhir_stack, x) = _menhir_stack in
      let MenhirCell1_LET (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_19 e0 e1 x in
      _menhir_goto_ifletexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_072 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_LET _menhir_cell0_ID as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | IN ->
          let _menhir_s = MenhirState073 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUM _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_059 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_exp, ttv_result) _menhir_cell1_exp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_exp (_menhir_stack, _, e0) = _menhir_stack in
      let MenhirCell1_exp (_menhir_stack, _, e) = _menhir_stack in
      let MenhirCell1_IF (_menhir_stack, _menhir_s) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_18 e e0 e1 in
      _menhir_goto_ifletexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_057 : type  ttv_stack ttv_result. (((ttv_stack, ttv_result) _menhir_cell1_IF, ttv_result) _menhir_cell1_exp as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | ELSE ->
          let _menhir_s = MenhirState058 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUM _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_055 : type  ttv_stack ttv_result. ((ttv_stack, ttv_result) _menhir_cell1_IF as 'stack) -> _ -> _ -> _ -> ('stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_exp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | THEN ->
          let _menhir_s = MenhirState056 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUM _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LET ->
              _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | IF ->
              _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | _ ->
          _eRR ()
  
  and _menhir_run_066 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_andexp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | OR ->
          _menhir_run_067 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState066
      | ELSE | EOF | IN | KWAND | RPAREN | SEMI | THEN ->
          let _v_0 = _menhir_action_25 () in
          _menhir_run_071 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_060 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_compexp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | AND ->
          _menhir_run_061 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState060
      | ELSE | EOF | IN | KWAND | OR | RPAREN | SEMI | THEN ->
          let _v_0 = _menhir_action_27 () in
          _menhir_run_065 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_048 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_14 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_046 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_13 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_044 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_12 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_042 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_11 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_030 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_pmexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_pmexp (_menhir_stack, _menhir_s, e0) = _menhir_stack in
      let e1 = _v in
      let _v = _menhir_action_10 e0 e1 in
      _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_028 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | NE ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState029 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUM _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | LT ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState041 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUM _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | LE ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState043 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUM _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | GT ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState045 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUM _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | GE ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState047 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUM _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | EQ ->
          let _menhir_stack = MenhirCell1_pmexp (_menhir_stack, _menhir_s, _v) in
          let _menhir_s = MenhirState049 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | NUM _v ->
              _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | NOT ->
              _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | MINUS ->
              _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | LPAREN ->
              _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
          | ID _v ->
              _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | BOOL _v ->
              _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | AND | ELSE | EOF | IN | KWAND | OR | RPAREN | SEMI | THEN ->
          let e = _v in
          let _v = _menhir_action_15 e in
          _menhir_goto_compexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_035 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_PLUS -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_PLUS (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_43 e in
      _menhir_goto_op_sep_list_rest_pmops_mdexp_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_033 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_mdexp (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | PLUS ->
          _menhir_run_034 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
      | MINUS ->
          _menhir_run_036 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState033
      | AND | ELSE | EOF | EQ | GE | GT | IN | KWAND | LE | LT | NE | OR | RPAREN | SEMI | THEN ->
          let _v_0 = _menhir_action_31 () in
          _menhir_run_040 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_022 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_MOD -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MOD (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_42 e in
      _menhir_goto_op_sep_list_rest_mdops_unop_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_019 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_TIMES -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_TIMES (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_40 e in
      _menhir_goto_op_sep_list_rest_mdops_unop_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_017 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let _menhir_stack = MenhirCell1_unop (_menhir_stack, _menhir_s, _v) in
      match (_tok : MenhirBasics.token) with
      | TIMES ->
          _menhir_run_018 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | MOD ->
          _menhir_run_021 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | DIV ->
          _menhir_run_023 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState017
      | AND | ELSE | EOF | EQ | GE | GT | IN | KWAND | LE | LT | MINUS | NE | OR | PLUS | RPAREN | SEMI | THEN ->
          let _v_0 = _menhir_action_29 () in
          _menhir_run_027 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 _tok
      | _ ->
          _eRR ()
  
  and _menhir_run_020 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      let e = _v in
      let _v = _menhir_action_58 e in
      _menhir_goto_unop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_011 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_MINUS -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_MINUS (_menhir_stack, _menhir_s) = _menhir_stack in
      let e = _v in
      let _v = _menhir_action_56 e in
      _menhir_goto_unop _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_009 : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match (_tok : MenhirBasics.token) with
      | NUM _v_0 ->
          let _menhir_stack = MenhirCell1_aexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v_0 MenhirState009
      | LPAREN ->
          let _menhir_stack = MenhirCell1_aexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer MenhirState009
      | ID _v_1 ->
          let _menhir_stack = MenhirCell1_aexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_006 _menhir_stack _menhir_lexbuf _menhir_lexer _v_1 MenhirState009
      | BOOL _v_2 ->
          let _menhir_stack = MenhirCell1_aexp (_menhir_stack, _menhir_s, _v) in
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v_2 MenhirState009
      | AND | DIV | ELSE | EOF | EQ | GE | GT | IN | KWAND | LE | LT | MINUS | MOD | NE | OR | PLUS | RPAREN | SEMI | THEN | TIMES ->
          let x = _v in
          let _v = _menhir_action_36 x in
          _menhir_goto_nonempty_list_aexp_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
      | _ ->
          _eRR ()
  
  and _menhir_goto_nonempty_list_aexp_ : type  ttv_stack ttv_result. ttv_stack -> _ -> _ -> _ -> (ttv_stack, ttv_result) _menhir_state -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok ->
      match _menhir_s with
      | MenhirState009 ->
          _menhir_run_010 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | MenhirState005 ->
          _menhir_run_008 _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _menhir_fail ()
  
  and _menhir_run_010 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_aexp -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_aexp (_menhir_stack, _menhir_s, x) = _menhir_stack in
      let xs = _v in
      let _v = _menhir_action_37 x xs in
      _menhir_goto_nonempty_list_aexp_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  and _menhir_run_008 : type  ttv_stack ttv_result. (ttv_stack, ttv_result) _menhir_cell1_ID -> _ -> _ -> _ -> _ -> ttv_result =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok ->
      let MenhirCell1_ID (_menhir_stack, _menhir_s, f) = _menhir_stack in
      let es = _v in
      let _v = _menhir_action_07 es f in
      _menhir_goto_appexp _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s _tok
  
  let _menhir_run_000 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_terminated_exp =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _menhir_s = MenhirState000 in
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | NUM _v ->
          _menhir_run_001 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | NOT ->
          _menhir_run_002 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | MINUS ->
          _menhir_run_004 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LPAREN ->
          _menhir_run_003 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | LET ->
          _menhir_run_013 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | IF ->
          _menhir_run_016 _menhir_stack _menhir_lexbuf _menhir_lexer _menhir_s
      | ID _v ->
          _menhir_run_005 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | BOOL _v ->
          _menhir_run_007 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
      | _ ->
          _eRR ()
  
  let _menhir_run_081 : type  ttv_stack. ttv_stack -> _ -> _ -> _menhir_box_terminated_pgm =
    fun _menhir_stack _menhir_lexbuf _menhir_lexer ->
      let _tok = _menhir_lexer _menhir_lexbuf in
      match (_tok : MenhirBasics.token) with
      | LETREC ->
          let _menhir_s = MenhirState082 in
          let _tok = _menhir_lexer _menhir_lexbuf in
          (match (_tok : MenhirBasics.token) with
          | ID _v ->
              _menhir_run_083 _menhir_stack _menhir_lexbuf _menhir_lexer _v _menhir_s
          | _ ->
              _eRR ())
      | BOOL _ | ID _ | IF | LET | LPAREN | MINUS | NOT | NUM _ ->
          let _v = _menhir_action_49 () in
          _menhir_goto_option_mainfundef_ _menhir_stack _menhir_lexbuf _menhir_lexer _v _tok
      | _ ->
          _eRR ()
  
end

let terminated_pgm =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_terminated_pgm v = _menhir_run_081 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v

let terminated_exp =
  fun _menhir_lexer _menhir_lexbuf ->
    let _menhir_stack = () in
    let MenhirBox_terminated_exp v = _menhir_run_000 _menhir_stack _menhir_lexbuf _menhir_lexer in
    v
