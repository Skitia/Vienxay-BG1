BEGIN X32VienJ

// Viconia "Conflict" 

IF ~Global("X32VienViconiaConflict","LOCALS",1)~ ViconiaConflict 
SAY @0 
++ @1 +  VC.B 
++ @2 + VC.C
++ @3 + VC.A
END 

IF ~~ VC.A 
SAY @4
IF ~~ DO ~SetGlobal("X32VienViconiaConflict","LOCALS",2)~ EXIT
END 

IF ~~ VC.B 
SAY @5
IF ~~ DO ~SetGlobal("X32VienViconiaConflict","LOCALS",2)~ EXIT
END 

// Baeloth Conflict 

IF ~Global("X32VienBaelothConflict","LOCALS",1)~ BaelothConflict 
SAY @6 
+~CheckStatGT(Player1,15,STR)~+ @7 +  BA.B 
+~RandomNum(3,1)CheckStatLT(Player1,16,STR)~+ @7 +  BA.B 
+~RandomNum(3,2)CheckStatLT(Player1,16,STR)~+ @7 +  BA.A 
+~RandomNum(3,3)CheckStatLT(Player1,16,STR)~+ @7 +  BA.A 
+~InParty("Viconia")~+ @8 + BA.D
++ @9 + BA.C
+~CheckStatGT(Player1,15,CHR)~+ @10 + BA.B
+~RandomNum(3,1)CheckStatLT(Player1,16,CHR)~+ @10 + BA.B
+~RandomNum(3,2)CheckStatLT(Player1,16,CHR)~+ @10 + BA.A
+~RandomNum(3,3)CheckStatLT(Player1,16,CHR)~+ @10 + BA.A
END 

IF ~~ BA.A 
SAY @11
++ @12 + BA.E
++ @13 + BA.C
END 

IF ~~ BA.B 
SAY @14
IF ~~ DO ~SetGlobal("X32VienBaelothConflict","LOCALS",2)~ EXIT
END 

IF ~~ BA.D
SAY @15 
+~CheckStatGT(Player1,15,STR)~+ @7 +  BA.B 
+~CheckStatLT(Player1,16,STR)~+ @7 +  BA.B 
+~CheckStatLT(Player1,16,STR)~+ @7 +  BA.A 
+~CheckStatLT(Player1,16,STR)~+ @7 +  BA.A
++ @16 + BA.C
+~CheckStatGT(Player1,15,CHR)~+ @10 + BA.B
+~RandomNum(3,1)CheckStatLT(Player1,16,CHR)~+ @10 + BA.B
+~RandomNum(3,2)CheckStatLT(Player1,16,CHR)~+ @10 + BA.A
+~RandomNum(3,3)CheckStatLT(Player1,16,CHR)~+ @10 + BA.A
END 

IF ~~ BA.E 
SAY @17 
IF ~~ DO ~SetGlobal("X32VienBaelothConflict","LOCALS",-2)
SetGlobal("bd_joined","locals",0)
SetGlobal("bd_npc_camp","locals",1)
ChangeAIScript("bdparty",DEFAULT)LeaveParty()~
EXIT 
END 

// Talk 1 

IF ~Global("X32VienTalk","GLOBAL",2)~ Talk1 
SAY @18
++ @19 + Talk1.A
++ @20 + Talk1.B
++ @21 + Talk1.C
END 

IF ~~ Talk1.A 
SAY @22
IF ~~ + Talk1.D 
END 

IF ~~ Talk1.B
SAY @23
IF ~~ + Talk1.A 
END 

IF ~~ Talk1.C 
SAY @24
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ Talk1.D 
SAY @25
++ @26 + Talk1.E 
++ @27 + Talk1.F 
++ @28 + Talk1.C 
END 

IF ~~ Talk1.E 
SAY @29 
+~Global("X32VienWasInBG1","GLOBAL",1)~+ @30 + Talk1.BG1
++ @27 + Talk1.F 
++ @28 + Talk1.C 
END 

IF ~~ Talk1.F 
SAY @31
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

IF ~~ Talk1.BG1 
SAY @32
= @33
+~Gender(Player1,MALE)!Race(Player1,HALFLING)!Race(Player1,DWARF)!Race(Player1,GNOME)~+ @34 + Talk1.G // This line will set Romance to one. There aren't any gender checks, I'll just set up some race ones here.~
++ @27 + Talk1.F 
++ @28 + Talk1.C 
END 

IF ~~ Talk1.G 
SAY @35
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

// Talk 2

IF ~Global("X32VienTalk","GLOBAL",4)~ Talk2
SAY @36 
++ @37 + Talk2.A
+~Race(Player1,HUMAN)~+ @38 + Talk2.B
++ @39 + Talk2.C
++ @40 + Talk2.D
END

IF ~~ Talk2.A 
SAY @41
= @42
+~Alignment("X3Vien",NEUTRAL)~+ @43 + Talk2.E 
+~Alignment("X3Vien",NEUTRAL_EVIL)~+ @43 + Talk2.F
++ @44 + Talk2.G
++ @45 + Talk2.H
END 

IF ~~ Talk2.B
SAY @46 
IF ~~ + Talk2.A 
END 

IF ~~ Talk2.C 
SAY @47
IF ~~ + Talk2.A 
END 

IF ~~ Talk2.D 
SAY @48
IF ~~ + Talk2.A 
END  

IF ~~ Talk2.E 
SAY @49
IF ~~ + Talk2.G
END 

IF ~~ Talk2.F 
SAY @50
IF ~~ + Talk2.G
END 

IF ~~ Talk2.G 
SAY @51
++ @52 + Talk2.I
++ @53 + Talk2.J
++ @54 + Talk2.K // This breaks romance.
END 

IF ~~ Talk2.H 
SAY @55
IF ~~ + Talk2.G 
END 

IF ~~ Talk2.I 
SAY @56
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

IF ~~ Talk2.J 
SAY @57
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

IF ~~ Talk2.K 
SAY @58
IF ~~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

// Talk 3

IF ~Global("X32VienTalk","GLOBAL",6)~ Talk3
SAY @59 
++ @60 + Talk3.A
++ @61 + Talk3.A
++ @62 + Talk3.B
END 

IF ~~ Talk3.B 
SAY @63
IF ~~ + Talk3.A 
END 

IF ~~ Talk3.A 
SAY @64
++ @65 + Talk3.C
++ @66 + Talk3.D
++ @67 + Talk3.E
++ @68 + Talk3.Exit 
END 

IF ~~ Talk3.C 
SAY @69
IF ~~ + Talk3.F 
END 

IF ~~ Talk3.D 
SAY @70
IF ~~ + Talk3.C 
END 

IF ~~ Talk3.E 
SAY @71
IF ~~ + Talk3.F 
END 

IF ~~ Talk3.F 
SAY @72
++ @73 + Talk3.G
++ @74 + Talk3.H
++ @75 + Talk3.Exit 
END 

IF ~~ Talk3.Exit 
SAY @76
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

IF ~~ Talk3.G 
SAY @77
IF ~~ + Talk3.I 
END 

IF ~~ Talk3.H 
SAY @78
IF ~~ + Talk3.I 
END 

