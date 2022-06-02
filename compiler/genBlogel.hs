module GenBlogel (genBlogel) where

import Data.List
import IR
import Spec

genBlogel :: IR -> String -> String -> String
genBlogel (IR prog vtx msg agg steps) iPath oPath =
  includeStmt
    ++ genVertexStruct vtx
    ++ genMessageStruct msg
    ++ genAggStruct agg
    ++ genVertex steps msg agg
    ++ genAggregator agg
    ++ genCombiner msg
    -- ++ unlines (codeStepPartial agg)
    -- ++ unlines (codeStepFinal agg)
    ++ genWorker steps
    ++ mainStmts iPath oPath

includeStmt :: String
includeStmt = unlines stmts
  where
    stmts =
      [ "#include \"basic/pregel-dev.h\"",
        "#include <float.h>",
        "#include <climits>",
        "using namespace std;"
      ]

mainStmts :: String -> String -> String
mainStmts inputGraphPath outputGraphPath = unlines stmts
  where
    stmts =
      [ "void pregel_main(string in_path, string out_path){",
        "    WorkerParams param;",
        "    param.input_path=in_path;",
        "    param.output_path=out_path;",
        "    param.force_write=true;",
        "    param.native_dispatcher=false;",
        "    BlogelWorker worker;",
        "    BlogelCombiner combiner;",
        "    worker.setCombiner(&combiner);",
        "    BlogelAgg agg;",
        "    worker.setAggregator(&agg);",
        "    worker.run(param);",
        "}",
        "int main(int argc, char *argv[]) {",
        "    init_workers();",
        "    pregel_main(\"" ++ inputGraphPath ++ "\", \"" ++ outputGraphPath ++ "\");",
        "    worker_finalize();",
        "    return 0;",
        "}"
      ]

genWorker :: [IRStep] -> String
genWorker steps = unlines m2
  where
    m1 =
      [ "class BlogelWorker:public Worker<BlogelVertex, BlogelAgg>{",
        "    char buf[100];",
        "    public:",
        "        virtual BlogelVertex* toVertex(char* line){",
        "            char * pch;",
        "            pch=strtok(line, \"\\t\");",
        "            BlogelVertex* v=new BlogelVertex;",
        "            v->id=atoi(pch);",
        "            pch=strtok(NULL, \" \");",
        "            atoi(pch);",
        "            pch=strtok(NULL, \" \");",
        "            int num=atoi(pch);",
        "            for(int i=0; i<num; i++){",
        "                pch = strtok(NULL, \" \");",
        "                v->value().edges.push_back(atoi(pch));",
        "                pch = strtok(NULL, \" \");",
        "                atoi(pch);",
        "            }",
        "            return v;",
        "        }",
        "        virtual void toline(BlogelVertex* v, BufferedWriter & writer){",
        "            sprintf(buf, \"%d\\t" ++ format tp ++ "\\n\", v->id, v->value()." ++ getVarName var ++ ");",
        "            writer.write(buf);",
        "        }",
        "};"
      ]
    m2 =
      [ "class BlogelWorker:public Worker<BlogelVertex, BlogelAgg>{",
        "    char buf[100];",
        "    public:",
        "        virtual BlogelVertex* toVertex(char* line){",
        "            char * pch;",
        "            pch=strtok(line, \"[,\");",
        "            BlogelVertex* v=new BlogelVertex;",
        "            v->id=atoi(pch);",
        "            pch=strtok(NULL, \"[,]\");",
        "            pch=strtok(NULL, \"[,]\");",
        "            while(pch != NULL){",
        "                int e = atoi(pch);",
        "                v->value().edges.push_back(e);",
        "                pch=strtok(NULL, \"[,]\");",
        "                pch=strtok(NULL, \"[,]\");",
        "            }",
        "            return v;",
        "        }",
        "        virtual void toline(BlogelVertex* v, BufferedWriter & writer){",
        "            sprintf(buf, \"%d\\t" ++ format tp ++ "\\n\", v->id, v->value()." ++ getVarName var ++ ");",
        "            writer.write(buf);",
        "        }",
        "};"
      ]
    ret' (DReturnDef var) = [(var, getType var)]
    ret' _ = []
    ret (IRStep _ stmts _ _) = concatMap ret' stmts
    (var, tp) = head $ concatMap ret steps
    format DTInt = "%d"
    format DTBool = "%d"
    format DTDouble = "%f"
    format DTString = "%s"

