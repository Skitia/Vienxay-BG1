BEGIN X32Vien 

IF WEIGHT #-1 ~AreaCheck("bd4300")GlobalGT("bd_plot","global",585)~ THEN BEGIN SoD.BattleOver 
SAY @82
IF ~~ EXIT 
END

CHAIN IF WEIGHT #-1 ~Global("X32VienMet","GLOBAL",0)AreaCheck("BD0104")~ THEN X32Vien j1 
@0
END 
+~BeenInParty("X3Vien")~+ @1 DO ~SetGlobal("X32VienMet","GLOBAL",1)SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j1InBG1
+~BeenInParty("X3Vien")~+ @2 DO ~SetGlobal("X32VienMet","GLOBAL",1)SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j1InBG1
+~!BeenInParty("X3Vien")~+ @1 DO ~SetGlobal("X32VienMet","GLOBAL",1)SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j1InBG1
+~!BeenInParty("X3Vien")~+ @3 + j1NotInBG1


CHAIN X32Vien j1InBG1 
@4
END 
++ @5 + j1North
++ @6 + j1reject
+~BeenInParty("X3Vien")BeenInParty("X3mily")~+ @7 + j1Emily
+~!BeenInParty("X3mily")~+ @7 + j1North
++ @8 + j1Why 
++ @9 + j1reject 

CHAIN X32Vien j1NotInBG1 
@10
END 
++ @11 + j1North
++ @12 + j1Why
++ @13 + j1reject 

CHAIN X32Vien j1reject 
@14
EXIT 

CHAIN IF WEIGHT #-1 ~Global("X32VienMet","GLOBAL",1)Global("X32Fritz","GLOBAL",0)AreaCheck("BD0104")~ THEN X32Vien j2
@15 
END 
++ @16 + j1North
++ @17 + j1reject 

CHAIN X32Vien j1North 
@18
== X32Vien @19
DO ~SetGlobal("X32Fritz","GLOBAL",1)AddJournalEntry(@10150,INFO)~ 
EXIT 

CHAIN X32Vien j1Why 
@20
== X32Vien @21
END 
+~BeenInParty("X3Vien")BeenInParty("X3mily")~+ @7 + j1Emily
+~!BeenInParty("X3mily")~+ @7 + j1North
++ @11 + j1North
++ @22 + j1reject 
++ @23+ j1Help 



CHAIN X32Vien j1Emily 
@24
== X32Vien @25 
DO ~SetGlobal("X32Fritz","GLOBAL",1)AddJournalEntry(@10150,INFO)~ 
EXIT 

CHAIN X32Vien j1Help 
@26  
DO ~SetGlobal("X32Fritz","GLOBAL",1)AddJournalEntry(@10150,INFO)~ 
EXIT 

CHAIN IF WEIGHT #-1 ~Global("X32VienMet","GLOBAL",1)Global("X32Fritz","GLOBAL",1)AreaCheck("BD0104")~ THEN X32Vien j2
@27
EXIT 

CHAIN IF WEIGHT #-1 ~Global("X32Fritz","GLOBAL",2)Global("X32VienMet","GLOBAL",1)~ THEN X32Vien j3 
@28
DO ~SetGlobal("X32VienMet","GLOBAL",2)AddJournalEntry(@10151,INFO)JoinParty()~ EXIT 

// Vienxay will start or be moved outside of the palace if the PC does not speak to her.

CHAIN IF WEIGHT #-1 ~Global("X32VienMet","GLOBAL",0)!AreaCheck("BD0104")!AreaCheck("BD0120")!AreaCheck("BD0130")~ THEN X32Vien j4
@29
DO ~SetGlobal("X32VienMet","GLOBAL",1)~
END 
+~BeenInParty("X3Vien")~+ @1 DO ~SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j4InBG1
+~BeenInParty("X3Vien")~+ @30 DO ~SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j4InBG1
+~!BeenInParty("X3Vien")~+ @1 DO ~SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j4InBG1
+~!BeenInParty("X3Vien")~+ @31 + j4NotInBG1
++ @32 DO ~SetGlobal("X32VienMet","GLOBAL",1)~ + j4reject 


