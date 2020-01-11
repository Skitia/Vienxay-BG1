BEGIN X32Vien 

CHAIN IF WEIGHT #-1 ~Global("X32VienMet","GLOBAL",0)AreaCheck("BD0104")~ THEN X32Vien j1 
~I said let m- you're not a guard. What is your business with me?~
END 
+~BeenInParty("X3Vien")~+ ~Vienxay? It has been sometime.~ DO ~SetGlobal("X32VienMet","GLOBAL",1)SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j1InBG1
+~BeenInParty("X3Vien")~+ ~Vienxay? What are you doing in this prison?~ DO ~SetGlobal("X32VienMet","GLOBAL",1)SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j1InBG1
+~!BeenInParty("X3Vien")~+ ~Vienxay? It has been sometime.~ DO ~SetGlobal("X32VienMet","GLOBAL",1)SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j1InBG1
+~!BeenInParty("X3Vien")~+ ~You must be the elf, Vienxay. Every other prisoner seems to be human.~ + j1NotInBG1


CHAIN X32Vien j1InBG1 
~If it isn't the Hero of Baldur's Gate. Do me a favor and speak to the guard? I am *innocent*. At least in the fact that I did not start it.~
END 
++ ~I can do that for you, though not without payment in service. March with me and you will be out of this cell.~ + j1North
++ ~I am not your errand boy. Our conversation is done.~ + j1reject
+~BeenInParty("X3Vien")BeenInParty("X3mily")~+ ~I need allies. I am going to face Caelar the Shining Lady. Join me and I will see you free.~ + j1Emily
+~!BeenInParty("X3mily")~+ ~I need allies. I am going to face Caelar the Shining Lady. Join me and I will see you free.~ + j1North
++ ~First, tell me why you are in this cell?~ + j1Why 
++ ~I can stand you no more before than now. I'll be going.~ + j1reject 

CHAIN X32Vien j1NotInBG1 
~Yes, yes, I am Vienxay Starbloom, wrongfully exiled from Evermeet and now wrongfully stuck in this cell.~
END 
++ ~I could help you, though you would have to agree to journey with me north.~ + j1North
++ ~Tell me why you are in this cell.~ + j1Why
++ ~You seem to have a pattern of wrongs. I think I would rather not speak with you.~ + j1reject 

CHAIN X32Vien j1reject 
~Hrmph. Fool.~
EXIT 

CHAIN IF WEIGHT #-1 ~Global("X32VienMet","GLOBAL",1)Global("X32Fritz","GLOBAL",0)AreaCheck("BD0104")~ THEN X32Vien j2
~You've come back. Perhaps you desire to help me get out of this cell, then?~ 
END 
++ ~Indeed, so long as you join me on a journey north.~ + j1North
++ ~I've no more desire than before.~ + j1reject 

CHAIN X32Vien j1North 
~You move to face the force pushing all of these refugees to make this city even more miserable? Tell Officer Fritz to actually pay attention to his duties and let me out.~
== X32Vien ~I do believe the city is being lenient to criminals who are willing to aid, even if I'm hardly a criminal. I intend to aid so I can get out of here.~
DO ~SetGlobal("X32Fritz","GLOBAL",1)AddJournalEntry(@150,INFO)~ 
EXIT 

CHAIN X32Vien j1Why 
~I'm hardly telling the tale to yet another person right now. I already had to talk to the guard several times. See me free and perhaps I will tell you later.~
== X32Vien ~Rest assured I robbed no one, murdered no one, and this is simply humans taking the side of humans.~
END 
+~BeenInParty("X3Vien")BeenInParty("X3mily")~+ ~I need allies. I am going to face Caelar the Shining Lady. Join me and I will see you free.~ + j1Emily
+~!BeenInParty("X3mily")~+ ~I need allies. I am going to face Caelar the Shining Lady. Join me and I will see you free.~ + j1North
++ ~I could help you, though you would have to agree to journey with me north.~ + j1North
++ ~I do not want someone like you in my presence. Goodbye.~ + j1reject 
++ ~If you can set your dislike of humans aside, I will help you.~+ j1Help 



CHAIN X32Vien j1Emily 
~She is like her, if the rumors are true. Emily, if you remember traveling with her. Or perhaps something even worse. She's more zealous, more destructive. And far more dangerous.~
== X32Vien ~I will join to help you, though you must speak to Officer Fritz first. That idiot will have to let me out. Do remind him that criminals can get released in exchange for service to the dragonspear expedition. He's been letting me rot here and ignoring that fact.~ 
DO ~SetGlobal("X32Fritz","GLOBAL",1)AddJournalEntry(@150,INFO)~ 
EXIT 

