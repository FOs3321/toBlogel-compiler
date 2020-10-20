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
    "not"   { TokenNot }
    '('     { TokenLParen }
    ')'     { TokenRParen }
    '+'     { TokenPlus }
    '-'     { TokenMinus }
    '*'     { TokenMul }
    '/'     { TokenDev }
    CMP     { TokenCmp $$ }
    "!!"    { TokenOr }
    "&&"    { TokenAnd }

    '{'     { TokenLBrace }
    '}'     { TokenRBrace }
    "if"    { TokenIf }
    "then"  { TokenThen }
    "else"  { TokenElse }   
     
    UPPER   { TokenUpper $$ }
    STRING  { TokenString $$ }


%left "!!"
%left "&&"
%left CMP
%left '+' '-'
%left '*' '/'

%%
expr       : expr4               { $1 }

expr4       : "if" '(' expr3 ')' "then" '{' expr3 '}' "else" '{' expr3 '}'  { DIf $3 $7 $11 None }
            | "if" '(' expr3 ')' "then" '{' expr3 '}'                       { DIf $3 $7 IfNone None }
            | expr3                                                         { $1 }


expr3       : expr3 "!!" expr3     { DFunAp (DBinOp "||") [$1, $3] None }
            | expr3 "&&" expr3     { DFunAp (DBinOp "&&") [$1, $3] None }
            | expr3 CMP expr3     { DFunAp (DBinOp $2) [$1, $3] None }
            | expr3 '+' expr3     { DFunAp (DBinOp "+") [$1, $3] None }
            | expr3 '-' expr3     { DFunAp (DBinOp "-") [$1, $3] None }
            | expr3 '*' expr3     { DFunAp (DBinOp "*") [$1, $3] None }
            | expr3 '/' expr3     { DFunAp (DBinOp "/") [$1, $3] None }
            | expr2               { $1 }

expr2       : '-' expr1         { DFunAp (DFun "neg" ) [$2] None }
            | "not" expr1       { DFunAp (DFun "not" ) [$2] None }
            | expr1             { $1 }

expr1       : expr0             { $1 }

expr0       : const             { DCExp $1 None }
            | '(' expr ')'      { $2 }

const       : INT               { DCInt $1 DTInt }
            | DOUBLE            { DCDouble $1 DTDouble }
            | BOOL              { DCBool $1 DTBool }
            | 'V'               { DCAllV }
            | "empty"           { DCEmpty }
            
fvar        : STRING '(' var ')'{ DFunV $1 $3 }

fun         : STRING            { DFun $1 }

var         : STRING            { DVar $1 0 None }
            | UPPER             { DVarV $1 0 }


{
    
parseError :: [Token] -> a    
parseError x = error $ "Parse error" ++ show x

}