genVertexStruct :: IRStruct -> String
genVertexStruct vtx = unlines $ ststr vtx
  where
    fst (name, tp) = "    " ++ typeToStr tp ++ " " ++ name ++ ";"
    fi (name, tp) = "    " ++ "m<<v." ++ name ++ ";"
    fo (name, tp) = "    " ++ "m>>v." ++ name ++ ";"
    ststr st =
      ["struct VtxValue{"]
        ++ [ "    int nextStep;",
             "    vector<VertexID> edges;"
           ]
        ++ map fst st
        ++ [ "};",
             "ibinstream & operator<<(ibinstream & m, const VtxValue & v){"
           ]
        ++ [ "    m<<v.nextStep;",
             "    m<<v.edges;"
           ]
        ++ map fi st
        ++ [ "    return m;",
             "}",
             "obinstream & operator>>(obinstream & m, VtxValue & v){"
           ]
        ++ [ "    m>>v.nextStep;",
             "    m>>v.edges;"
           ]
        ++ map fo st
        ++ ["    return m;", "}"]

genMessageStruct :: IRMsg -> String
genMessageStruct msg = unlines $ ststr msg
  where
    fst (name, tp, _) = "    " ++ typeToStr tp ++ " " ++ name ++ ";"
    fi (name, tp, _) = "    " ++ "m<<v." ++ name ++ ";"
    fo (name, tp, _) = "    " ++ "m>>v." ++ name ++ ";"
    ststr st =
      ["struct Message{"]
        ++ map fst st
        ++ [ "};",
             "ibinstream & operator<<(ibinstream & m, const Message & v){"
           ]
        ++ map fi st
        ++ [ "    return m;",
             "}",
             "obinstream & operator>>(obinstream & m, Message & v){"
           ]
        ++ map fo st
        ++ ["    return m;", "}"]

genAggregator :: IRAgg -> String
genAggregator agg = unlines $ head ++ pri ++ pub ++ tail
  where
    head = ["class BlogelAgg:public Aggregator<BlogelVertex, Agg, Agg>{"]
    pri =
      indent $
        [ "private:",
          "    Agg agg;"
        ]
    pub = indent $ ["public:"] ++ aggM
    aggM = indent $ init ++ stepPartial ++ stepFinal ++ finishPartial ++ finishFinal
    init =
      [ "virtual void init(){",
        "    agg = {" ++ intercalate "," (map initMember agg) ++ "};",
        "}"
      ]
    stepPartial = codeStepPartial agg
    stepFinal = codeStepFinal agg
    finishPartial = ["virtual Agg* finishPartial(){ return &agg; }"]
    finishFinal = ["virtual Agg* finishFinal(){ return &agg; }"]
    tail = ["};"]

initMember :: (String, DType, DExpr) -> String
initMember (_, _, DAggr agg _ _ _ _) = initMember' agg

initMember' :: DAgg -> String
initMember' DAggMax = "INT_MIN" -- ?
initMember' DAggMin = "INT_MAX"
initMember' DAggSum = "0"
initMember' DAggProd = "1"
initMember' DAggAnd = "true"
initMember' DAggOr = "false"

genAggStruct :: IRAgg -> String
genAggStruct agg = unlines $ ststr agg
  where
    fst (name, tp, _) = "    " ++ typeToStr tp ++ " " ++ name ++ ";"
    fi (name, tp, _) = "    " ++ "m<<v." ++ name ++ ";"
    fo (name, tp, input_path) = "    " ++ "m>>v." ++ name ++ ";"
    ststr st =
      ["struct Agg{"]
        ++ map fst st
        ++ [ "};",
             "ibinstream & operator<<(ibinstream & m, const Agg & v){"
           ]
        ++ map fi st
        ++ [ "    return m;",
             "}",
             "obinstream & operator>>(obinstream & m, Agg & v){"
           ]
        ++ map fo st
        ++ ["    return m;", "}"]