IF ~~ Talk3.I 
SAY @79
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

// Talk 4 

IF ~Global("X32VienTalk","GLOBAL",8)~ Talk4 
SAY @80 
++ @81 + Talk4.A
++ @82 + Talk4.B 
++ @83 + Talk4.C 
++ @84 + Talk4.B
++ @85 + Talk4.D
END 

IF ~~ Talk4.A 
SAY @86
++ @87 + Talk4.E
++ @88 + Talk4.F
++ @85 + Talk4.D
++ @89 + Talk4.F
++ @83 + Talk4.C
END 

IF ~~ Talk4.B 
SAY @90
IF ~~ + Talk4.A 
END 

IF ~~ Talk4.C 
SAY @91
IF ~~ + Talk4.G
END 

IF ~~ Talk4.D 
SAY @92
IF ~~ + Talk4.G 
END 

IF ~~ Talk4.E 
SAY @93
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

IF ~~ Talk4.F 
SAY @94
IF ~~ + Talk4.G 
END 

IF ~~ Talk4.G
SAY @95
+~Gender(Player1,MALE)!Race(Player1,HALFLING)!Race(Player1,DWARF)!Race(Player1,GNOME)Global("X32VienWasInBG1","GLOBAL",1)~+ @96  + Talk4.H1 
+~Gender(Player1,MALE)!Race(Player1,HALFLING)!Race(Player1,DWARF)!Race(Player1,GNOME)!Global("X32VienWasInBG1","GLOBAL",1)~+ @96  + Talk4.H2 
+~Gender(Player1,FEMALE)!Race(Player1,HALFLING)!Race(Player1,DWARF)!Race(Player1,GNOME)~+ @96 + Talk4.H3 
+~OR(3)Race(Player1,HALFLING)Race(Player1,DWARF)Race(Player1,GNOME)~+ @96 + Talk4.H4 
+~!Race(Player1,ELF)~+ @97 + Talk4.I
++ @98 + Talk4.J
++ @99 DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + Talk4.K
END 

IF ~~ Talk4.H1 
SAY @100
IF ~~ + Talk4.L
END 

IF ~~ Talk4.H2 
SAY @101
IF ~~ + Talk4.L
END 

IF ~~ Talk4.H3 
SAY @102
IF ~~ + Talk4.N 
END 

IF ~~ Talk4.H4 
SAY @103
IF ~~ + Talk4.N 
END

IF ~~ Talk4.I 
SAY @104
IF ~~ + Talk4.M 
END 

IF ~~ Talk4.J 
SAY @105
IF ~~ + Talk4.M
END 

IF ~~ Talk4.K 
SAY @106
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ Talk4.L 
SAY @107
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ Talk4.M 
SAY  @108 
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ Talk4.N 
SAY @109
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~Global("X32VienTalk","GLOBAL",10)~ Talk5 // IF the PC indicates they only wish friendship, or just wishes some rest, the romance becomes inactive even if they sleep together.
SAY @110  
++ @111 + T5.A
++ @112 + T5.A 
++ @113 DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.X 
END 

IF ~~ T5.A 
SAY @114
IF ~Race(Player1,ELF)~ + T5.B1  
IF ~!Race(Player1,ELF)~ + T5.B2 
END 

IF ~~ T5.B1 
SAY @115 
= @116
++ @117 + T5.C1
++ @118 + T5.D 
++ @119 + T5.C2
++ @120 + T5.D 
END  

IF ~~ T5.B2
SAY @121
= @122 
++ @123 + T5.C3 
++ @117 +T5.C1 
++ @118 + T5.D 
++ @119 + T5.C2 
++ @120 + T5.D 
END 

IF ~~ T5.C1 
SAY @124
IF ~~ + T5.D 
END 

IF ~~ T5.C2 
SAY @125
IF ~~ + T5.D 
END 

IF ~~ T5.C3 
SAY @126
IF ~~ + T5.D 
END 

IF ~~ T5.D 
SAY @127
++ @128 + T5.E 
++ @129 + T5.H 
++ @130 + T5.G 
END 

IF ~~ T5.E 
SAY @131
++ @132 DO ~SetGlobal("X32VienRomanceActive","GLOBAL",2)~ + T5.K 
++ @133 DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.F 
++ @134 + T5.J
END 

IF ~~ T5.F 
SAY @135
= @136
++ @137  + T5.H
++ @138 + T5.I 
++ @139 + T5.I 
END 

IF ~~ T5.G 
SAY @140
++ @137 DO ~SetGlobal("X32VienRomanceActive","GLOBAL",2)~ + T5.H 
++ @138  DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.I 
++ @139 DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.I 
END 

IF ~~ T5.H 
SAY @141
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)SetGlobal("X32VienPIDTalk3","GLOBAL",1)RestParty()~ EXIT // This PID variable activates Vienxay's last PID Talk and is used in talk 6
END 

IF ~~ T5.I 
SAY @142
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)RestParty()~ EXIT // This PID variable activates Vienxay's last PID Talk and is used in talk 6
END 

IF ~~ T5.J
SAY @143
++ @137 DO ~SetGlobal("X32VienRomanceActive","GLOBAL",2)~ + T5.H 
++ @138  DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.I 
++ @139 DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.I 
END 

IF ~~ T5.K 
SAY @144
= @145
= @146
++ @147 + T5.L 
++ @148 + T5.M
++ @149 DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~  + T5.N  
END  

IF ~~ T5.L 
SAY @150
= @151 
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)RestParty()~ EXIT 
END 

IF ~~ T5.M 
SAY @152
IF ~~ + T5.L 
END 

IF ~~ T5.N 
SAY @153
= @154 
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)RestParty()~ EXIT 
END 


IF ~~ T5.X 
SAY @155
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)RestParty()~ EXIT 
END 

IF ~Global("X32VienTalk","GLOBAL",12)~ Talk6 
SAY @156
++ @157 + T6.A 
++ @158 + T6.B 
++ @159 + T6.C 
END 

IF ~~ T6.A 
SAY @160
IF ~Global("X32VienRomanceActive","GLOBAL",2)~ + T6.D 
IF ~!Global("X32VienRomanceActive","GLOBAL",2)~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ T6.B 
SAY @161
IF ~Global("X32VienRomanceActive","GLOBAL",2)~ + T6.D 
IF ~!Global("X32VienRomanceActive","GLOBAL",2)~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ T6.C 
SAY @162
IF ~Global("X32VienRomanceActive","GLOBAL",2)~ + T6.D 
IF ~!Global("X32VienRomanceActive","GLOBAL",2)~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ T6.D 
SAY @163
IF ~GlobalGT("X32VienPIDTalk3","GLOBAL",0)~ + T6.E  
IF ~!GlobalGT("X32VienPIDTalk3","GLOBAL",0)~ + T6.F 
END 

IF ~~ T6.E 
SAY @164
IF ~~ + T6.G 
END 

IF ~~ T6.F 
SAY @165
IF ~~ + T6.G 
END 

IF ~~ T6.G 
SAY @166
++ @167 + T6.H
++ @168 + T6.H
++ @169 +  T6.H
END 

