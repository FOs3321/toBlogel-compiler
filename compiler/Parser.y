{    
module Parser where
import Lexer
import Spec
}

%name parser
%lexer { lexer } { Eof }
%monad { Alex }
%tokentype { Token }
%error { parseError }

%token
    INT         { Token (TokenInt $$) _ }
    DOUBLE      { Token (TokenDouble $$)_ }
    BOOL        { Token (TokenBool $$) _ }
    'empty'     { Token (TokenEmpty) _ }
    'V'         { Token (TokenV) _ }
    'not'       { Token (TokenNot) _ }
    '('         { Token (TokenLParen) _ }
    ')'         { Token (TokenRParen) _ }
    '+'         { Token (TokenPlus) _ }
    '-'         { Token (TokenMinus) _ }
    '*'         { Token (TokenMul) _ }
    '/'         { Token (TokenDev) _ }
    CMP         { Token (TokenCmp $$) _ }
    '!!'        { Token (TokenOr) _ }
    '&&'        { Token (TokenAnd) _ }
    '\\'         { Token (TokenDiff) _ }

    '{'         { Token (TokenLCurly) _ }
    '}'         { Token (TokenRCurly) _ }
    'if'        { Token (TokenIf) _ }
    'then'      { Token (TokenThen) _ }
    'else'      { Token (TokenElse) _ }
    'while'     { Token (TokenWhile) _ }
    ';'         { Token (TokenSemiColon) _ }
    '='         { Token (TokenEqual) _ }   
    'return'    { Token (TokenReturn) _ }

    'minimum'   { Token (TokenAggMin) _ }
    'maximum'   { Token (TokenAggMax) _ }
    'sum'       { Token (TokenAggSum) _ }
    'prod'      { Token (TokenAggProd) _ }
    'and'       { Token (TokenAggAnd) _ }
    'or'        { Token (TokenAggOr) _ }   

    '<-'        { Token (TokenLArrow) _ }
    'in'        { Token (TokenIn) _ }
    'nvals'     { Token (TokenNvals) _ }
    ','         { Token (TokenComma) _ }
    '['         { Token (TokenLBrack) _ }
    ']'         { Token (TokenRBrack) _ }
    '|'         { Token (TokenVbar) _ }


    UPPER       { Token (TokenUpper $$) _ }
    STRING      { Token (TokenString $$) _ }


%left '!!'
%left '&&'
%left '\\'
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

statement : var '=' expr ';'                                                        { DVarDef $1 $3 }
          | 'if' '(' expr ')' 'then' '{' statements '}' 'else' '{' statements '}'   { DIfDef $3 (reverse $7) (reverse $11) }
          | 'if' '(' expr ')' 'then' '{' statements '}'                             { DIfDef $3 (reverse $7) [] }
          | 'while' '(' expr ')' '{' statements '}'                                 { DLoopDef $3 (reverse $6)}
          | 'return' var ';'                                                        { DReturnDef $2 }

expr    : expr4               { $1 }

expr4   : 'if' '(' expr3 ')' 'then' '{' expr3 '}' 'else' '{' expr3 '}'  { DIf $3 $7 $11 None }
        | 'if' '(' expr3 ')' 'then' '{' expr3 '}'                       { DIf $3 $7 IfNone None }
        | expr3                                                         { $1 }


expr3   : expr3 '!!' expr3    { DFunAp (DBinOp "||") [$1, $3] None }
        | expr3 '&&' expr3    { DFunAp (DBinOp "&&") [$1, $3] None }
        | expr3 '\\' expr3     { DFunAp (DBinOp "\\") [$1, $3] None }
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
                                                { DCmprhnsnExp $2 (zip (reverse $5) (reverse $9)) None}
        | '{' expr3 '|' var '<-' expr0 '}'      { DCmprhnsnExp $2 [($4,$6)] None}
        | '{' expr3 '}'                         { DCmprhnsnExp $2 [] None}
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

gen     : var '<-' 'nvals' expr1 { DGenNvals $1 $4 None }
        | var '<-'  expr1        { DGenG $1 $3 None }

const   : INT               { DCInt $1 DTInt }
        | DOUBLE            { DCDouble $1 DTDouble }
        | BOOL              { DCBool $1 DTBool }
        | 'V'               { DCAllV }
        | 'empty'           { DCEmpty }    

fun     : STRING            { DFun $1 }

var     : STRING            { DVar $1 0 None }
        | UPPER             { DVarV $1 0 }
        | STRING '(' var ')'{ DFunV $1 $3 None }


{
    
lexer :: (Token -> Alex a) -> Alex a
lexer = (alexMonadScan >>=)

parseError :: Token -> Alex a    
parseError (Token token pos) = alexError $ "Parse error" ++ show pos

parse s = runAlex s parser

ps :: AlexState -> AlexState
ps s@AlexState{alex_ust=AlexUserState{scope = sc}} = s{alex_ust = AlexUserState{scope = sc + 1}}

}