codeStepPartial :: IRAgg -> [String]
codeStepPartial agg = head ++ m ++ tail
  where
    head = ["virtual void stepPartial(BlogelVertex* v){"]
    tail = ["}"]
    m = indent $ map codeAggMember agg

    codeAggMember :: (String, DType, DExpr) -> String
    codeAggMember (sym, dtype, DAggr agg expr gen [] _) = codeDAgg agg ("agg." ++ sym) newExpr
      where
        newExpr = codeAggExpr expr gen
    codeAggMember (sym, dtype, DAggr agg expr gen ins _) = ifs ++ (codeDAgg agg ("agg." ++ sym) newExpr) ++ "}"
      where
        ifs = "if(" ++ codeIns ++ "){"
        newExpr = codeAggExpr expr gen
        codeIns = intercalate " && " $ map inGraph ins
        inGraph (DIn _ (DVExp g _) _) = "v->value()." ++ getVarName g

codeStepFinal :: IRAgg -> [String]
codeStepFinal agg = head ++ map codeAggFinal agg ++ tail
  where
    head = ["virtual void stepFinal(Agg* part){"]
    tail = ["}"]

    codeAggFinal :: (String, DType, DExpr) -> String
    codeAggFinal (sym, dtype, DAggr agg expr gen _ _) = "    " ++ codeDAgg agg ("agg." ++ sym) ("part->" ++ sym)

genCombiner :: IRMsg -> String
genCombiner msg = unlines $ head ++ m ++ tail
  where
    head =
      [ "class BlogelCombiner:public Combiner<Message>{",
        "    public:",
        "        virtual void combine(Message & old, const Message & new_msg){"
      ]
    tail =
      [ "        }",
        "};"
      ]
    m = indent . indent . indent $ map codeMsgMember msg
    codeMsgMember :: (String, DType, DExpr) -> String
    codeMsgMember (sym, dtype, DAggr agg expr gen _ _) = codeDAgg agg ("old." ++ sym) ("new_msg." ++ sym)

typeToStr :: DType -> String
typeToStr DTBool = "bool"
typeToStr DTInt = "int"
typeToStr DTString = "char *"
typeToStr DTDouble = "double"
typeToStr None = "int"

genVertex :: [IRStep] -> IRMsg -> IRAgg -> String
genVertex steps msg agg = unlines $ head ++ indent m ++ tail
  where
    head = ["class BlogelVertex:public Vertex<VertexID, VtxValue, Message>{"]
    tail = ["};"]
    m = ["public:"] ++ (indent $ getAggAndMsg ++ compute)
    getAggAndMsg = genGetAggAndMsg agg msg
    -- broadcast = genBroadcast msg
    compute = genCompute steps msg