IF ~~ T6.H 
SAY @170 
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

// THRIX

IF ~Global("X32VienSacrifice","bd4500",1)~ ThrixTalk0
SAY @171
+ ~!Global("X32_thrix_mark_Vienxay","global",1)~ + @172 DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk2
+ ~Global("X32_thrix_mark_Vienxay","global",1)~ + @172 DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk1
+ ~!Global("X32_thrix_mark_Vienxay","global",1)~ + @173 DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk3
+ ~Global("X32_thrix_mark_Vienxay","global",1)~ + @173 DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk1
+ ~!Global("X32_thrix_mark_Vienxay","global",1)~ + @174 DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk4
+ ~Global("X32_thrix_mark_Vienxay","global",1)~ + @174 DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk1
END

IF ~~ ThrixTalk1
 SAY @175
IF ~OR(2)
Global("X32VienRomanceActive","GLOBAL",1)
Global("X32VienRomanceActive","GLOBAL",2)~ + ThrixTalk5
IF ~!Global("X32VienRomanceActive","GLOBAL",1)
!Global("X32VienRomanceActive","GLOBAL",2)~ EXIT
END

IF ~~ ThrixTalk2
 SAY @176
IF ~~ + ThrixTalk6
END

IF ~~ ThrixTalk3
 SAY @177
IF ~~ + ThrixTalk6
END

IF ~~ ThrixTalk4
 SAY @178
IF ~OR(2)
Global("X32VienRomanceActive","GLOBAL",1)
Global("X32VienRomanceActive","GLOBAL",2)~ + ThrixTalk5
IF ~!Global("X32VienRomanceActive","GLOBAL",1)
!Global("X32VienRomanceActive","GLOBAL",2)~ EXIT
END

IF ~~ ThrixTalk5
 SAY @179
IF ~~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ ThrixTalk6
 SAY @180
IF ~~ EXIT
END


// Shadow Weave. This talk will only fire at night, and one game day after talk 3.

IF ~Global("X32VQuestTalk","GLOBAL",2)~ QTalk 
SAY @181 
++ @182 + QTalk.1 
++ @183 + QTalk.1
++ @184 + QTalk.2
END 

IF ~~ QTalk.1
SAY @185
= @186
++ @187 + QTalk.3
++ @188 + QTalk.4
++ @189 + QTalk.5 
END 

IF ~~ QTalk.2 
SAY @190
IF ~~ + QTalk.1 
END 

IF ~~ QTalk.3 
SAY @191
= @192
IF ~~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",3)AddJournalEntry(@10153,QUEST)~ EXIT  
END  

IF ~~ QTalk.4 
SAY @193
IF ~~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",3)AddJournalEntry(@10153,QUEST)~ EXIT  
END  

IF ~~ QTalk.5 
SAY @194
IF ~~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",3)AddJournalEntry(@10153,QUEST)~ EXIT  
END  

IF ~Global("X32VQuestTalk","GLOBAL",9)~ QTalkFinal 
SAY @195
++ @196 + progress 
++ @197 + manipulated 
++ @198 + yourself 
END 

IF ~~ progress 
SAY @199
= @200
+~Global("X32VienWasInBG1","GLOBAL",1)~+ @201 + believe_me 
++ @202 + pushing_forward 
++ @203 + plateau 
++ @204 + helpful 
END

IF ~~ believe_me 
SAY @205
IF ~~ + new_spell  
END 

IF ~~ new_spell 
SAY @206
IF ~~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",10)AddSpecialAbility("X3VSBLT")AddSpecialAbility("X3VSBLT")~ EXIT 
END 

IF ~~ pushing_forward 
SAY @207 
IF ~~ + new_spell 
END 

IF ~~ plateau 
SAY @208
IF ~~ + new_spell 
END 

IF ~~ helpful 
SAY @209
IF ~~ + new_spell 
END 


IF ~~ manipulated 
SAY @210
IF ~~ + progress 
END 

IF ~~ yourself 
SAY @211
IF ~~ + progress 
END  

