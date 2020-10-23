{    
module Parser where
import Lexer
import Spec
}

%name parser
%tokentype { Token }
%error { parseError }

%token
    INT         { TokenInt $$ }
    DOUBLE      { TokenDouble $$ }
    BOOL        { TokenBool $$ }
    'empty'     { TokenEmpty }
    'V'         { TokenV }
    'not'       { TokenNot }
    '('         { TokenLParen }
    ')'         { TokenRParen }
    '+'         { TokenPlus }
    '-'         { TokenMinus }
    '*'         { TokenMul }
    '/'         { TokenDev }
    CMP         { TokenCmp $$ }
    '!!'        { TokenOr }
    '&&'        { TokenAnd }

    '{'         { TokenLCurly }
    '}'         { TokenRCurly }
    'if'        { TokenIf }
    'then'      { TokenThen }
    'else'      { TokenElse }
    'while'     { TokenWhile }
    ';'         { TokenSemiColon }
    '='         { TokenEqual }   
    'return'    { TokenReturn }

    'minimum'   { TokenAggMin }
    'maximum'   { TokenAggMax }
    'sum'       { TokenAggSum }
    'prod'      { TokenAggProd }
    'and'       { TokenAggAnd }
    'or'        { TokenAggOr }   

    '<-'        { TokenLArrow }
    'in'        { TokenIn }
    'nvals'     { TokenNvals }
    ','         { TokenComma }
    '['         { TokenLBrack }
    ']'         { TokenRBrack }
    '|'         { TokenVbar }


    UPPER       { TokenUpper $$ }
    STRING      { TokenString $$ }


%left '!!'
%left '&&'
%nonassoc CMP
%left '+' '-'
%left '*' '/'

%%

programSpec : mainDef funDefs                   { DProgram $1 (reverse $2) }

funDefs     : {- empty -}                       { [] }
            | funDefs funDef                    { $2 : $1 }

funDef      : var '=' expr ';'                  { DFunDef $1 $3 }

mainDef     : fun '(' ')' '{' statements '}'    { DMainDef $1 (reverse $5) }

statements  : statement                         { [$1] }
            | statements statement              { $2 : $1 }

statement : var '=' expr ';'                                                        { DVarDef $1 $3 None }
          | 'if' '(' expr ')' 'then' '{' statements '}' 'else' '{' statements '}'   { DIfDef $3 (reverse $7) (reverse $11) }
          | 'if' '(' expr ')' 'then' '{' statements '}'                             { DIfDef $3 (reverse $7) [] }
          | 'while' '(' expr ')' '{' statements '}'                                 { DLoopDef $3 (reverse $6) None 0 [] }
          | 'return' var ';'                                                        { DReturnDef $2 None }

expr    : expr4               { $1 }

expr4   : 'if' '(' expr3 ')' 'then' '{' expr3 '}' 'else' '{' expr3 '}'  { DIf $3 $7 $11 None }
        | 'if' '(' expr3 ')' 'then' '{' expr3 '}'                       { DIf $3 $7 IfNone None }
        | expr3                                                         { $1 }


expr3   : expr3 '!!' expr3    { DFunAp (DBinOp "||") [$1, $3] None }
        | expr3 '&&' expr3    { DFunAp (DBinOp "&&") [$1, $3] None }
        | expr3 CMP expr3     { DFunAp (DBinOp $2) [$1, $3] None }
        | expr3 '+' expr3     { DFunAp (DBinOp "+") [$1, $3] None }
        | expr3 '-' expr3     { DFunAp (DBinOp "-") [$1, $3] None }
        | expr3 '*' expr3     { DFunAp (DBinOp "*") [$1, $3] None }
        | expr3 '/' expr3     { DFunAp (DBinOp "/") [$1, $3] None }
        | expr2               { $1 }

expr2   : '-' expr1         { DFunAp (DFun "neg" ) [$2] None }
        | 'not' expr1       { DFunAp (DFun "not" ) [$2] None }
        | expr1             { $1 }

expr1   : '{' expr3 '|' '(' vars ')' '<-' '(' expr0s ')' '}'
                                                { DCmprhnsnExp $2 (zip (reverse $5) (reverse $9)) }
        | '{' expr3 '|' var '<-' expr0 '}'      { DCmprhnsnExp $2 [($4,$6)] }
        | '{' expr3 '}'                         { DCmprhnsnExp $2 [] }
        | agg '[' expr '|' gen inExprs ']'      { DAggr $1 $3 $5 (reverse $6) None }
        | expr0                                 { $1 }

expr0   : const             { DCExp $1 None }
        | '(' expr ')'      { $2 }
        | var               { DVExp $1 None }
        | '[' vids ']'      { DChoiceVID (reverse $2) DTBool}

vars    : var               { [ $1 ] }
        | vars ',' var      { $3 : $1 }

expr0s  : expr0             { [ $1 ] }
        | expr0s ',' expr0  { $3 : $1 }

inExprs : {- empty -}        { [] }
        | inExprs ',' inExpr { $3 : $1 }

inExpr  : var 'in' expr     { DIn $1 $3 None }


vid     : INT               { $1 }
vids    : vids ',' vid      { $3 : $1 }
        | vid               { [ $1 ] }

agg     : 'minimum'         { DAggMin }
        | 'maximum'         { DAggMax }
        | 'sum'             { DAggSum }
        | 'prod'            { DAggProd }
        | 'and'             { DAggAnd }
        | 'or'              { DAggOr }

gen     : var '<-' 'nvals' expr1 { if ($4 == (DCExp DCAllV None)) then ( DGenNvalsV $1 DCAllV  None ) else ( DGenNvals $1 $4 None )  }
        | var '<-'  expr1        { if ($3 == (DCExp DCAllV None)) then ( DGenGV $1 DCAllV  None ) else ( DGenG $1 $3 None ) }

const   : INT               { DCInt $1 DTInt }
        | DOUBLE            { DCDouble $1 DTDouble }
        | BOOL              { DCBool $1 DTBool }
        | 'V'               { DCAllV }
        | 'empty'           { DCEmpty }    

fun     : STRING            { DFun $1 }

var     : STRING            { DVar $1 0 None }
        | UPPER             { DVarV $1 0 }
        | STRING '(' var ')'{ DFunV $1 $3 }


{
    
parseError :: [Token] -> a    
parseError x = error $ "Parse error" ++ show x

}