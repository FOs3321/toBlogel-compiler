{-# OPTIONS_GHC -w #-}
module Parser where
import Lexer
import Spec
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.8

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 t17 t18
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13
	| HappyAbsSyn14 t14
	| HappyAbsSyn15 t15
	| HappyAbsSyn16 t16
	| HappyAbsSyn17 t17
	| HappyAbsSyn18 t18

happyExpList :: Happy_Data_Array.Array Int Int
happyExpList = Happy_Data_Array.listArray (0,259) ([0,0,2048,0,0,256,0,0,48,32768,0,0,0,0,0,0,0,0,128,0,0,0,96,0,0,0,0,8192,0,0,0,0,128,0,0,0,192,63488,4115,0,0,0,0,0,16,0,0,3656,0,0,16,0,0,0,0,254,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,63488,2,0,32512,514,0,3040,0,0,256,0,0,64,0,0,0,0,65024,4,0,0,0,0,1024,0,0,0,0,57344,79,0,64512,9,0,16256,1,0,10224,0,0,1278,0,49152,159,0,63488,19,0,0,0,0,0,29280,0,0,0,0,0,32,0,4,0,32768,0,0,0,49152,0,0,256,0,639,2,57344,16463,0,64512,2057,0,0,0,0,0,0,0,15872,0,0,6080,0,0,120,0,0,0,0,0,0,0,12288,0,0,1536,0,0,0,0,0,255,0,0,256,0,0,256,0,128,0,0,16,0,0,0,0,0,64,0,0,64,0,0,0,0,8192,0,63488,19,0,0,128,0,0,29248,0,0,3660,0,0,457,0,6128,0,0,4096,0,0,58560,0,0,0,0,0,8,0,4096,0,64512,9,0,0,64,0,0,14624,0,65024,2,0,0,0,0,38912,28,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parser","programSpec","funDefs","funDef","mainDef","statements","statement","expr","expr4","expr3","expr2","expr1","expr0","const","fun","var","INT","DOUBLE","BOOL","\"empty\"","'V'","\"not\"","'('","')'","'+'","'-'","'*'","'/'","CMP","\"!!\"","\"&&\"","'{'","'}'","\"if\"","\"then\"","\"else\"","\"while\"","';'","'='","\"return\"","UPPER","STRING","%eof"]
        bit_start = st * 45
        bit_end = (st + 1) * 45
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..44]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (44) = happyShift action_4
action_0 (4) = happyGoto action_5
action_0 (7) = happyGoto action_2
action_0 (17) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (44) = happyShift action_4
action_1 (7) = happyGoto action_2
action_1 (17) = happyGoto action_3
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (43) = happyShift action_10
action_2 (44) = happyShift action_11
action_2 (5) = happyGoto action_7
action_2 (6) = happyGoto action_8
action_2 (18) = happyGoto action_9
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (25) = happyShift action_6
action_3 _ = happyFail (happyExpListPerState 3)

action_4 _ = happyReduce_36

action_5 (45) = happyAccept
action_5 _ = happyFail (happyExpListPerState 5)

action_6 (26) = happyShift action_15
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (43) = happyShift action_10
action_7 (44) = happyShift action_11
action_7 (6) = happyGoto action_14
action_7 (18) = happyGoto action_9
action_7 _ = happyReduce_1

action_8 _ = happyReduce_2

action_9 (41) = happyShift action_13
action_9 _ = happyFail (happyExpListPerState 9)

action_10 _ = happyReduce_38

action_11 (25) = happyShift action_12
action_11 _ = happyReduce_37

action_12 (43) = happyShift action_10
action_12 (44) = happyShift action_11
action_12 (18) = happyGoto action_33
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (19) = happyShift action_24
action_13 (20) = happyShift action_25
action_13 (21) = happyShift action_26
action_13 (22) = happyShift action_27
action_13 (23) = happyShift action_28
action_13 (24) = happyShift action_29
action_13 (25) = happyShift action_30
action_13 (28) = happyShift action_31
action_13 (36) = happyShift action_32
action_13 (10) = happyGoto action_17
action_13 (11) = happyGoto action_18
action_13 (12) = happyGoto action_19
action_13 (13) = happyGoto action_20
action_13 (14) = happyGoto action_21
action_13 (15) = happyGoto action_22
action_13 (16) = happyGoto action_23
action_13 _ = happyFail (happyExpListPerState 13)

action_14 _ = happyReduce_3

action_15 (34) = happyShift action_16
action_15 _ = happyFail (happyExpListPerState 15)

action_16 (36) = happyShift action_50
action_16 (39) = happyShift action_51
action_16 (42) = happyShift action_52
action_16 (43) = happyShift action_10
action_16 (44) = happyShift action_11
action_16 (8) = happyGoto action_47
action_16 (9) = happyGoto action_48
action_16 (18) = happyGoto action_49
action_16 _ = happyFail (happyExpListPerState 16)

action_17 (40) = happyShift action_46
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_13

action_19 (27) = happyShift action_39
action_19 (28) = happyShift action_40
action_19 (29) = happyShift action_41
action_19 (30) = happyShift action_42
action_19 (31) = happyShift action_43
action_19 (32) = happyShift action_44
action_19 (33) = happyShift action_45
action_19 _ = happyReduce_16

action_20 _ = happyReduce_24

action_21 _ = happyReduce_27

action_22 _ = happyReduce_28

action_23 _ = happyReduce_29

action_24 _ = happyReduce_31

action_25 _ = happyReduce_32

action_26 _ = happyReduce_33

action_27 _ = happyReduce_35

action_28 _ = happyReduce_34

action_29 (19) = happyShift action_24
action_29 (20) = happyShift action_25
action_29 (21) = happyShift action_26
action_29 (22) = happyShift action_27
action_29 (23) = happyShift action_28
action_29 (25) = happyShift action_30
action_29 (14) = happyGoto action_38
action_29 (15) = happyGoto action_22
action_29 (16) = happyGoto action_23
action_29 _ = happyFail (happyExpListPerState 29)

action_30 (19) = happyShift action_24
action_30 (20) = happyShift action_25
action_30 (21) = happyShift action_26
action_30 (22) = happyShift action_27
action_30 (23) = happyShift action_28
action_30 (24) = happyShift action_29
action_30 (25) = happyShift action_30
action_30 (28) = happyShift action_31
action_30 (36) = happyShift action_32
action_30 (10) = happyGoto action_37
action_30 (11) = happyGoto action_18
action_30 (12) = happyGoto action_19
action_30 (13) = happyGoto action_20
action_30 (14) = happyGoto action_21
action_30 (15) = happyGoto action_22
action_30 (16) = happyGoto action_23
action_30 _ = happyFail (happyExpListPerState 30)

action_31 (19) = happyShift action_24
action_31 (20) = happyShift action_25
action_31 (21) = happyShift action_26
action_31 (22) = happyShift action_27
action_31 (23) = happyShift action_28
action_31 (25) = happyShift action_30
action_31 (14) = happyGoto action_36
action_31 (15) = happyGoto action_22
action_31 (16) = happyGoto action_23
action_31 _ = happyFail (happyExpListPerState 31)

action_32 (25) = happyShift action_35
action_32 _ = happyFail (happyExpListPerState 32)

action_33 (26) = happyShift action_34
action_33 _ = happyFail (happyExpListPerState 33)

action_34 _ = happyReduce_39

action_35 (19) = happyShift action_24
action_35 (20) = happyShift action_25
action_35 (21) = happyShift action_26
action_35 (22) = happyShift action_27
action_35 (23) = happyShift action_28
action_35 (24) = happyShift action_29
action_35 (25) = happyShift action_30
action_35 (28) = happyShift action_31
action_35 (12) = happyGoto action_67
action_35 (13) = happyGoto action_20
action_35 (14) = happyGoto action_21
action_35 (15) = happyGoto action_22
action_35 (16) = happyGoto action_23
action_35 _ = happyFail (happyExpListPerState 35)

action_36 _ = happyReduce_25

action_37 (26) = happyShift action_66
action_37 _ = happyFail (happyExpListPerState 37)

action_38 _ = happyReduce_26

action_39 (19) = happyShift action_24
action_39 (20) = happyShift action_25
action_39 (21) = happyShift action_26
action_39 (22) = happyShift action_27
action_39 (23) = happyShift action_28
action_39 (24) = happyShift action_29
action_39 (25) = happyShift action_30
action_39 (28) = happyShift action_31
action_39 (12) = happyGoto action_65
action_39 (13) = happyGoto action_20
action_39 (14) = happyGoto action_21
action_39 (15) = happyGoto action_22
action_39 (16) = happyGoto action_23
action_39 _ = happyFail (happyExpListPerState 39)

action_40 (19) = happyShift action_24
action_40 (20) = happyShift action_25
action_40 (21) = happyShift action_26
action_40 (22) = happyShift action_27
action_40 (23) = happyShift action_28
action_40 (24) = happyShift action_29
action_40 (25) = happyShift action_30
action_40 (28) = happyShift action_31
action_40 (12) = happyGoto action_64
action_40 (13) = happyGoto action_20
action_40 (14) = happyGoto action_21
action_40 (15) = happyGoto action_22
action_40 (16) = happyGoto action_23
action_40 _ = happyFail (happyExpListPerState 40)

action_41 (19) = happyShift action_24
action_41 (20) = happyShift action_25
action_41 (21) = happyShift action_26
action_41 (22) = happyShift action_27
action_41 (23) = happyShift action_28
action_41 (24) = happyShift action_29
action_41 (25) = happyShift action_30
action_41 (28) = happyShift action_31
action_41 (12) = happyGoto action_63
action_41 (13) = happyGoto action_20
action_41 (14) = happyGoto action_21
action_41 (15) = happyGoto action_22
action_41 (16) = happyGoto action_23
action_41 _ = happyFail (happyExpListPerState 41)

action_42 (19) = happyShift action_24
action_42 (20) = happyShift action_25
action_42 (21) = happyShift action_26
action_42 (22) = happyShift action_27
action_42 (23) = happyShift action_28
action_42 (24) = happyShift action_29
action_42 (25) = happyShift action_30
action_42 (28) = happyShift action_31
action_42 (12) = happyGoto action_62
action_42 (13) = happyGoto action_20
action_42 (14) = happyGoto action_21
action_42 (15) = happyGoto action_22
action_42 (16) = happyGoto action_23
action_42 _ = happyFail (happyExpListPerState 42)

action_43 (19) = happyShift action_24
action_43 (20) = happyShift action_25
action_43 (21) = happyShift action_26
action_43 (22) = happyShift action_27
action_43 (23) = happyShift action_28
action_43 (24) = happyShift action_29
action_43 (25) = happyShift action_30
action_43 (28) = happyShift action_31
action_43 (12) = happyGoto action_61
action_43 (13) = happyGoto action_20
action_43 (14) = happyGoto action_21
action_43 (15) = happyGoto action_22
action_43 (16) = happyGoto action_23
action_43 _ = happyFail (happyExpListPerState 43)

action_44 (19) = happyShift action_24
action_44 (20) = happyShift action_25
action_44 (21) = happyShift action_26
action_44 (22) = happyShift action_27
action_44 (23) = happyShift action_28
action_44 (24) = happyShift action_29
action_44 (25) = happyShift action_30
action_44 (28) = happyShift action_31
action_44 (12) = happyGoto action_60
action_44 (13) = happyGoto action_20
action_44 (14) = happyGoto action_21
action_44 (15) = happyGoto action_22
action_44 (16) = happyGoto action_23
action_44 _ = happyFail (happyExpListPerState 44)

action_45 (19) = happyShift action_24
action_45 (20) = happyShift action_25
action_45 (21) = happyShift action_26
action_45 (22) = happyShift action_27
action_45 (23) = happyShift action_28
action_45 (24) = happyShift action_29
action_45 (25) = happyShift action_30
action_45 (28) = happyShift action_31
action_45 (12) = happyGoto action_59
action_45 (13) = happyGoto action_20
action_45 (14) = happyGoto action_21
action_45 (15) = happyGoto action_22
action_45 (16) = happyGoto action_23
action_45 _ = happyFail (happyExpListPerState 45)

action_46 _ = happyReduce_4

action_47 (35) = happyShift action_58
action_47 (36) = happyShift action_50
action_47 (39) = happyShift action_51
action_47 (42) = happyShift action_52
action_47 (43) = happyShift action_10
action_47 (44) = happyShift action_11
action_47 (9) = happyGoto action_57
action_47 (18) = happyGoto action_49
action_47 _ = happyFail (happyExpListPerState 47)

action_48 _ = happyReduce_6

action_49 (41) = happyShift action_56
action_49 _ = happyFail (happyExpListPerState 49)

action_50 (25) = happyShift action_55
action_50 _ = happyFail (happyExpListPerState 50)

action_51 (25) = happyShift action_54
action_51 _ = happyFail (happyExpListPerState 51)

action_52 (43) = happyShift action_10
action_52 (44) = happyShift action_11
action_52 (18) = happyGoto action_53
action_52 _ = happyFail (happyExpListPerState 52)

action_53 (40) = happyShift action_72
action_53 _ = happyFail (happyExpListPerState 53)

action_54 (19) = happyShift action_24
action_54 (20) = happyShift action_25
action_54 (21) = happyShift action_26
action_54 (22) = happyShift action_27
action_54 (23) = happyShift action_28
action_54 (24) = happyShift action_29
action_54 (25) = happyShift action_30
action_54 (28) = happyShift action_31
action_54 (36) = happyShift action_32
action_54 (10) = happyGoto action_71
action_54 (11) = happyGoto action_18
action_54 (12) = happyGoto action_19
action_54 (13) = happyGoto action_20
action_54 (14) = happyGoto action_21
action_54 (15) = happyGoto action_22
action_54 (16) = happyGoto action_23
action_54 _ = happyFail (happyExpListPerState 54)

action_55 (19) = happyShift action_24
action_55 (20) = happyShift action_25
action_55 (21) = happyShift action_26
action_55 (22) = happyShift action_27
action_55 (23) = happyShift action_28
action_55 (24) = happyShift action_29
action_55 (25) = happyShift action_30
action_55 (28) = happyShift action_31
action_55 (36) = happyShift action_32
action_55 (10) = happyGoto action_70
action_55 (11) = happyGoto action_18
action_55 (12) = happyGoto action_19
action_55 (13) = happyGoto action_20
action_55 (14) = happyGoto action_21
action_55 (15) = happyGoto action_22
action_55 (16) = happyGoto action_23
action_55 _ = happyFail (happyExpListPerState 55)

action_56 (19) = happyShift action_24
action_56 (20) = happyShift action_25
action_56 (21) = happyShift action_26
action_56 (22) = happyShift action_27
action_56 (23) = happyShift action_28
action_56 (24) = happyShift action_29
action_56 (25) = happyShift action_30
action_56 (28) = happyShift action_31
action_56 (36) = happyShift action_32
action_56 (10) = happyGoto action_69
action_56 (11) = happyGoto action_18
action_56 (12) = happyGoto action_19
action_56 (13) = happyGoto action_20
action_56 (14) = happyGoto action_21
action_56 (15) = happyGoto action_22
action_56 (16) = happyGoto action_23
action_56 _ = happyFail (happyExpListPerState 56)

action_57 _ = happyReduce_7

action_58 _ = happyReduce_5

action_59 (27) = happyShift action_39
action_59 (28) = happyShift action_40
action_59 (29) = happyShift action_41
action_59 (30) = happyShift action_42
action_59 (31) = happyShift action_43
action_59 _ = happyReduce_18

action_60 (27) = happyShift action_39
action_60 (28) = happyShift action_40
action_60 (29) = happyShift action_41
action_60 (30) = happyShift action_42
action_60 (31) = happyShift action_43
action_60 (33) = happyShift action_45
action_60 _ = happyReduce_17

action_61 (27) = happyShift action_39
action_61 (28) = happyShift action_40
action_61 (29) = happyShift action_41
action_61 (30) = happyShift action_42
action_61 _ = happyReduce_19

action_62 _ = happyReduce_23

action_63 _ = happyReduce_22

action_64 (29) = happyShift action_41
action_64 (30) = happyShift action_42
action_64 _ = happyReduce_21

action_65 (29) = happyShift action_41
action_65 (30) = happyShift action_42
action_65 _ = happyReduce_20

action_66 _ = happyReduce_30

action_67 (26) = happyShift action_68
action_67 (27) = happyShift action_39
action_67 (28) = happyShift action_40
action_67 (29) = happyShift action_41
action_67 (30) = happyShift action_42
action_67 (31) = happyShift action_43
action_67 (32) = happyShift action_44
action_67 (33) = happyShift action_45
action_67 _ = happyFail (happyExpListPerState 67)

action_68 (37) = happyShift action_76
action_68 _ = happyFail (happyExpListPerState 68)

action_69 (40) = happyShift action_75
action_69 _ = happyFail (happyExpListPerState 69)

action_70 (26) = happyShift action_74
action_70 _ = happyFail (happyExpListPerState 70)

action_71 (26) = happyShift action_73
action_71 _ = happyFail (happyExpListPerState 71)

action_72 _ = happyReduce_12

action_73 (34) = happyShift action_79
action_73 _ = happyFail (happyExpListPerState 73)

action_74 (37) = happyShift action_78
action_74 _ = happyFail (happyExpListPerState 74)

action_75 _ = happyReduce_8

action_76 (34) = happyShift action_77
action_76 _ = happyFail (happyExpListPerState 76)

action_77 (19) = happyShift action_24
action_77 (20) = happyShift action_25
action_77 (21) = happyShift action_26
action_77 (22) = happyShift action_27
action_77 (23) = happyShift action_28
action_77 (24) = happyShift action_29
action_77 (25) = happyShift action_30
action_77 (28) = happyShift action_31
action_77 (12) = happyGoto action_82
action_77 (13) = happyGoto action_20
action_77 (14) = happyGoto action_21
action_77 (15) = happyGoto action_22
action_77 (16) = happyGoto action_23
action_77 _ = happyFail (happyExpListPerState 77)

action_78 (34) = happyShift action_81
action_78 _ = happyFail (happyExpListPerState 78)

action_79 (36) = happyShift action_50
action_79 (39) = happyShift action_51
action_79 (42) = happyShift action_52
action_79 (43) = happyShift action_10
action_79 (44) = happyShift action_11
action_79 (8) = happyGoto action_80
action_79 (9) = happyGoto action_48
action_79 (18) = happyGoto action_49
action_79 _ = happyFail (happyExpListPerState 79)

action_80 (35) = happyShift action_85
action_80 (36) = happyShift action_50
action_80 (39) = happyShift action_51
action_80 (42) = happyShift action_52
action_80 (43) = happyShift action_10
action_80 (44) = happyShift action_11
action_80 (9) = happyGoto action_57
action_80 (18) = happyGoto action_49
action_80 _ = happyFail (happyExpListPerState 80)

action_81 (36) = happyShift action_50
action_81 (39) = happyShift action_51
action_81 (42) = happyShift action_52
action_81 (43) = happyShift action_10
action_81 (44) = happyShift action_11
action_81 (8) = happyGoto action_84
action_81 (9) = happyGoto action_48
action_81 (18) = happyGoto action_49
action_81 _ = happyFail (happyExpListPerState 81)

action_82 (27) = happyShift action_39
action_82 (28) = happyShift action_40
action_82 (29) = happyShift action_41
action_82 (30) = happyShift action_42
action_82 (31) = happyShift action_43
action_82 (32) = happyShift action_44
action_82 (33) = happyShift action_45
action_82 (35) = happyShift action_83
action_82 _ = happyFail (happyExpListPerState 82)

action_83 (38) = happyShift action_87
action_83 _ = happyReduce_15

action_84 (35) = happyShift action_86
action_84 (36) = happyShift action_50
action_84 (39) = happyShift action_51
action_84 (42) = happyShift action_52
action_84 (43) = happyShift action_10
action_84 (44) = happyShift action_11
action_84 (9) = happyGoto action_57
action_84 (18) = happyGoto action_49
action_84 _ = happyFail (happyExpListPerState 84)

action_85 _ = happyReduce_11

action_86 (38) = happyShift action_89
action_86 _ = happyReduce_10

action_87 (34) = happyShift action_88
action_87 _ = happyFail (happyExpListPerState 87)

action_88 (19) = happyShift action_24
action_88 (20) = happyShift action_25
action_88 (21) = happyShift action_26
action_88 (22) = happyShift action_27
action_88 (23) = happyShift action_28
action_88 (24) = happyShift action_29
action_88 (25) = happyShift action_30
action_88 (28) = happyShift action_31
action_88 (12) = happyGoto action_91
action_88 (13) = happyGoto action_20
action_88 (14) = happyGoto action_21
action_88 (15) = happyGoto action_22
action_88 (16) = happyGoto action_23
action_88 _ = happyFail (happyExpListPerState 88)

action_89 (34) = happyShift action_90
action_89 _ = happyFail (happyExpListPerState 89)

action_90 (36) = happyShift action_50
action_90 (39) = happyShift action_51
action_90 (42) = happyShift action_52
action_90 (43) = happyShift action_10
action_90 (44) = happyShift action_11
action_90 (8) = happyGoto action_93
action_90 (9) = happyGoto action_48
action_90 (18) = happyGoto action_49
action_90 _ = happyFail (happyExpListPerState 90)

action_91 (27) = happyShift action_39
action_91 (28) = happyShift action_40
action_91 (29) = happyShift action_41
action_91 (30) = happyShift action_42
action_91 (31) = happyShift action_43
action_91 (32) = happyShift action_44
action_91 (33) = happyShift action_45
action_91 (35) = happyShift action_92
action_91 _ = happyFail (happyExpListPerState 91)

action_92 _ = happyReduce_14

action_93 (35) = happyShift action_94
action_93 (36) = happyShift action_50
action_93 (39) = happyShift action_51
action_93 (42) = happyShift action_52
action_93 (43) = happyShift action_10
action_93 (44) = happyShift action_11
action_93 (9) = happyGoto action_57
action_93 (18) = happyGoto action_49
action_93 _ = happyFail (happyExpListPerState 93)

action_94 _ = happyReduce_9

happyReduce_1 = happySpecReduce_2  4 happyReduction_1
happyReduction_1 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn7  happy_var_1)
	 =  HappyAbsSyn4
		 (DProgram happy_var_1 happy_var_2
	)