/*
Old Quest Content below.
CHAIN IF ~Global("X32VQuestTalk","GLOBAL",4)~ THEN X32VIENJ QTalk2 
~Come, away from the others. Let us get this over with.~
END 
+~IsValidForPartyDialogue("Viconia")Global("X32VQuestChoice","GLOBAL",1)~+ ~Lead on.~ DO ~StartCutSceneMode()
StartCutScene("X3Vcut03")~ EXIT
+~!IsValidForPartyDialogue("Viconia")Global("X32VQuestChoice","GLOBAL",1)~+ ~Lead on.~ DO ~StartCutSceneMode()
StartCutScene("X3Vcut02")~ EXIT 
+~!Global("X32VQuestChoice","GLOBAL",1)~+ ~Lead on.~ DO ~StartCutSceneMode()
StartCutScene("X3Vcut02")~ EXIT 
++ ~Are you sure about this?~ + QTalk2.B
++ ~I am having second thoughts about this.~ + QTalk2.C 

CHAIN X32VienJ QTalk2.B 
~Of course I am.~
END
++ ~I am having second thoughts about this.~ + QTalk2.C 
+~IsValidForPartyDialogue("Viconia")Global("X32VQuestChoice","GLOBAL",1)~+ ~Lead on.~ DO ~StartCutSceneMode()
StartCutScene("X3Vcut03")~ EXIT
+~!IsValidForPartyDialogue("Viconia")Global("X32VQuestChoice","GLOBAL",1)~+ ~Lead on.~ DO ~StartCutSceneMode()
StartCutScene("X3Vcut02")~ EXIT 
+~!Global("X32VQuestChoice","GLOBAL",1)~+ ~Lead on.~ DO ~StartCutSceneMode()
StartCutScene("X3Vcut02")~ EXIT 


CHAIN X32VienJ QTalk2.C
~Please, hesitation is weakness. Are we doing this or not?~
END
+~IsValidForPartyDialogue("Viconia")Global("X32VQuestChoice","GLOBAL",1)~+ ~Lead on.~ DO ~StartCutSceneMode()
StartCutScene("X3Vcut03")~ EXIT 
+~!IsValidForPartyDialogue("Viconia")Global("X32VQuestChoice","GLOBAL",1)~+ ~Lead on.~ DO ~StartCutSceneMode()
StartCutScene("X3Vcut02")~ EXIT 
+~!Global("X32VQuestChoice","GLOBAL",1)~+ ~Lead on.~ DO ~StartCutSceneMode()StartCutScene("X3Vcut02")~ EXIT  
+~Alignment("X3Vien",NEUTRAL)~+ ~No. I do not want to do this anymore.~ + QTalk.K 
+~Alignment("X3Vien",NEUTRAL_EVIL)~+ ~No. I do not want to do this anymore.~ + QTalk.L


CHAIN IF ~Global("X32VQuestChoice","GLOBAL",1)Global("X32VQuestTalk","GLOBAL",5)IsValidForPartyDialogue("Viconia")~ THEN X32VienJ QTalk2.A1  
~This is far enough. Drow?~
== BDVICONJ ~Shar's power is not free. Give her your faith.~
== X32VienJ ~Shar, I give you my worship in exchange for your weave. I will gradually cast the entire weave off in exchange for the mystery and power of your gifts.~
== X32VienJ ~Grant me your boon!~
DO ~StartCutSceneMode()StartCutScene("X3Vcut05")~ EXIT 


CHAIN IF ~Global("X32VQuestChoice","GLOBAL",1)Global("X32VQuestTalk","GLOBAL",5)!IsValidForPartyDialogue("Viconia")~ THEN X32VienJ QTalk2.A2 
~This is far enough.~ 
EXTERN X32VIENJ QTalk2.D 

CHAIN X32VienJ QTalk2.D 
~Shar, I give you my worship in exchange for your weave. I will gradually cast the entire weave off in exchange for the mystery and power of your gifts.~
== X32VienJ ~Grant me your boon!~
DO ~StartCutSceneMode()StartCutScene("X3Vcut04")~ EXIT 


CHAIN IF ~!Global("X32VQuestChoice","GLOBAL",1)Global("X32VQuestTalk","GLOBAL",5)~ THEN X32VienJ QTalk2.A3 
~This is far enough. I will attempt to call forth the spell. Just watch quietly.~
DO ~StartCutSceneMode()StartCutScene("X3Vcut04")~ EXIT 


CHAIN IF ~Global("X32VQuestChoice","GLOBAL",1)Global("X32VQuestTalk","GLOBAL",6)IsValidForPartyDialogue("Viconia")~ THEN X32VienJ QTalk3.1 // Vienxay gave her fealty to Shar. 
~Yes, yes, yes! Oh, you will not regret this <CHARNAME>.~ 
== BDVICONJ ~Enjoy the shadow's embrace, darthiir.~ 
== X32VIENJ ~Of course I will.~
END 
++ ~Just be careful with this power. You don't want to wind up in another cell.~ + QTalk3.A
++ ~I did nothing, this was all you.~ + QTalk3.B 
++ ~We're done, then?~ + QTalk3.C

CHAIN IF ~Global("X32VQuestChoice","GLOBAL",1)Global("X32VQuestTalk","GLOBAL",6)!IsValidForPartyDialogue("Viconia")~ THEN X32VienJ QTalk3.2
~Yes, yes, yes! Oh, you will not regret this <CHARNAME>.~
END
++ ~Just be careful with this power. You don't want to wind up in another cell.~ + QTalk3.A
++ ~I did nothing, this was all you.~ + QTalk3.B 
++ ~We're done, then?~ + QTalk3.C
 
CHAIN X32VienJ QTalk3.A 
~With this power, I will *never* have to fear a cell again. Our enemies shall have much to fear now.~
DO ~SetGlobal("X32VQuestTalk","GLOBAL",9)AddSpecialAbility("X3VSBLT")AddSpecialAbility("X3VSBLT")~ 
EXIT 

CHAIN X32VienJ QTalk3.B 
~Yes, it was all me. I suppose I am that perfect. Our enemies shall have much to fear now.~
DO ~SetGlobal("X32VQuestTalk","GLOBAL",9)AddSpecialAbility("X3VSBLT")AddSpecialAbility("X3VSBLT")~ 
EXIT 

CHAIN X32VienJ QTalk3.C 
~Don't rush my basking of this glorious moment! One last moment to enjoy this triumph before we go, then we can be off to destroy our enemies. What? Fine. Let's go.~
DO ~SetGlobal("X32VQuestTalk","GLOBAL",9)AddSpecialAbility("X3VSBLT")AddSpecialAbility("X3VSBLT")~ 
EXIT 

CHAIN IF ~!Global("X32VQuestChoice","GLOBAL",1)Global("X32VQuestTalk","GLOBAL",6)~ THEN X32VienJ QTalk3.3 
~Yes, yes! Oh I feel her power. Ugh...and now, a throbbing in my head. This must be the loss entailed.~
END 
++ ~Will you be okay?~ + QTalk3.D 
++ ~Power is worth this risk.~ + QTalk3.E 
++ ~I'm sorry. I shouldn't have put you through this.~ + QTalk3.F 


CHAIN X32VienJ QTalk3.D 
~I am fine. It could have gone worse. I will not try to take more from the shadows than this singular spell. Let us be thankful it worked.~
EXTERN X32VienJ QTalk3.G 

CHAIN X32VienJ QTalk3.E 
~Absolutely. Though I will not try to take more from the shadows than this singular spell. Let us rejoin the others, we have enemies to take down.~
EXTERN X32VienJ QTalk3.G 

CHAIN X32VienJ QTalk3.F 
~Do not worry about me. I will be fine. I will not try to take more from the shadows than this singular spell. Let us be thankful it was not worse.~
EXTERN X32VienJ QTalk3.G 

CHAIN X32VienJ QTalk3.G 
~Let us join the others. We have enemies to take care of still.~ 
DO ~SetGlobal("X32VQuestTalk","GLOBAL",9)AddSpecialAbility("X3VSBLT")AddSpecialAbility("X3VSBLT")ChangeStat("X3Vien",WIS,-1,ADD)~ 
EXIT 
*/
// Conflict Chains (Viconia/Baeloth)
CHAIN X32VIENJ VC.C 
@212
DO ~SetGlobal("X32VienViconiaConflict","LOCALS",-1)~
== BDVICONJ @213
DO ~SetGlobal("bd_joined","locals",0)
SetGlobal("bd_npc_camp","locals",1)
ChangeAIScript("bdparty",DEFAULT)LeaveParty()~
EXIT 

CHAIN X32VIENJ BA.C 
@214
DO ~SetGlobal("X32VienBaelothConflict","LOCALS",-1)~
== BDBAELOJ @215
DO ~SetGlobal("bd_joined","locals",0)
SetGlobal("bd_npc_camp","locals",1)
ChangeAIScript("bdparty",DEFAULT)LeaveParty()~
EXIT 

// Schael Corwin of Vienxay's location. We'll have to add a LOT to this one.
/*For this to be perfect, we should add the variable that flags the PC having met Vienxay, so they don't superfluously mention Vienxay even after rejecting her.*/

I_C_T2 BDSCHAEL 39 X3VienBDDSChael39
== BDSCHAEL @216
END

EXTEND_TOP BDSCHAEL 115 #3
+~!InParty("X3Vien")~+ @217 EXTERN BDSCHAEL X3Vbdschael120
END

CHAIN BDSCHAEL X3Vbdschael120
@218
COPY_TRANS BDSCHAEL 120

EXTEND_TOP BDSCHAEL 60 #3
+~!InParty("X3Vien")~+ @219 EXTERN BDSCHAEL X3Vbdschael120A
END

EXTEND_TOP BDSCHAEL 62 #3
+~!InParty("X3Vien")~+ @219 EXTERN BDSCHAEL X3Vbdschael120A
END

EXTEND_TOP BDSCHAEL 63 #3
+~!InParty("X3Vien")~+ @219 EXTERN BDSCHAEL X3Vbdschael120A
END

EXTEND_TOP BDSCHAEL 64 #3
+~!InParty("X3Vien")~+ @219 EXTERN BDSCHAEL X3Vbdschael120A
END