CHAIN X32Vien j4InBG1 
@33
END 
++ @34 + j4North
++ @32  + j4reject
++ @35 + j4cell
+~BeenInParty("X3Vien")OR(2)BeenInParty("X3mily")InParty("X3mily")~+ @7 + j4Emily
+~!BeenInParty("X3mily")~+ @36 + j4North
++ @9 + j1reject 

CHAIN X32Vien j4NotInBG1 
@37
END 
++ @34 + j4North
++ @32  + j4reject
+~BeenInParty("X3Vien")OR(2)BeenInParty("X3mily")InParty("X3mily")~+ @7 + j4Emily
+~!BeenInParty("X3mily")~+ @36 + j4North
++ @9 + j4reject 

CHAIN X32Vien j4reject 
@38
EXIT 

CHAIN X32Vien j4cell 
@39
END
++ @34 + j4North
++ @32  + j4reject
+~BeenInParty("X3Vien")OR(2)BeenInParty("X3mily")InParty("X3mily")~+ @7 + j4Emily
+~!BeenInParty("X3mily")~+ @36 + j4North
+~Global("X32VienWasInBG1","GLOBAL",1)~+ @9 + j1reject 

CHAIN X32Vien j4North 
@40
DO ~JoinParty()AddJournalEntry(@10151,INFO)SetGlobal("X32VienMet","GLOBAL",2)~ EXIT 

CHAIN X32Vien j4Emily
@24
== X32Vien @41
DO ~JoinParty()AddJournalEntry(@10151,INFO)SetGlobal("X32VienMet","GLOBAL",2)~ EXIT 

// Vienxay Unhappy, Evil  

CHAIN IF WEIGHT #-1 ~GlobalGT("bd_joined","locals",0)
HappinessLT(Myself,-290)!Alignment("X3Vien",NEUTRAL)~ THEN X32Vien rep.break
@42
END
++ @43 + rep.break.1
++ @44 + rep.break.2
++ @45 + rep.break.3
++ @46 + rep.break.3

CHAIN X32Vien rep.break.1
@47
EXTERN X32Vien rep.break.4

CHAIN X32Vien rep.break.2
@48
EXTERN X32Vien rep.break.4

CHAIN X32Vien rep.break.3
@49
EXTERN X32Vien rep.break.4

CHAIN X32Vien rep.break.4
@50
DO ~SetGlobal("bd_joined","locals",0)
SetGlobal("bd_npc_camp","locals",1)~ EXIT

// Vienxay Unhappy, Neutral.

CHAIN IF WEIGHT #-1 ~GlobalGT("bd_joined","locals",0)
HappinessLT(Myself,-290)Alignment("X3Vien",NEUTRAL)~ THEN X32Vien rep.break
@51
END
++ @43 + rep.break.1
++ @44 + rep.break.2
++ @52 + rep.break.3
++ @53 + rep.break.3


// Vienxay Kicked 


/*My assumption is that bd_joined is set upon joining in their local variable, thus why it is constantly used. Need to research to confirm.
We're using Aura's structure style here for these various kicked out/rejoin post-kickout dialogues.*/
CHAIN IF ~OR(2)
AreaCheck("BD0120")
AreaCheck("BD0130")
GlobalGT("bd_joined","locals",0)~ THEN X32Vien o
@54
END
++ @55 + o.1
+ ~OR(2)
!Range("ff_camp",999)
NextTriggerObject("ff_camp")
!IsOverMe("X3Vien")~ + @56 + o.2
++ @57 + n.3

CHAIN X32Vien o.1
@58
DO ~SetGlobal("bd_joined","locals",0)~ EXIT

