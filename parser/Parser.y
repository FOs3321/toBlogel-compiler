{    
module Parser where
import Lexer
import Spec
}

%name parser
%tokentype { Token }
%error { parseError }

%token
    INT     { TokenInt $$ }
    DOUBLE  { TokenDouble $$ }
    BOOL    { TokenBool $$ }
    "empty" { TokenEmpty }
    'V'     { TokenV }
    '('     { TokenLParen }
    ')'     { TokenRParen }
    '+'     { TokenPlus }
    '-'     { TokenMinus }
    '*'     { TokenMul }
    '/'     { TokenDev }
    
    UPPER   { TokenUpper $$ }
    STRING  { TokenString $$ }

%left '+' '-'
%left '*' '/'

%%

expr        : expr '+' expr     { DFunAp (DBinOp "+") [$1, $3] DTInt }
            | expr '-' expr     { DFunAp (DBinOp "-") [$1, $3] DTInt }
            | expr '*' expr     { DFunAp (DBinOp "*") [$1, $3] DTInt }
            | expr '/' expr     { DFunAp (DBinOp "/") [$1, $3] DTInt }
            | const             { DCExp $1 None }

const       : INT               { DCInt $1 DTInt }
            | DOUBLE            { DCDouble $1 DTDouble }
            | BOOL              { DCBool $1 DTBool }
            | 'V'               { DCAllV }
            | "empty"           { DCEmpty }
            
fvar        : STRING '(' var ')'   { DFunV $1 $3 }

fun         : STRING            { DFun $1 }

var         : STRING            { DVar $1 0 None }
            | UPPER             { DVarV $1 0 }


{
    
parseError :: [Token] -> a    
parseError x = error $ "Parse error" ++ show x

data Test = Test String
            deriving(Show, Eq)

}