CHAIN BDSCHAEL X3Vbdschael120A
@220
COPY_TRANS BDSCHAEL 65




I_C_T BDSCHAEL 65 X3VienBDDSChae65
== BDSCHAEL @221
END

EXTEND_TOP BDSCHAEL 73 #3
+~!InParty("X3Vien")~+ @219 EXTERN BDSCHAEL X3Vbdschael120B
END

EXTEND_TOP BDSCHAEL 74 #3
+~!InParty("X3Vien")~+ @219 EXTERN BDSCHAEL X3Vbdschael120B
END

CHAIN BDSCHAEL X3Vbdschael120B
@222
COPY_TRANS BDSCHAEL 75

I_C_T BDSCHAEL 75 X3VienBDDSChae75
== BDSCHAEL @221
END

EXTEND_TOP BDSCHAEL 107 #3
+~!InParty("X3Vien")~+ @219 EXTERN BDSCHAEL X3Vbdschael120C
END

EXTEND_TOP BDSCHAEL 108 #3
+~!InParty("X3Vien")~+ @219 EXTERN BDSCHAEL X3Vbdschael120C
END

EXTEND_TOP BDSCHAEL 109 #3
+~!InParty("X3Vien")~+ @219 EXTERN BDSCHAEL X3Vbdschael120C
END

EXTEND_TOP BDSCHAEL 110 #3
+~!InParty("X3Vien")~+ @223 EXTERN BDSCHAEL X3Vbdschael120C
END

CHAIN BDSCHAEL X3Vbdschael120C
@222
COPY_TRANS BDSCHAEL 107

I_C_T BDSCHAEL 78 X3VienBDDSChae78
== BDSCHAEL @224
END

EXTEND_TOP BDSCHAEL 79 #3
+~!InParty("X3Vien")~+ @225 EXTERN BDSCHAEL X3Vbdschael79A
END

CHAIN BDSCHAEL X3Vbdschael79A 
@226
EXIT 

EXTEND_TOP BDSCHAEL 80 #3
+~!InParty("X3Vien")~+ @227 EXTERN BDSCHAEL X3Vbdschael79B
END

CHAIN BDSCHAEL X3Vbdschael79B
@228
EXIT 

EXTEND_TOP BDSCHAEL 80 #3
+~!InParty("X3Vien")~+ @229 EXTERN BDSCHAEL X3Vbdschael79C
END

CHAIN BDSCHAEL X3Vbdschael79C
@230
EXIT 

I_C_T BDSCHAEL 209 X3VienBDDSChae209
== BDSCHAEL @231
END

EXTEND_TOP BDSCHAEL 210 #3
+~InParty("X3Vien")IsValidForPartyDialogue("X3Vien")~+ @232 EXTERN BDSCHAEL X3VienSchaelMeet
END

CHAIN BDSCHAEL X3VienSchaelMeet
@233
== X32VienJ @234
== BDSCHAEL @235
EXIT 

// Fritz 

EXTEND_TOP BDFritz 1 #3
+~!InParty("X3Vien")Global("X32Fritz","GLOBAL",1)~+ @236 EXTERN BDFritz X3VFritz
END

EXTEND_TOP BDFritz 1 #3
+~!InParty("X3Vien")GlobalLT("X32Fritz","GLOBAL",1)~+ @237 EXTERN BDFritz X3VFritz2
END

CHAIN BDFritz X3VFritz 
@238
DO ~SetGlobal("X32Fritz","GLOBAL",2)StartCutSceneMode()
StartCutScene("X3Vcut01")~ EXIT 

CHAIN BDFritz X3VFritz2 
@239
EXIT 


//Tiax 

I_C_T BDTIAX 0 X32VienBDTiax
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @240
END

I_C_T BDMKHIIN 10 X32VienBDMKHIIN10 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @241
END

// Kieran
I_C_T BDKIERAN 2 X3VienBDKIERAN
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @242
END

// Aileen 
I_C_T BDAILEEN 8 X3VienBDAileen 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @243
END

// Lucill

I_C_T BDLUCILL 0 X3vienBDLUCILL  
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @244
END

// Tanorm 

I_C_T BDTanorm 1 X3VienTanorm 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @245
END

I_C_T BDSETHYL 0 X3VienSethyl 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @246
END

I_C_T BDZAVIAK 1 X3VienZaviak 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @247
END

I_C_T BDByzon 9 X3VienByzon
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @248
END

I_C_T BDPriest 0 X3VienPriest0
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @249
END

I_C_T BDRohma 1 X3VienRohma1
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @250
END

// Menhir 

EXTEND_TOP BDMENHI2 6 #7
+~IsValidForPartyDialog("X3Vien")~+ @251 EXTERN X32VienJ X32VienMenhir2R 
END 

CHAIN X32VienJ X32VienMenhir2R
@252
EXTERN BDMENHI2 2

I_C_T BDTELERI 32 X32RecBDTELERI32 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @253
END

I_C_T BDTELERI 15 X32RecBDTELERI15 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @254
== BDTELERI @255
END

// Bridgefort 

I_C_T BDBF1 1 X32VIENBDBF11
== X32VIENJ IF ~IsValidForPartyDialogue("X3VIEN")~ THEN @256
END

EXTEND_TOP BDWYNAN 7 #4
+ ~IsValidForPartyDialogue("X3Vien")~ + @257 EXTERN X32VIENJ bdwynan7
END

CHAIN X32VienJ bdwynan7
@258
= @259
COPY_TRANS BDWYNAN 8

EXTEND_TOP BDBF2 2 #4
+ ~IsValidForPartyDialogue("X3Vien")~ + @257 EXTERN X32VIENJ bdwynan7B
END

CHAIN X32VienJ bdwynan7B
@258
= @259
COPY_TRANS BDWYNAN 8

EXTEND_TOP BDWYNAN 14 #4
+ ~IsValidForPartyDialogue("X3Vien")~ + @260 EXTERN X32VIENJ bdwynan14
END 

I_C_T BDKHALID 66  X32VienBDKHALID66
== X32VIENJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @261
END

I_C_T BDDOSIA 25 X32VienBDDOSIA25 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @262
END 

I_C_T BDWAIZAH 19 X32VienBDWAIZAH19 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @263
END 

CHAIN X32VienJ bdwynan14 
@264
DO ~SetGlobal("BD_SDD200","GLOBAL",3)
SetGlobal("BD2100GL","GLOBAL",3)
StartCutSceneMode()
ClearAllActions()
StartCutScene("X3Vcutg")~
EXIT

// Training 

EXTEND_TOP BDDANINE 3 #4 
+ ~IsValidForPartyDialogue("X3Vien")~ + @265 DO ~SetGlobal("BD_DANINE_INTRO","BD3000",2)
IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_danine_skill","global",2)~ EXTERN X32VienJ bdDanine3
END 

CHAIN X32VienJ bdDanine3
@266 
EXTERN BDDanine 6

EXTEND_TOP BDGARROL 1 #4 
+ ~IsValidForPartyDialogue("X3Vien")~ + @265 EXTERN X32VienJ bdGarrol1
END 