happyReduction_1 _ _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 ([happy_var_1]
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn6  happy_var_2)
	(HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn5
		 (happy_var_2 : happy_var_1
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happyReduce 4 6 happyReduction_4
happyReduction_4 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn6
		 (DFunDef happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_5 = happyReduce 6 7 happyReduction_5
happyReduction_5 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn7
		 (DMainDef happy_var_1 happy_var_5
	) `HappyStk` happyRest

happyReduce_6 = happySpecReduce_1  8 happyReduction_6
happyReduction_6 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 ([happy_var_1]
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  8 happyReduction_7
happyReduction_7 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn8
		 (happy_var_2 : happy_var_1
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happyReduce 4 9 happyReduction_8
happyReduction_8 (_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn18  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (DVarDef happy_var_1 happy_var_3 None
	) `HappyStk` happyRest

happyReduce_9 = happyReduce 12 9 happyReduction_9
happyReduction_9 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_11) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn8  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (DIfDef happy_var_3 happy_var_7 happy_var_11
	) `HappyStk` happyRest

happyReduce_10 = happyReduce 8 9 happyReduction_10
happyReduction_10 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (DIfDef happy_var_3 happy_var_7 []
	) `HappyStk` happyRest

happyReduce_11 = happyReduce 7 9 happyReduction_11
happyReduction_11 (_ `HappyStk`
	(HappyAbsSyn8  happy_var_6) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn9
		 (DLoopDef happy_var_3 happy_var_6 None 0 []
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_3  9 happyReduction_12
happyReduction_12 _
	(HappyAbsSyn18  happy_var_2)
	_
	 =  HappyAbsSyn9
		 (DReturnDef happy_var_2 None
	)
happyReduction_12 _ _ _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_1  10 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_1)
	 =  HappyAbsSyn10
		 (happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happyReduce 12 11 happyReduction_14
happyReduction_14 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_11) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (DIf happy_var_3 happy_var_7 happy_var_11 None
	) `HappyStk` happyRest

happyReduce_15 = happyReduce 8 11 happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn12  happy_var_7) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (DIf happy_var_3 happy_var_7 IfNone None
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_1  11 happyReduction_16
happyReduction_16 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (happy_var_1
	)
happyReduction_16 _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  12 happyReduction_17
happyReduction_17 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "||") [happy_var_1, happy_var_3] None
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  12 happyReduction_18
happyReduction_18 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "&&") [happy_var_1, happy_var_3] None
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_3  12 happyReduction_19
happyReduction_19 (HappyAbsSyn12  happy_var_3)
	(HappyTerminal (TokenCmp happy_var_2))
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp happy_var_2) [happy_var_1, happy_var_3] None
	)
happyReduction_19 _ _ _  = notHappyAtAll 

happyReduce_20 = happySpecReduce_3  12 happyReduction_20
happyReduction_20 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "+") [happy_var_1, happy_var_3] None
	)
