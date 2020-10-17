{    
module Parser where
import Lexer
import Spec
}

%name parser
%tokentype { Token }
%error { parseError }

%token
    int     { TokenInt $$ }
    '('     { TokenLParen }
    ')'     { TokenRParen }
    '+'     { TokenPlus }
    '-'     { TokenMinus }
    '*'     { TokenMul }
    '/'     { TokenDev }

%left '+' '-'
%left '*' '/'

%%

expr        : expr '+' expr     { DFunAp (DBinOp "+") [$1, $3] DTInt }
            | expr '-' expr     { DFunAp (DBinOp "-") [$1, $3] DTInt }
            | expr '*' expr     { DFunAp (DBinOp "*") [$1, $3] DTInt }
            | expr '/' expr     { DFunAp (DBinOp "/") [$1, $3] DTInt }
            | const             { $1 }

const       : int               { DCExp (DCInt $1 DTInt) DTInt }

{
parseError :: [Token] -> a    
parseError x = error $ "Parse error" ++ show x


}