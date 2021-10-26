BEGIN X3VELDER 

CHAIN IF ~Global("X32VQuestTalk","GLOBAL",4)Global("Talk","LOCALS",0)~ THEN X3VELDER first_talk 
@0
DO ~SetGlobal("Talk","LOCALS",1)~
END 
++ @1 + doing_here
++ @2 + expedition
++ @3 + no_business

CHAIN X3VELDER no_business 
@4
EXIT 

CHAIN X3VELDER expedition 
@5 
END 
IF ~IsValidForPartyDialogue("X3Vien")~ EXTERN X32VienJ quest_interject 
++ @6 + teach 
++ @7 + elder_mage 
++ @8 + no_business 

CHAIN X3VELDER doing_here 
@9
END
IF ~IsValidForPartyDialogue("X3Vien")~ EXTERN X32VienJ quest_interject 
++ @6 + teach 
++ @7 + elder_mage 
++ @8 + no_business 

CHAIN X3VELDER elder_mage 
@10
END 
++ @11 + shadow 
++ @12 + teach 
++ @8 + no_business 

CHAIN X3VELDER shadow 
@13
END 
++ @12 + teach 
++ @8 + no_business 

CHAIN IF ~Global("Talk","LOCALS",1)Global("X32VQuestTalk","GLOBAL",4)~ THEN X3VELDER second_talk 
@14
END 
IF ~IsValidForPartyDialogue("X3Vien")~ EXTERN X32VienJ quest_interject 
++ @12 + teach 
++ @8 + no_business 

CHAIN X3VELDER teach 
@15
== X3VELDER @16
END 
++ @17 + quest_fetch 
++ @18 + quest_power
++ @19 + quest_early_rejected

CHAIN X3VELDER quest_fetch 
@20
DO ~SetGlobal("X32VQuestTalk","GLOBAL",5)~
END 
++ @21 + quest_accepted 
+~PartyHasItem("misc43")~+ @22 DO ~TakePartyItemNum("misc43",1)~ + quest_already_done 
++ @23 + quest_attack 
+~!IsValidForPartyDialogue("X3Vien")~+ @24 + quest_rejected
+~IsValidForPartyDialogue("X3Vien")~+ @24 EXTERN X32VIENJ quest_rejected_V

CHAIN X3VELDER quest_early_rejected 
@25
EXIT 

CHAIN X3VELDER quest_power 
@26
EXTERN X3VELDER quest_fetch 

CHAIN X3VELDER quest_rejected 
@27
DO ~AddJournalEntry(@10154,QUEST)~
EXIT 

CHAIN X3VELDER quest_accepted 
@28
DO ~AddJournalEntry(@10154,QUEST)~
EXIT 

CHAIN X3VELDER quest_attack 
@29
DO ~AddJournalEntry(@10149,QUEST)Enemy()~
EXIT 

CHAIN X3VELDER quest_already_done 
@30
== X3VELDER @31
END 
IF ~IsValidForPartyDialogue("X3Vien")~ DO ~GiveItem("X3VBook","X3Vien")~ EXTERN X32VienJ final_interject 
IF ~!IsValidForPartyDialogue("X3Vien")~ DO ~GiveItem("X3VBook",Player1)~ EXTERN X3VELDER farewell 

CHAIN X3VELDER farewell 
@32
END 
IF ~InPartyAllowDead("X3Vien")~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",7)EscapeArea()~ EXIT 
IF ~!InPartyAllowDead("X3Vien")~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",6)EscapeArea()~ EXIT 

CHAIN IF ~Global("X32VQuestTalk","GLOBAL",5)~ THEN X3VELDER third_talk 
@33
END 
+~PartyHasItem("misc43")~+ @34 DO ~TakePartyItemNum("misc43",1)~ + quest_already_done 
++ @35 EXIT 
++ @36 EXIT 

// Vienxay lines start here 

CHAIN X32VIENJ quest_interject 
@37
== X3VELDER @38
== X32VIENJ @39
== X3VELDER @40
END 
++ @41 EXTERN X3VELDER quest_fetch 
++ @42 EXTERN X3VELDER quest_power
++ @43 EXTERN X32VIENJ excuse_me

CHAIN X32VIENJ excuse_me
@44
== X3VELDER @45
EXTERN X3VELDER quest_power 

CHAIN X32VIENJ quest_rejected_V
@46
EXTERN X3VELDER quest_rejected

CHAIN X32VIENJ final_interject 
@47
== X3VELDER @48
== X3VELDER @49
== X32VIENJ @50
== X3VELDER @51
DO ~AddJournalEntry(@10148,QUEST_DONE)SetGlobal("X32VQuestTalk","GLOBAL",7)~
EXIT 