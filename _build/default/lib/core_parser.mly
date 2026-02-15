(* OCaml- parser.
 *
 * N. Danner
 *)

%{
    open Core_ast.Expr
    open Core_ast.Script

    let rec left_assoc e es =
        match es with
        | [] -> e
        | (b, e') :: es -> left_assoc (Binop(b, e, e')) es
%}

%token <string> ID

%token <int> NUM
%token <bool> BOOL

%token PLUS
%token MINUS
%token TIMES
%token DIV
%token MOD
%token NOT
%token AND
%token OR
%token EQ
%token NE
%token LT
%token LE
%token GT
%token GE

%token LPAREN
%token RPAREN

%token IF
%token ELSE
%token THEN

%token LET
%token IN

%token LETREC
%token KWAND

%token SEMI

%token EOF

%start terminated_exp
%start terminated_pgm

%type <Core_ast.Expr.t> terminated_exp
%type <Core_ast.Script.t> terminated_pgm

%%

operator_separated_list(O, next):
    | e = next ; opsexps = list(op_sep_list_rest(O, next))
        { (e, opsexps) }

op_sep_list_rest(O, next):
    | o = O ; e = next
        { (o, e) }

exp:
    | e = ifletexp
        { e }

ifletexp:
    | IF ; e = exp ; THEN ; e0 = exp ; ELSE ; e1 = exp
        { If(e, e0, e1) }
    | LET ; x = ID ; EQ ; e0 = exp ; IN ; e1 = exp
        { Let(x, e0, e1) }
    | e = orexp
        { e }

orexp:
    | p = operator_separated_list(OR { Or } , andexp)
        { let (e, opsexps) = p in left_assoc e opsexps }

andexp:
    | p = operator_separated_list(AND { And } , compexp)
        { let (e, opsexps) = p in left_assoc e opsexps }

%inline compop:
    | EQ    { Eq }
    | NE    { Ne }
    | LT    { Lt }
    | LE    { Le }
    | GT    { Gt }
    | GE    { Ge }

compexp:
    | e0 = pmexp ; op = compop ; e1 = pmexp
        { Binop(op, e0, e1) }
    | e = pmexp
        { e }

%inline pmops:
    | PLUS  { Plus }
    | MINUS { Minus }

pmexp:
    | p = operator_separated_list(pmops, mdexp)
        { let (e, opsexps) = p in left_assoc e opsexps }

%inline mdops:
    | TIMES { Times }
    | DIV   { Div }
    | MOD   { Mod }

mdexp:
    | p = operator_separated_list(mdops, unop)
        { let (e, opsexps) = p in left_assoc e opsexps }

unop:
    | MINUS ; e = appexp
        { Unop(Neg, e) }
    | NOT ; e = appexp
        { Unop(Not, e) }
    | e = appexp
        { e }

appexp:
    | f = ID ; es = nonempty_list(aexp)
        { Call(f, es) }
    | e = aexp
        { e }

aexp:
    | x = ID
        { Var x }
    | i = NUM           
        { Num i }
    | b = BOOL                      
        { Bool b }
    | LPAREN; e = exp ; RPAREN      
        { e }

fundef:
    | f = ID ; ps = ID* ; EQ ; e = exp
        { (f, ps, e) }

morefundefs:
    | KWAND ; fd = fundef
        { fd }

mainfundef:
    | LETREC ; f = fundef ; fs = list(morefundefs) ; SEMI ; SEMI
        { f :: fs }

pgm:
    | fs = option(mainfundef) ; e = exp ; SEMI ; SEMI
        { Pgm ((match fs with None -> [] | Some fs' -> fs'), e) }

terminated_exp:
    | e = exp; EOF                  { e }

terminated_pgm:
    | p = pgm ; EOF                 { p }