CHAIN X32Vien j1Help 
~Hrmph. Speak to Officer Fritz first. That idiot will have to let me out. Do remind him that criminals can get released in exchange for service to the dragonspear expedition. He's been letting me rot here and ignoring that fact.~  
DO ~SetGlobal("X32Fritz","GLOBAL",1)AddJournalEntry(@150,INFO)~ 
EXIT 

CHAIN IF WEIGHT #-1 ~Global("X32VienMet","GLOBAL",1)Global("X32Fritz","GLOBAL",1)AreaCheck("BD0104")~ THEN X32Vien j2
~Speak to him already. I'm tired of waiting around here.~
EXIT 

CHAIN IF WEIGHT #-1 ~Global("X32Fritz","GLOBAL",2)Global("X32VienMet","GLOBAL",1)~ THEN X32Vien j3 
~Finally. You won't regret having the great Vienxay Starlight by your side.~
DO ~SetGlobal("X32VienMet","GLOBAL",2)AddJournalEntry(@151,INFO)JoinParty()~ EXIT 

// Vienxay will start or be moved outside of the palace if the PC does not speak to her.

CHAIN IF WEIGHT #-1 ~Global("X32VienMet","GLOBAL",0)!AreaCheck("BD0104")!AreaCheck("BD0120")!AreaCheck("BD0130")~ THEN X32Vien j4
~If it isn't the Hero of Baldur's Gate. Your name rings in the high circles of society.~
END 
+~BeenInParty("X3Vien")~+ ~Vienxay? It has been sometime.~ DO ~SetGlobal("X32VienMet","GLOBAL",1)SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j4InBG1
+~BeenInParty("X3Vien")~+ ~Vienxay? What are you doing here?~ DO ~SetGlobal("X32VienMet","GLOBAL",1)SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j4InBG1
+~!BeenInParty("X3Vien")~+ ~Vienxay? It has been sometime.~ DO ~SetGlobal("X32VienMet","GLOBAL",1)SetGlobal("X32VienWasInBG1","GLOBAL",1)~ + j4InBG1
+~!BeenInParty("X3Vien")~+ ~You must be the elf, Vienxay.~ + j4NotInBG1
++ ~I've no time for talking. Good day.~ DO ~SetGlobal("X32VienMet","GLOBAL",1)~ + j4reject 


CHAIN X32Vien j4InBG1 
~It has. I have been stuck in a cell for days. It is fortunate they are allowing criminals to join this expedition, as loath as I am to use that word for myself.~
END 
++ ~I could use your help Vienxay. March with me.~ + j4North
++ ~I've no time for talking. Good day.~  + j4reject
++ ~How did you get in a cell?~ + j4cell
+~BeenInParty("X3Vien")OR(2)BeenInParty("X3mily")InParty("X3mily")~+ ~I need allies. I am going to face Caelar the Shining Lady. Join me and I will see you free.~ + j4Emily
+~!BeenInParty("X3mily")~+ ~I am going to face Caelar the Shining Lady. Join me.~ + j4North
++ ~I can stand you no more before than now. I'll be going.~ + j1reject 

CHAIN X32Vien j4NotInBG1 
~I am. We have have had crossed paths sooner, but I was stuck in a cell for days. It is fortunate and wise of them to allow me to join the expedition and have my ridiculous charge forgotten.~
END 
++ ~I could use your help Vienxay. March with me.~ + j4North
++ ~I've no time for talking. Good day.~  + j4reject
+~BeenInParty("X3Vien")OR(2)BeenInParty("X3mily")InParty("X3mily")~+ ~I need allies. I am going to face Caelar the Shining Lady. Join me and I will see you free.~ + j4Emily
+~!BeenInParty("X3mily")~+ ~I am going to face Caelar the Shining Lady. Join me.~ + j4North
++ ~I can stand you no more before than now. I'll be going.~ + j4reject 

CHAIN X32Vien j4reject 
~*Huff*. Your loss.~
EXIT 

CHAIN X32Vien j4cell 
~It is a long story that I am not keen on retelling after just leaving the damnable place. Human treatment of me there was abysmal! I am a noble, not some low strung peasant.~
END
++ ~I could use your help Vienxay. March with me.~ + j4North
++ ~I've no time for talking. Good day.~  + j4reject
+~BeenInParty("X3Vien")OR(2)BeenInParty("X3mily")InParty("X3mily")~+ ~I need allies. I am going to face Caelar the Shining Lady. Join me and I will see you free.~ + j4Emily
+~!BeenInParty("X3mily")~+ ~I am going to face Caelar the Shining Lady. Join me.~ + j4North
+~Global("X32VienWasInBG1","GLOBAL",1)~+ ~I can stand you no more before than now. I'll be going.~ + j1reject 