happyReduction_20 _ _ _  = notHappyAtAll 

happyReduce_21 = happySpecReduce_3  12 happyReduction_21
happyReduction_21 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "-") [happy_var_1, happy_var_3] None
	)
happyReduction_21 _ _ _  = notHappyAtAll 

happyReduce_22 = happySpecReduce_3  12 happyReduction_22
happyReduction_22 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "*") [happy_var_1, happy_var_3] None
	)
happyReduction_22 _ _ _  = notHappyAtAll 

happyReduce_23 = happySpecReduce_3  12 happyReduction_23
happyReduction_23 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn12
		 (DFunAp (DBinOp "/") [happy_var_1, happy_var_3] None
	)
happyReduction_23 _ _ _  = notHappyAtAll 

happyReduce_24 = happySpecReduce_1  12 happyReduction_24
happyReduction_24 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn12
		 (happy_var_1
	)
happyReduction_24 _  = notHappyAtAll 

happyReduce_25 = happySpecReduce_2  13 happyReduction_25
happyReduction_25 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (DFunAp (DFun "neg" ) [happy_var_2] None
	)
happyReduction_25 _ _  = notHappyAtAll 

happyReduce_26 = happySpecReduce_2  13 happyReduction_26
happyReduction_26 (HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (DFunAp (DFun "not" ) [happy_var_2] None
	)
happyReduction_26 _ _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_1  13 happyReduction_27
happyReduction_27 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn13
		 (happy_var_1
	)
happyReduction_27 _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_1  14 happyReduction_28
happyReduction_28 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn14
		 (happy_var_1
	)
happyReduction_28 _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_1  15 happyReduction_29
happyReduction_29 (HappyAbsSyn16  happy_var_1)
	 =  HappyAbsSyn15
		 (DCExp happy_var_1 None
	)
happyReduction_29 _  = notHappyAtAll 

happyReduce_30 = happySpecReduce_3  15 happyReduction_30
happyReduction_30 _
	(HappyAbsSyn10  happy_var_2)
	_
	 =  HappyAbsSyn15
		 (happy_var_2
	)
happyReduction_30 _ _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  16 happyReduction_31
happyReduction_31 (HappyTerminal (TokenInt happy_var_1))
	 =  HappyAbsSyn16
		 (DCInt happy_var_1 DTInt
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_1  16 happyReduction_32
happyReduction_32 (HappyTerminal (TokenDouble happy_var_1))
	 =  HappyAbsSyn16
		 (DCDouble happy_var_1 DTDouble
	)
happyReduction_32 _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  16 happyReduction_33
happyReduction_33 (HappyTerminal (TokenBool happy_var_1))
	 =  HappyAbsSyn16
		 (DCBool happy_var_1 DTBool
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_1  16 happyReduction_34
happyReduction_34 _
	 =  HappyAbsSyn16
		 (DCAllV
	)

happyReduce_35 = happySpecReduce_1  16 happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn16
		 (DCEmpty
	)

happyReduce_36 = happySpecReduce_1  17 happyReduction_36
happyReduction_36 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn17
		 (DFun happy_var_1
	)
happyReduction_36 _  = notHappyAtAll 

happyReduce_37 = happySpecReduce_1  18 happyReduction_37
happyReduction_37 (HappyTerminal (TokenString happy_var_1))
	 =  HappyAbsSyn18
		 (DVar happy_var_1 0 None
	)
happyReduction_37 _  = notHappyAtAll 

happyReduce_38 = happySpecReduce_1  18 happyReduction_38
happyReduction_38 (HappyTerminal (TokenUpper happy_var_1))
	 =  HappyAbsSyn18
		 (DVarV happy_var_1 0
	)
happyReduction_38 _  = notHappyAtAll 

happyReduce_39 = happyReduce 4 18 happyReduction_39
happyReduction_39 (_ `HappyStk`
	(HappyAbsSyn18  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyTerminal (TokenString happy_var_1)) `HappyStk`
	happyRest)
	 = HappyAbsSyn18
		 (DFunV happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyNewToken action sts stk [] =
	action 45 45 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	TokenInt happy_dollar_dollar -> cont 19;
	TokenDouble happy_dollar_dollar -> cont 20;
	TokenBool happy_dollar_dollar -> cont 21;
	TokenEmpty -> cont 22;
	TokenV -> cont 23;
	TokenNot -> cont 24;
	TokenLParen -> cont 25;
	TokenRParen -> cont 26;
	TokenPlus -> cont 27;
	TokenMinus -> cont 28;
	TokenMul -> cont 29;
	TokenDev -> cont 30;
	TokenCmp happy_dollar_dollar -> cont 31;
	TokenOr -> cont 32;
	TokenAnd -> cont 33;
	TokenLBrace -> cont 34;
	TokenRBrace -> cont 35;
	TokenIf -> cont 36;
	TokenThen -> cont 37;
	TokenElse -> cont 38;
	TokenWhile -> cont 39;
	TokenSemiColon -> cont 40;
	TokenEqual -> cont 41;
	TokenReturn -> cont 42;
	TokenUpper happy_dollar_dollar -> cont 43;
	TokenString happy_dollar_dollar -> cont 44;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 45 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

newtype HappyIdentity a = HappyIdentity a
happyIdentity = HappyIdentity
happyRunIdentity (HappyIdentity a) = a

instance Functor HappyIdentity where
    fmap f (HappyIdentity a) = HappyIdentity (f a)

instance Applicative HappyIdentity where
    pure  = HappyIdentity
    (<*>) = ap
instance Monad HappyIdentity where
    return = pure
    (HappyIdentity p) >>= q = q p

happyThen :: () => HappyIdentity a -> (a -> HappyIdentity b) -> HappyIdentity b
happyThen = (>>=)
happyReturn :: () => a -> HappyIdentity a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> HappyIdentity a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [String]) -> HappyIdentity a
happyError' = HappyIdentity . (\(tokens, _) -> parseError tokens)
parser tks = happyRunIdentity happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


parseError :: [Token] -> a    
parseError x = error $ "Parse error" ++ show x
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4














































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}

















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8814_0/ghc_2.h" #-}




























































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 









{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Int Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is (1), it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}

{-# LINE 147 "templates/GenericTemplate.hs" #-}
indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x < y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `div` 16)) (bit `mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Int ->                    -- token number
         Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k - ((1) :: Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n - ((1) :: Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n - ((1)::Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery ((1) is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  (1) tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action (1) (1) tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ( (HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