CHAIN X32VienJ bdGarrol1 
@267 
DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",1)
SetGlobal("bd_sdd301_garrold_skill","global",1)~
EXTERN BDGarrol 3

I_C_T BDHALAT 8 X32VienBDHALAT8 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @268
END 

I_C_T BDSHAPUR 12 X32VienBDSHAPUR12
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @269
END

I_C_T BDDELANC 49 X32VienBDDELANC49 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @270
END

// Thrix the Profane 

EXTEND_BOTTOM BDTHRIX 21
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 22 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 23 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 24 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 26
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_TOP BDTHRIX 27 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 28 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_TOP BDTHRIX 29 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 30
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 31 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 32 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 33 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 34
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 35 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 36 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 37 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 38
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 39 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 40 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 41 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 42
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 43 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 44 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 45 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 46
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 47 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 48 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 49 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 50
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 51 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 52 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 53 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 54
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 55 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 56 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 57 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 58
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 59 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 60 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 61 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 62
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 63 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 64 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 65 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 66
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 67 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 68 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 69 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 70
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 71 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 72 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 73 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 74
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 75 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 76 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 77 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 78
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 79 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 80 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 81 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 82
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 83 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 84 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 85 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 90
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 91 #3
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 92 #5
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

EXTEND_BOTTOM BDTHRIX 93 #8
IF ~Global("X32_Saved_Vienxay","bd4500",0)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager1
END