CHAIN X32Vien j4North 
~An excellent decision, to recruit me for your services. I shall partner with you. Lead on.~
DO ~JoinParty()AddJournalEntry(@151,INFO)SetGlobal("X32VienMet","GLOBAL",2)~ EXIT 

CHAIN X32Vien j4Emily
~She is like her, if the rumors are true. Emily, if you remember traveling with her. Or perhaps something even worse. She's more zealous, more destructive. And far more dangerous.~
== X32Vien ~Having me along is the best decision for your wellbeing. I accept, and shall walk with you.~
DO ~JoinParty()AddJournalEntry(@151,INFO)SetGlobal("X32VienMet","GLOBAL",2)~ EXIT 

// Vienxay Unhappy, Evil  

CHAIN IF WEIGHT #-1 ~GlobalGT("bd_joined","locals",0)
HappinessLT(Myself,-290)!Alignment("X3Vien",NEUTRAL)~ THEN X32Vien rep.break
~<CHARNAME>, I am tired of this ridiculous indulgence to charity and self-sacrifice. Such a philosophy is so stupid.~
END
++ ~That's too bad, Vienxay. You were a good companion.~ + rep.break.1
++ ~I don't blame you, we're just not meant to be a team.~ + rep.break.2
++ ~And I am done with your selfishness.~ + rep.break.3
++ ~I'm done with your whining. Go if that is what you want.~ + rep.break.3

CHAIN X32Vien rep.break.1
~That is kind of you to say...though my decision is made.~
EXTERN X32Vien rep.break.4

CHAIN X32Vien rep.break.2
~Indeed, we are not.~
EXTERN X32Vien rep.break.4

CHAIN X32Vien rep.break.3
~Hrmph!~
EXTERN X32Vien rep.break.4

CHAIN X32Vien rep.break.4
~Goodbye.~
DO ~SetGlobal("bd_joined","locals",0)
SetGlobal("bd_npc_camp","locals",1)~ EXIT

// Vienxay Unhappy, Neutral.

CHAIN IF WEIGHT #-1 ~GlobalGT("bd_joined","locals",0)
HappinessLT(Myself,-290)Alignment("X3Vien",NEUTRAL)~ THEN X32Vien rep.break
~<CHARNAME>... you are doing all that I used to do. Acting much like my mentor. It is not the influence I want, so I am going to leave you..~
END
++ ~That's too bad, Vienxay. You were a good companion.~ + rep.break.1
++ ~I don't blame you, we're just not meant to be a team.~ + rep.break.2
++ ~Get out of here if you don't have the courage to do what is necessary anymore.~ + rep.break.3
++ ~You were useless to me anyway.~ + rep.break.3


// Vienxay Kicked 


/*My assumption is that bd_joined is set upon joining in their local variable, thus why it is constantly used. Need to research to confirm.
We're using Aura's structure style here for these various kicked out/rejoin post-kickout dialogues.*/
CHAIN IF ~OR(2)
AreaCheck("BD0120")
AreaCheck("BD0130")
GlobalGT("bd_joined","locals",0)~ THEN X32Vien o
~You're telling *me* to leave?~
END
++ ~Wait here, I'll come back.~ + o.1
+ ~OR(2)
!Range("ff_camp",999)
NextTriggerObject("ff_camp")
!IsOverMe("X3Vien")~ + ~Go back to the entrance for now.~ + o.2
++ ~A mistake in direction. Stay with me.~ + n.3

CHAIN X32Vien o.1
~Gods. Whatever.~
DO ~SetGlobal("bd_joined","locals",0)~ EXIT

CHAIN X32Vien o.2
~If that's your decision.~
DO ~SetGlobal("bd_joined","locals",0)
SetGlobal("bd_npc_camp","locals",1)  
EscapeAreaMove("BD0120",802,1533,SE)~ EXIT

CHAIN IF ~OR(2)
AreaCheck("BD0120")
AreaCheck("BD0130")
Global("bd_joined","LOCALS",0)~ THEN X32Vien o.3
~Finally. Am I going with you now?~
END
++ ~Come along.~ + o.4
++ ~Not yet. Stay here.~ + o.5

CHAIN X32Vien o.4
~It's about time.~
DO ~JoinParty()~ EXIT

CHAIN X32Vien o.5
~Ugh!~
EXIT

CHAIN IF ~GlobalGT("bd_joined","locals",0)~ THEN X32Vien n
~You're telling *me* to leave?~
END
+ ~GlobalGT("bd_npc_camp_chapter","global",1)
GlobalLT("bd_npc_camp_chapter","global",5)
OR(2)
!Range("ff_camp",999)
NextTriggerObject("ff_camp")
!IsOverMe("X3Vien")~ + ~Go back to camp. I'll find you there if I need you.~ DO ~SetGlobal("bd_npc_camp","locals",1)~ + n.1 // Check NPC Camp when we can. 
++ ~For now. Just wait here.~ + n.2
++ ~I've changed my mind. Rejoin me.~ + n.3