CHAIN X32Vien o.2
@59
DO ~SetGlobal("bd_joined","locals",0)
SetGlobal("bd_npc_camp","locals",1)  
EscapeAreaMove("BD0120",802,1533,SE)~ EXIT

CHAIN IF ~OR(2)
AreaCheck("BD0120")
AreaCheck("BD0130")
Global("bd_joined","LOCALS",0)~ THEN X32Vien o.3
@60
END
++ @61 + o.4
++ @62 + o.5

CHAIN X32Vien o.4
@63
DO ~JoinParty()~ EXIT

CHAIN X32Vien o.5
@64
EXIT

CHAIN IF ~GlobalGT("bd_joined","locals",0)~ THEN X32Vien n
@54
END
+ ~GlobalGT("bd_npc_camp_chapter","global",1)
GlobalLT("bd_npc_camp_chapter","global",5)
OR(2)
!Range("ff_camp",999)
NextTriggerObject("ff_camp")
!IsOverMe("X3Vien")~ + @65 DO ~SetGlobal("bd_npc_camp","locals",1)~ + n.1 // Check NPC Camp when we can. 
++ @66 + n.2
++ @67 + n.3

CHAIN X32Vien n.1
@68
DO ~SetGlobal("bd_joined","locals",0)~ EXIT

CHAIN X32Vien n.2
@69
DO ~SetGlobal("bd_joined","locals",0)~ EXIT

CHAIN X32Vien n.3
@70
DO ~JoinParty()~ EXIT

//Rejoin post Kicked 

CHAIN IF ~Global("bd_joined","LOCALS",0)~ THEN X32Vien p
@71
END
+~Global("X32VQuestTalk","GLOBAL",6)PartyHasItem("X3VBook")~+ @72 DO ~TakePartyItem("X3VBook")SetGlobal("X32VQuestTalk","GLOBAL",7)~ + q.done
++ @73 + p.0
++ @74 + p.0
++ @75 + p.1 
++ @76 + p.1

CHAIN X32Vien p.0
@70
DO ~JoinParty()~ EXIT

CHAIN X32Vien p.1
@77
EXIT

CHAIN X32VIEN q.done 
@78
END 
++ @79 EXIT 
++ @80 + p.0
++ @74 + p.0
++ @81 + p.1 


APPEND X32Vien 

IF WEIGHT #-1 ~AreaCheck("bd0104")
Global("chapter","global",13)
Global("bd_jail_visitors","bd0104",5)
Global("X32VienRomanceActive","global",2)~ postgame
SAY @83 
++ @84 DO ~SetGlobal("bd_jail_visitors","bd0104",6) SetGlobal("bd_visit_player","locals",1)~ + postgame1
++ @85 DO ~SetGlobal("bd_jail_visitors","bd0104",6) SetGlobal("bd_visit_player","locals",1)~ + postgame2
++ @86 DO ~SetGlobal("bd_jail_visitors","bd0104",6) SetGlobal("bd_visit_player","locals",1)~ + postgame.X
END

IF ~~ postgame.X 
SAY @87
IF ~~ EXIT 
END 

IF ~~ postgame1
SAY @88
IF ~~ + postgame3
END

IF ~~ postgame2 
SAY @89
IF ~~ + postgame3
END 

IF ~~ postgame3
SAY @90
+~Global("bd_player_exiled","global",0)~+ @91 + postgame4A
+~!Global("bd_player_exiled","global",0)~+ @91 + postgame4B
++ @92 + postgame5
++ @93 + postgame.X
END

IF ~~ postgame4A 
SAY @94
IF ~~ + postgame5 
END 

IF ~~ postgame4B 
SAY @95
IF ~~ + postgame5 
END 

IF ~~ postgame5
SAY @96
= @97
++ @98 + postgame6
++ @99 + postgameX2 
++ @100 + postgame6
END 

IF ~~ postgame6 
SAY @101
IF ~~ + postgameX2 
END 

IF ~~ postgameX2 
SAY @102
IF ~~ EXIT 
END 

END 