CHAIN BDTHRIX ThrixWager1
@271
END
++ @272 DO ~SetGlobal("X32VienSacrifice","bd4500",1) SetGlobal("bd_thrix_sacrifice_companion","global",1)~ EXTERN BDTHRIX 116
+ ~OR(2) Global("X32VienRomanceActive","GLOBAL",1) Global("X32VienRomanceActive","GLOBAL",2)~ + @273 DO ~SetGlobal("X32_Saved_Vienxay","bd4500",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ EXTERN X32VienJ ThrixWager2
+ ~!Global("X32VienRomanceActive","GLOBAL",1) !Global("X32VienRomanceActive","GLOBAL",2)~ + @274 DO ~SetGlobal("X32_Saved_Vienxay","bd4500",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ EXTERN X32VienJ ThrixWager2
++ @275 EXTERN BDTHRIX 113
++ @276 EXTERN BDTHRIX 12

CHAIN X32VienJ ThrixWager2
@277
== BDTHRIX @278
END
IF ~RandomNum(4,1)~ EXTERN BDTHRIX 78
IF ~RandomNum(4,2)~ EXTERN BDTHRIX 79
IF ~RandomNum(4,3)~ EXTERN BDTHRIX 80
IF ~RandomNum(4,4)~ EXTERN BDTHRIX 81

EXTEND_BOTTOM BDTHRIX 118
IF ~Global("X32VienSacrifice","bd4500",1)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager4
END

EXTEND_BOTTOM BDTHRIX 119
IF ~Global("X32VienSacrifice","bd4500",1)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager4
END

EXTEND_BOTTOM BDTHRIX 120
IF ~Global("X32VienSacrifice","bd4500",1)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager4
END

EXTEND_BOTTOM BDTHRIX 121
IF ~Global("X32VienSacrifice","bd4500",1)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager4
END

EXTEND_BOTTOM BDTHRIX 122
IF ~Global("X32VienSacrifice","bd4500",1)
IsValidForPartyDialogue("X3Vien")~ EXTERN BDTHRIX ThrixWager4
END

CHAIN BDTHRIX ThrixWager4
@279
END
++ @280 DO ~SetGlobal("X32_thrix_mark_Vienxay","global",1)~ EXTERN X32VienJ ThrixWager5
++ @281 EXTERN BDTHRIX 10

CHAIN X32VienJ ThrixWager5
@282
DO ~SetGlobal("bd_thrix_plot","global",11)~ EXTERN BDTHRIX 140

// Imoen

EXTEND_BOTTOM BDIMOEN 104
+ ~Global("X3Vien_SoDparty_epilogue","GLOBAL",1)~ + @283 EXTERN BDIMOEN bdimoen1
END

EXTEND_BOTTOM BDIMOEN 109
+ ~Global("X3Vien_SoDparty_epilogue","GLOBAL",1)~ + @283 EXTERN BDIMOEN bdimoen1
END

CHAIN BDIMOEN bdimoen1
@284
EXTERN BDIMOEN 119

APPEND X32VienJ 

IF ~IsGabber(Player1) AreaCheck("bd4300")GlobalGT("bd_plot","global",585)~ THEN BEGIN SoD.BattleOver 
SAY @285
IF ~~ EXIT 
END

IF ~IsGabber(Player1) OR(2) AreaCheck("BD0120")AreaCheck("BD0130")~ THEN BEGIN Vien.PIDCrypt1  
SAY  @286
IF ~~ EXIT 
END 


IF ~IsGabber(Player1) CombatCounter(0) !Detect([ENEMY])~ THEN BEGIN Vienxay.PID 
SAY  @287
 + ~HPPercentGT(Myself,74)RandomNum(5,1)~ + @288 + Vienxay.PHowAreYou1 // @288
 + ~HPPercentGT(Myself,74)RandomNum(5,2)~ + @288 + Vienxay.PHowAreYou2 // @288
 + ~HPPercentGT(Myself,74)RandomNum(5,3)~ + @288 + Vienxay.PHowAreYou3 // @288
 +~HPPercentLT(Myself,75)HPPercentGT(Myself,49)RandomNum(2,1)~+ @288 + Vienxay.PHowAreYouInjured // @288 //(Under 75%, Over 50%)
 +~HPPercentLT(Myself,50)~+ @288 + Vienxay.PHowAreYouHurt // @288 //(Under 50%)
 +~HPPercentGT(Myself,74)RandomNum(5,4)~+ @288 + Vienxay.PHowAreYou4 // @288
 +~HPPercentGT(Myself,74)RandomNum(5,5)~+ @288 + Vienxay.PHowAreYou5 // @288
 +~HPPercentLT(Myself,75)HPPercentGT(Myself,49)RandomNum(2,2)~+ @288 + Vienxay.PHowAreYouInjured2  // @288
 ++ @289 + Vienxay.PTalk // @289 
 ++ @290 + stringfix //Exists to fix 1.56->1.57 Vienxay playthroughs.
 ++ @291 EXIT // @291 
 END 
 
 IF ~~ Vienxay.PHowAreYou1
SAY @292 
IF ~~ EXIT  
END 

IF ~~ Vienxay.PHowAreYou2
SAY @293 
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYou3
SAY @294 
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYouInjured
SAY @295 
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYouHurt
SAY @296 
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYou4
SAY @297
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYou5
SAY @298
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYouInjured2
SAY @299
IF ~~ EXIT  
END

IF ~~ Vienxay.PTalk 
SAY  @300
/*Options will  vary as the game goes on.*/ 
// Companion Thoughts 
+ ~NumInPartyAliveGT(2)~ + @301  + Vienxay.PCompanionThoughts // @301 
+ ~Race(Player1,Elf)~ + @302 + Em.Me1 // @302
+ ~!Race(Player1,Elf)~ + @302 + Em.Me2 // @302
// Dialogue From Talk Expansions. These fire once, and there will be 3 only: A talk of things while they were gone (7/8), something friendly, and something flirty. 
+~Global("X32VienxayCell","GLOBAL",0)GlobalGT("Chapter","GLOBAL",7)~+ @303 DO ~SetGlobal("X32VienxayCell","GLOBAL",1)~  + Vienxay.PCell // @303
+~Global("X32VienxayShadowWeave","GLOBAL",0)Global("X32VQuestTalk","GLOBAL",9)~+ @304 DO ~SetGlobal("X32VienxayShadowWeave","GLOBAL",1)~ + Vienxay.PSWYes
+~Global("X32VienxayShadowWeave","GLOBAL",0)Global("X32VQuestTalk","GLOBAL",10)~+ @304 DO ~SetGlobal("X32VienxayShadowWeave","GLOBAL",1)~ + Vienxay.PSWNo
+~Global("X3VienPHaughtyTopic","GLOBAL",0)~+ @305  DO ~SetGlobal("X3VienPHaughtyTopic","GLOBAL",1)~ + Vienxay.PHaughty // @305 
+~RandomNum(3,1)~+ @306 + Vienxay.PStealth1 // @306
+~RandomNum(3,2)~+ @306 + Vienxay.PStealth2
+~RandomNum(3,3)~+ @306 + Vienxay.PStealth3
//+~Global("X32VQuestTalk","GLOBAL",9)Global("X3VienWandTopic","GLOBAL",0)~+ ~Could you teach me the Shadow weave?~ DO ~SetGlobal("X3VienWandTopic","GLOBAL",1)~ + Vienxay.PWand // ~Could you teach me the Shadow weave?~
END 

IF ~~ Vienxay.PCompanionThoughts 
SAY @307 // ~Which one, now?~ 
// BG1

+~InParty("Dynaheir")~+ @308 + Em.Dynaheir
+~InParty("Khalid")~+ @309 + Em.Khalid 
+~InParty("Minsc")~+ @310 + Em.Minsc 
+~InParty("Jaheria")~+ @311 + Em.Jaheria
+~InParty("Safana")~+ @312 + Em.Safana 
+~InParty("Edwin")~+ @313 + Em.Edwin
+~InParty("Viconia")~+ @314 + Em.Viconia 
    
// EE 
+~InParty("Baeloth")~+ @315 + Em.Baeloth 
+~InParty("Dorn")~+ @316 + Em.Dorn
+~InParty("Neera")~+ @317 + Em.Neera 
+~InParty("Rasaad")~+ @318 + Em.Rasaad 
// SoD 
+~InParty("Corwin")~+ @319 + Em.Corwin 
+~InParty("Glint")~+ @320 + Em.Glint 
+~InParty("Mkhiin")~+ @314 + Em.Mkhiin 
+~InParty("Voghlin")~+ @321 + Em.Voghlin 
// CrossMod Choices 
+~InParty("X3Vien")~+ @322 + Em.Kale
+~InParty("X3Rec")~+ @323 + Em.Recorder
+~InParty("X3mily")~+ @323 + Em.Emily
+~InParty("X3Helga")~+ @323 + Em.Helga
+~InParty("c0aura")~+ @324 + Em.Aura 
+~InParty("c0Drake")~+ @325 + Em.Drake
+~InParty("#Ishy")~+ @326 + Em.Ishy 
+~InParty("C0Sirene")~+ @327 + Em.Sirene 
+ ~InParty("L#1DVER")~ + @328 + Em.Verrsza 
+~!Global("X32VienRomanceActive","GLOBAL",2)~+ @329 + Em.Me1 
+~!Global("X32VienRomanceActive","GLOBAL",2)!Race(Player1,Elf)~+ @329 + Em.Me2
+~Global("X32VienRomanceActive","GLOBAL",2)~+ @329 + Em.Me3 
++ @330 EXIT  
END 

IF ~~ Em.Dynaheir 
SAY @331
IF ~~ EXIT 
END 

IF ~~ Em.Khalid 
SAY @332
IF ~~ EXIT 
END 

IF ~~ Em.Jaheria
SAY @333
IF ~~ EXIT 
END 

IF ~~ Em.Edwin
SAY @334
IF ~~ EXIT 
END 

IF ~~ Em.Minsc 
SAY @335
IF ~~ EXIT 
END 

IF ~~ Em.Safana 
SAY @336
IF ~~ EXIT 
END 

IF ~~ Em.Viconia
SAY @337
IF ~~ EXIT 
END 

IF ~~ Em.Baeloth
SAY @338
IF ~~ EXIT 
END 

IF ~~ Em.Neera
SAY @339
IF ~~ EXIT 
END 

IF ~~ Em.Dorn
SAY @340
IF ~~ EXIT 
END 

IF ~~ Em.Rasaad
SAY @341
IF ~~ EXIT 
END 

IF ~~ Em.Corwin
SAY @342
IF ~~ EXIT 
END 

IF ~~ Em.Mkhiin
SAY @343
IF ~~ EXIT 
END 

IF ~~ Em.Voghlin
SAY @344
IF ~~ EXIT 
END 

IF ~~ Em.Glint
SAY @345
IF ~~ EXIT 
END 

IF ~~ Em.Kale
SAY @346
IF ~~ EXIT 
END 

IF ~~ Em.Emily
SAY @347
IF ~~ EXIT 
END 

IF ~~ Em.Helga
SAY @348
IF ~~ EXIT 
END 

IF ~~ Em.Recorder
SAY @349
IF ~~ EXIT 
END 

IF ~~ Em.Aura
SAY @350
IF ~~ EXIT 
END 

IF ~~ Em.Sirene 
SAY @351
IF ~~ EXIT 
END 

IF ~~ Em.Verrsza 
SAY @352
IF ~~ EXIT 
END 

IF ~~ Em.Ishy
SAY @353
IF ~~ EXIT 
END 

IF ~~ Em.Drake
SAY @354
IF ~~ EXIT 
END 
 
IF ~~ Em.Me1 
SAY @355 
IF ~~ EXIT 
END 

IF ~~ Em.Me2 
SAY @356 
IF ~~ EXIT 
END 

IF ~~ Em.Me3
SAY @357 
IF ~~ EXIT 
END 

IF ~~ Vienxay.PHaughty
SAY @358
= @359
++ @360 + Vienxay.PTGrow // @360
++ @361 + Vienxay.PTElf // @361
++ @362 + Vienxay.PTCharge // @362
++ @363 + Vienxay.PTalk // @363 
++ @364 EXIT // @364
END 

IF ~~ Vienxay.PTGrow
SAY @365
++ @363  + Vienxay.PTalk // @363 
++ @364 EXIT // @364
END 

IF ~~ Vienxay.PTElf
SAY @366
++ @363  + Vienxay.PTalk // @363 
++ @364 EXIT // @364
END 

IF ~~ Vienxay.PTCharge
SAY @367
++ @363  + Vienxay.PTalk // @363 
++ @364 EXIT // @364
END 
/*
IF ~~ Vienxay.PWand 
SAY ~I am certain that the luxury of time does not exist for this. Besides...~
IF ~Class(Player1,MAGE_ALL)Alignment(Player1,MASK_GOOD)~ + Vienxay.PTeach1
IF ~Class(Player1,MAGE_ALL)!Alignment(Player1,MASK_GOOD)~ + Vienxay.PTeach2 
IF ~!Class(Player1,MAGE_ALL)~ + Vienxay.PTeach3 
END 

IF ~~ Vienxay.PTeach1 
SAY ~It is not for you. Your heart is...kind. Thoughtful. Traits I find exasperating, and surely Shar would find the same.~
IF ~~ + Vienxay.PTeachNo 
END 

IF ~~ Vienxay.PTeach2 
SAY ~While you have the capacity to learn the Shadow Weave, there are risks for you and I, and I have taken enough of those risks.~
IF ~~ + Vienxay.PTeachNo 
END 

IF ~~ Vienxay.PTeach3 
SAY ~You are not even a mage. It would be a waste of time.~
IF ~~ + Vienxay.PTeachNo 
END 

IF ~~ Vienxay.PTeachNo
SAY ~No, I will not teach you.~
+~Kit(Player1,SHADOWDANCER)~+ ~What about your thieving talents, your ability to slip in shadow at will?~ + Vienxay.PTeachShadow // ~What about your thieving talents, your ability to slip in shadow at will?~
+~Class(Player1,THIEF_ALL)!Kit(Player1,SHADOWDANCER)~+ ~What about your thieving talents, your ability to slip in shadow at will?~ + Vienxay.PTeachNo1 // ~What about your thieving talents, your ability to slip in shadow at will?~
+~!Class(Player1,THIEF_ALL)~+ ~What about your thieving talents, your ability to slip in shadow at will?~ + Vienxay.PTeachNo2 // ~What about your thieving talents, your ability to slip in shadow at will?~
++ @363  + Vienxay.PTalk // @363 
++ @364 EXIT // @364
END 

IF ~~ Vienxay.PTeachShadow
SAY ~You already know as much as I do. I may do the technique more flawlessly, but I am sure you can improve on your own.~
++ @363  + Vienxay.PTalk // @363 
++ @364 EXIT // @364
END 

IF ~~ Vienxay.PTeachNo1
SAY ~My talent in shadows is innate and guided by my former mentor. Yours is not, and I cannot help you.~
++ @363  + Vienxay.PTalk // @363 
++ @364 EXIT // @364
END 

IF ~~ Vienxay.PTeachNo2 
SAY ~You're not like I. There is nothing I can teach you.~
++ @363  + Vienxay.PTalk // @363 
++ @364 EXIT // @364
END 
*/

IF ~~ Vienxay.PStealth1
SAY @368
IF ~~ EXIT 
END

IF ~~ Vienxay.PStealth2
SAY @369
IF ~~ EXIT 
END

IF ~~ Vienxay.PStealth3
SAY @370
IF ~~ EXIT 
END

IF ~~ Vienxay.PCell
SAY @371
++ @372 + VienxayPCellTell
++ @373 + VienxayPCellTell
++ @374 + Vienxay.PCellNo
END 

IF ~~ Vienxay.PCellNo 
SAY @375
IF ~~ + VienxayPCellTell
END 

IF ~~ VienxayPCellTell
SAY @376
++ @377 + VienxayPCellMature
++ @378 + VienxayPCellMight
+~Alignment("X3Vien",NEUTRAL_EVIL)~+ @379 + VienxayPCellJudge1
+~Alignment("X3Vien",NEUTRAL)~+ @379 + VienxayPCellJudge2
END 

IF ~~ VienxayPCellMature
SAY @380
IF ~Alignment("X3Vien",NEUTRAL_EVIL)~ + VienxayPCellJudge1 
IF ~Alignment("X3Vien",NEUTRAL)~ + VienxayPCellJudge2 
END 

IF ~~ VienxayPCellMight 
SAY @381
IF ~Alignment("X3Vien",NEUTRAL_EVIL)~ + VienxayPCellJudge1 
IF ~Alignment("X3Vien",NEUTRAL)~ + VienxayPCellJudge2 
END 

IF ~~ VienxayPCellJudge1 
SAY @382
= @383
++ @384 + VienxayPCellBehave1
++ @385 + VienxayPCellFree 
END 

IF ~~ VienxayPCellJudge2 
SAY @386
= @383
++ @387 + VienxayPCellBehave2
++ @388 + VienxayPAccountable
END 

IF ~~ VienxayPCellBehave1 
SAY @389
IF ~~ + VienxayPCellGo 
END 

IF ~~ VienxayPCellBehave2 
SAY @390
IF ~~ + VienxayPCellGo 
END 

IF ~~ VienxayPCellFree 
SAY @391
IF ~~ + VienxayPCellGo 
END 

IF ~~ VienxayPAccountable 
SAY @392
IF ~~ + VienxayPCellGo 
END 

IF ~~ VienxayPCellGo 
SAY @393
IF ~~ EXIT 
END 

IF ~~ Vienxay.PSWYes 
SAY @394
++ @395 + Vienxay.PSWYes1
++ @396 + Vienxay.PSWYes2 
++ @397 + Vienxay.PTalk
++ @398 EXIT 
END 

IF ~~ Vienxay.PSWYes1 
SAY @399
++ @396 + Vienxay.PSWYes2 
++ @363 + Vienxay.PTalk
++ @400 EXIT 
END 

IF ~~ Vienxay.PSWYes2 
SAY @401
= @402
= @403
= @404
++ @395 + Vienxay.PSWYes1
++ @363 + Vienxay.PTalk
++ @400 EXIT 
END 

IF ~~ Vienxay.PSWNo
SAY @405
+~Alignment("X3Vien",NEUTRAL)~+ @406 + Vienxay.PSWNo1 
+~Alignment("X3Vien",NEUTRAL_EVIL)~+ @406 + Vienxay.PSWNo2 
++ @407 + Vienxay.PTalk
++ @408 EXIT 
END 

IF ~~ Vienxay.PSWNo1 
SAY @409
= @410 
++ @411 + Vienxay.PSWNo5 
++ @363 + Vienxay.PTalk
++ @400 EXIT 
END 

IF ~~ Vienxay.PSWNo2 
SAY @412
= @413
++ @414 + Vienxay.PSWNo3 
++ @415 + Vienxay.PSWNo4 
++ @363 + Vienxay.PTalk
++ @400 EXIT 
END 

IF ~~ Vienxay.PSWNo3 
SAY @416
++ @363 + Vienxay.PTalk
++ @400 EXIT 
END 

IF ~~ Vienxay.PSWNo4 
SAY @417
++ @363 + Vienxay.PTalk
++ @400 EXIT 
END 

IF ~~ Vienxay.PSWNo5 
SAY @418
++ @363 + Vienxay.PTalk
++ @400 EXIT 
END 

IF ~~ stringfix
 SAY @419
IF ~~ THEN DO ~ClearAllActions() 
      StartCutSceneMode() 
      StartCutScene("X3reset")~ EXIT 
END


/*Append End*/
END


 
