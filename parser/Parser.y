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
    "while" { TokenWhile }
    ';'     { TokenSemiColon }
    '='     { TokenEqual }   
    "return"{ TokenReturn }

    UPPER   { TokenUpper $$ }
    STRING  { TokenString $$ }


%left "!!"
%left "&&"
%left CMP
%left '+' '-'
%left '*' '/'

%%

programSpec : mainDef funDefs                   { DProgram $1 $2 }

funDefs     : funDef                            { [$1] }
            | funDefs funDef                    { $2 : $1 }

funDef      : var '=' expr ';'                  { DFunDef $1 $3 }

mainDef     : fun '(' ')' '{' statements '}'    { DMainDef $1 $5 }

statements  : statement                         { [$1] }
            | statements statement              { $2 : $1 }

statement : var '=' expr ';'                                                        { DVarDef $1 $3 None }
          | "if" '(' expr ')' "then" '{' statements '}' "else" '{' statements '}'   { DIfDef $3 $7 $11 }
          | "if" '(' expr ')' "then" '{' statements '}'                             { DIfDef $3 $7 [] }
          | "while" '(' expr ')' '{' statements '}'                                 { DLoopDef $3 $6 None 0 [] }
          | "return" var ';'                                                        { DReturnDef $2 None }

expr        : expr4               { $1 }

expr4       : "if" '(' expr3 ')' "then" '{' expr3 '}' "else" '{' expr3 '}'  { DIf $3 $7 $11 None }
            | "if" '(' expr3 ')' "then" '{' expr3 '}'                       { DIf $3 $7 IfNone None }
            | expr3                                                         { $1 }


expr3       : expr3 "!!" expr3    { DFunAp (DBinOp "||") [$1, $3] None }
            | expr3 "&&" expr3    { DFunAp (DBinOp "&&") [$1, $3] None }
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

fun         : STRING            { DFun $1 }

var         : STRING            { DVar $1 0 None }
            | UPPER             { DVarV $1 0 }
            | STRING '(' var ')'{ DFunV $1 $3 }

{
    
parseError :: [Token] -> a    
parseError x = error $ "Parse error" ++ show x

}