CHAIN X32Vien n.1
~Fine. I'll be at camp..~
DO ~SetGlobal("bd_joined","locals",0)~ EXIT

CHAIN X32Vien n.2
~I am a *noble*. Asking me to wait is so...ugh!~
DO ~SetGlobal("bd_joined","locals",0)~ EXIT

CHAIN X32Vien n.3
~Finally, you've come to our senses.~
DO ~JoinParty()~ EXIT

//Rejoin post Kicked 

CHAIN IF ~Global("bd_joined","LOCALS",0)~ THEN X32Vien p
~Ugh. I suppose this is better than being stuck in a cell.~
END
++ ~I'd have you along, if you're willing.~ + p.0
++ ~I'm in need of your skills. Come join me.~ + p.0
++ ~It's not that bad.~ + p.1 
++ ~Nothing for the moment.~ + p.1

CHAIN X32Vien p.0
~Finally, you've come to our senses.~
DO ~JoinParty()~ EXIT

CHAIN X32Vien p.1
~Hrmph. Don't die without me.~
EXIT

APPEND X32Vien 

IF ~AreaCheck("bd4300")GlobalGT("bd_plot","global",585)~ THEN BEGIN SoD.BattleOver 
SAY ~I better be appreciated for all the sacrifices I've done for these people. But I have a feeling they will only be appreciating you.~
IF ~~ EXIT 
END

IF WEIGHT #-1 ~AreaCheck("bd0104")
Global("chapter","global",13)
Global("bd_jail_visitors","bd0104",5)
Global("X32VienRomanceActive","global",2)~ postgame
SAY ~I warned you about your hero gig eventually coming to an end. And look what happened.~ 
++ ~Vienxay?~ DO ~SetGlobal("bd_jail_visitors","bd0104",6) SetGlobal("bd_visit_player","locals",1)~ + postgame1
++ ~Vienxay! Help get me out of here.~ DO ~SetGlobal("bd_jail_visitors","bd0104",6) SetGlobal("bd_visit_player","locals",1)~ + postgame2
++ ~I don't want to talk, Vienxay.~ DO ~SetGlobal("bd_jail_visitors","bd0104",6) SetGlobal("bd_visit_player","locals",1)~ + postgame.X
END

IF ~~ postgame.X 
SAY ~Fine. You have no idea how hard it was to convince them to see you, but if you wish to be an arse, I will leave. You'll not see me again.~
IF ~~ EXIT 
END 

IF ~~ postgame1
SAY ~Yes it's me, Lady Vienxay Starlight.~
IF ~~ + postgame3
END

IF ~~ postgame2 
SAY ~They're watching me closely. I've the power, but it'd be far too costly. I've been here once, remember?~
IF ~~ + postgame3
END 

IF ~~ postgame3
SAY ~I hardly care if you are guilty or innocent, to me it is just a dead human.~
+~Global("bd_player_exiled","global",0)~+ ~I didn't do it, Vienxay. I'd never lie to you.~ + postgame4A
+~!Global("bd_player_exiled","global",0)~+ ~I didn't do it, Vienxay. I'd never lie to you.~ + postgame4B
++ ~Then why are you here?~ + postgame5
++ ~Just go away, Vienxay.~ + postgame.X
END

IF ~~ postgame4A 
SAY ~Yes, humans are stupid and see what they see and judge accordingly. How the situation reminded me so greatly of my own fall in Evermeet.~
IF ~~ + postgame5 
END 

IF ~~ postgame4B 
SAY ~Please, it's quite obvious. Hardly anything to be ashamed of. I found her quite annoying.~
IF ~~ + postgame5 
END 

IF ~~ postgame5
SAY ~I just wished to tell you that I am leaving. I...was beginning to feel things. Things that I did not like. You were beginning to replace the hole that the exile from Evermeet created.~
= ~I cannot have that. I cannot allow that to happen. And so I am going elsewhere. I do not care if you understand...but I do care enough to tell you first.~
++ ~I care for you, Vienxay! Don't just leave.~ + postgame6
++ ~If that's how it has to be.~ + postgameX2 
++ ~So you are abandoning me? You only care about myself.~ + postgame6
END 

IF ~~ postgame6 
SAY ~I am. I am going to do it, even if...I do not entirely like it. Even if you hate me for it, for it is the best for everyone.~
IF ~~ + postgameX2 
END 

IF ~~ postgameX2 
SAY ~Goodbye <CHARNAME>. I do hope you get out soon...this cage does not suit your glory at all.~
IF ~~ EXIT 
END 

END 