genBroadcast :: IRMsg -> IRStep -> [String]
genBroadcast msg step = head ++ tail
  where
    head =
      ("if(" ++ codeMsgVs step ++ "){") :
      ( indent
          ( [ "vector<VertexID> & nbs=value().edges;",
              "for(int i=0; i<nbs.size(); i++){"
            ]
              ++ indent (["Message msg;"] ++ m)
          )
      )
    tail =
      [ "        " ++ gg msg ++ "send_message(nbs[i], msg);",
        "    }",
        "}"
      ]
    -- initMsg = ["msg = {" ++ (intercalate "," $ map initMember msg) ++ "};"]
    cd (_, _, DAggr _ _ _ ins _) = ifs ins
    m = map f msg
    f msg'@(mem, dtype, DAggr agg expr gen ins _) =
      "msg." ++ mem ++ "=" ++ ifs ins ++ "?" ++ codeMsgExpr expr gen ++ ":" ++ initMember msg' ++ ";"
    ifs ins' = "(" ++ codeIns ins' ++ ")"
    codeIns ins' = intercalate " && " $ map inGraph ins'
    inGraph (DIn _ (DVExp g _) _) = "value()." ++ getVarName g

    codeMsgVs (IRStep _ _ _ vs) = intercalate " || " (map codeMsgVs' vs)
    codeMsgVs' v = ("value()." ++ getVarName v)

    g msg'@(mem, _, _) = "(msg." ++ mem ++ "!=" ++ initMember msg' ++ ")"
    gg msgs = "if(" ++ (intercalate " || " $ map g msgs) ++ ")"

genGetAggAndMsg :: IRAgg -> IRMsg -> [String]
genGetAggAndMsg agg msg = getAgg ++ getMsg
  where
    getAgg =
      ["void getAggregator(){"]
        ++ indent
          ( ["Agg* agg=(Agg*)getAgg();"]
              ++ map f agg
          )
        ++ ["}"]
      where
        f (mem, _, _) = "value()." ++ mem ++ "=agg->" ++ mem ++ ";"
    getMsg =
      ["void getMessage(MessageContainer & messages){"]
        ++ indent
          ( (map g msg)
              ++ ["for (int i = 0; i < messages.size(); i++){"]
              ++ indent (map f msg)
              ++ ["}"]
          )
        ++ ["}"]
      where
        f (mem, _, DAggr ag _ _ _ _) = codeDAgg ag ("value()." ++ mem) ("messages[i]." ++ mem)
        g message@(mem, _, _) = "value()." ++ mem ++ "=" ++ initMember message ++ ";"

genCompute :: [IRStep] -> IRMsg -> [String]
genCompute steps msg = head ++ stps ++ tail
  where
    head =
      [ "virtual void compute(MessageContainer & messages){",
        "    if(step_num()==1){",
        "        value().nextStep = 0;",
        -- "        wakeAll();",
        "    }else{",
        "        getAggregator();",
        "        switch(value().nextStep){"
      ]
    tail =
      [ "        }",
        "    }",
        -- "    vote_to_halt();",
        "}"
      ]
    dflt =
      [ "default:",
        "    break;"
      ]
    stps = indent . indent $ genStmts steps msg

genStmts :: [IRStep] -> IRMsg -> [String]
genStmts steps msg = concatMap (indent . (genStep msg)) steps

genStep :: IRMsg -> IRStep -> [String]
genStep msg step@(IRStep i stmts conditions isSend) = head ++ sts ++ cond ++ broadcast ++ tail
  where
    head = ["case " ++ show i ++ ":"]
    cond = indent $ genConditions conditions
    broadcast = if isSend /= [] then indent (genBroadcast msg step) else []
    tail = ["    break;"]
    sts = concatMap codeStmt' stmts

genConditions :: IRConditions -> [String]
genConditions (IRStpID i) = ["value().nextStep = " ++ show i ++ ";"]
genConditions (IRCExp expr) = ["value().nextStep = " ++ codeExpr expr "value()." ++ ";"]
genConditions (IRCExit) = ["forceTerminate();"]

codeStmt :: DStatement -> [String]
-- codeStmt (DVarDef var expr dtype) = ["value()." ++ getVarName var ++ " = " ++ codeExpr expr "value()." ++ ";"]
codeStmt (DVarDef var expr) = case expr of
  DAggr {} ->
    if isNvals expr
      then ["getMessage(messages);"]
      else []
  _ -> ["value()." ++ getVarName var ++ " = " ++ codeExpr expr "value()." ++ ";"]
codeStmt (DReturnDef var) = ["//return value()." ++ getVarName var ++ ";"]
codeStmt (DLoopDef conditions stmts) =
  ["while(" ++ codeExpr conditions "value()." ++ "){"]
    ++ concatMap codeStmt' stmts
    ++ ["}"]
codeStmt a = [show a]

codeStmt' :: DStatement -> [String]
codeStmt' = indent . codeStmt

codeExpr :: DExpr -> String -> String
codeExpr (DCExp const _) _ = codeConst const
codeExpr (DIf ife thene elsee _) v = "(" ++ codeExpr ife v ++ ")?(" ++ codeExpr thene v ++ "):(" ++ codeExpr elsee v ++ ")"
codeExpr (DCmprhnsnExp expr _ _) v = codeExpr expr v
codeExpr (DChoiceVID ids _) v = intercalate " || " (map (("id==" ++) . show) ids)
codeExpr (DVExp var _) v = v ++ getVarName var
codeExpr s@(DFunAp f arg _) v = "(" ++ codeFunAp s v ++ ")"
codeExpr e _ = show e

codeConst :: DConst -> String
codeConst (DCInt i _) = show i
codeConst (DCBool True _) = "true"
codeConst (DCBool False _) = "false"
codeConst (DCString str _) = str
codeConst (DCDouble d _) = show d
codeConst DCAllV = "true"
codeConst DCEmpty = "false"

codeFunAp :: DExpr -> String -> String
codeFunAp (DFunAp (DBinOp "\\") [arg1, arg2] DTBool) v = codeExpr arg1 v ++ " && !" ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp "||") [arg1, arg2] _) v = codeExpr arg1 v ++ " || " ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp "&&") [arg1, arg2] _) v = codeExpr arg1 v ++ " && " ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp ">=") [arg1, arg2] _) v = codeExpr arg1 v ++ " >= " ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp "<=") [arg1, arg2] _) v = codeExpr arg1 v ++ " <= " ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp ">") [arg1, arg2] _) v = codeExpr arg1 v ++ " > " ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp "<") [arg1, arg2] _) v = codeExpr arg1 v ++ " < " ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp "==") [arg1, arg2] _) v = codeExpr arg1 v ++ " == " ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp "!=") [arg1, arg2] _) v = codeExpr arg1 v ++ " != " ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp "+") [arg1, arg2] _) v = codeExpr arg1 v ++ " + " ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp "-") [arg1, arg2] _) v = codeExpr arg1 v ++ " - " ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp "*") [arg1, arg2] _) v = codeExpr arg1 v ++ " * " ++ codeExpr arg2 v
codeFunAp (DFunAp (DBinOp "/") [arg1, arg2] _) v = codeExpr arg1 v ++ " / " ++ codeExpr arg2 v
codeFunAp (DFunAp (DFun "neg") [arg] _) v = "- " ++ codeExpr arg v
codeFunAp (DFunAp (DFun "not") [arg] _) v = "!" ++ codeExpr arg v
codeFunAp (DFunAp (DBinOp f) [arg1, arg2] _) v = codeExpr arg1 v ++ f ++ codeExpr arg2 v
codeFunAp (DFunAp (DFun f) (h : args) _) v = f ++ "(" ++ codeExpr h v ++ concatMap ((:) ',' . flip codeExpr v) args ++ ")"

codeDAgg :: DAgg -> String -> String -> String
codeDAgg DAggMin agg p = agg ++ "=min(" ++ agg ++ "," ++ p ++ ");"
codeDAgg DAggMax agg p = agg ++ "=max(" ++ agg ++ "," ++ p ++ ");"
codeDAgg DAggSum agg p = agg ++ "+=" ++ p ++ ";"
codeDAgg DAggProd agg p = agg ++ "*=" ++ p ++ ";"
codeDAgg DAggAnd agg p = agg ++ "=" ++ agg ++ "&&" ++ p ++ ";"
codeDAgg DAggOr agg p = agg ++ "=" ++ agg ++ "||" ++ p ++ ";"

codeAggExpr :: DExpr -> DGen -> String
codeAggExpr expr gen = codeExpr (cExpr expr gen) "v->value()."

codeMsgExpr :: DExpr -> DGen -> String
codeMsgExpr expr gen = codeExpr (cExpr expr gen) "value()."

cExpr :: DExpr -> DGen -> DExpr
cExpr e@(DCExp const _) _ = e
cExpr (DIf ife thene elsee t) gen = DIf (cExpr ife gen) (cExpr thene gen) (cExpr elsee gen) t
cExpr e@(DVExp var t) (DGenG v g _) = if getVarName var == getVarName v then g else e
cExpr (DFunAp f args t) gen = DFunAp f (map (`cExpr` gen) args) t
cExpr e _ = e

indent :: [String] -> [String]
indent = map ("    " ++)