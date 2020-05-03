BEGIN X32VienJ

// Viconia "Conflict" 

IF ~Global("X32VienViconiaConflict","LOCALS",1)~ ViconiaConflict 
SAY ~Are you seriously inviting a drow amongst our number? Are you wanting everyone to despise us?~ 
++ ~She is staying. Do you have a problem with that?~ +  VC.B 
++ ~I didn't think of the ramifications. I'll let her go.~ + VC.C
++ ~We need everyone we can get~ + VC.A
END 

IF ~~ VC.A 
SAY ~If you say so. But we better not tag along any more of them with us.~
IF ~~ DO ~SetGlobal("X32VienViconiaConflict","LOCALS",2)~ EXIT
END 

IF ~~ VC.B 
SAY ~Whatever. I'll stick around, for now.~
IF ~~ DO ~SetGlobal("X32VienViconiaConflict","LOCALS",2)~ EXIT
END 

// Baeloth Conflict 

IF ~Global("X32VienBaelothConflict","LOCALS",1)~ BaelothConflict 
SAY ~I am not walking with that drow. Absolutely not. I have standards.~ 
+~CheckStatGT(Player1,15,STR)~+ ~Baeloth is staying. Do you have a problem with that?~ +  BA.B 
+~RandomNum(3,1)CheckStatLT(Player1,16,STR)~+ ~Baeloth is staying. Do you have a problem with that?~ +  BA.B 
+~RandomNum(3,2)CheckStatLT(Player1,16,STR)~+ ~Baeloth is staying. Do you have a problem with that?~ +  BA.A 
+~RandomNum(3,3)CheckStatLT(Player1,16,STR)~+ ~Baeloth is staying. Do you have a problem with that?~ +  BA.A 
+~InParty("Viconia")~+ ~You were okay with Viconia in the party. What is one more?~ + BA.D
++ ~I didn't think of the ramifications. Baeloth, please go.~ + BA.C
+~CheckStatGT(Player1,15,CHR)~+ ~Look, we need everyone we can get if we are going to defeat Caelar.~ + BA.B
+~RandomNum(3,1)CheckStatLT(Player1,16,CHR)~+ ~Look, we need everyone we can get if we are going to defeat Caelar.~ + BA.B
+~RandomNum(3,2)CheckStatLT(Player1,16,CHR)~+ ~Look, we need everyone we can get if we are going to defeat Caelar.~ + BA.A
+~RandomNum(3,3)CheckStatLT(Player1,16,CHR)~+ ~Look, we need everyone we can get if we are going to defeat Caelar.~ + BA.A
END 

IF ~~ BA.A 
SAY ~My power is capable enough that you don't have to resort to the worst offenses. Make your decision, him or me.~
++ ~Then I choose Baeloth.~ + BA.E
++ ~Then I will choose you.~ + BA.C
END 

IF ~~ BA.B 
SAY ~Ugh! Fine. I'll tolerate him, for now.~
IF ~~ DO ~SetGlobal("X32VienBaelothConflict","LOCALS",2)~ EXIT
END 

IF ~~ BA.D
SAY ~You speak as if two makes it easier to tolerate one. I am not inclined with that at all.~ 
+~CheckStatGT(Player1,15,STR)~+ ~Baeloth is staying. Do you have a problem with that?~ +  BA.B 
+~CheckStatLT(Player1,16,STR)~+ ~Baeloth is staying. Do you have a problem with that?~ +  BA.B 
+~CheckStatLT(Player1,16,STR)~+ ~Baeloth is staying. Do you have a problem with that?~ +  BA.A 
+~CheckStatLT(Player1,16,STR)~+ ~Baeloth is staying. Do you have a problem with that?~ +  BA.A
++ ~Very well. Baeloth, please go.~ + BA.C
+~CheckStatGT(Player1,15,CHR)~+ ~Look, we need everyone we can get if we are going to defeat Caelar.~ + BA.B
+~RandomNum(3,1)CheckStatLT(Player1,16,CHR)~+ ~Look, we need everyone we can get if we are going to defeat Caelar.~ + BA.B
+~RandomNum(3,2)CheckStatLT(Player1,16,CHR)~+ ~Look, we need everyone we can get if we are going to defeat Caelar.~ + BA.A
+~RandomNum(3,3)CheckStatLT(Player1,16,CHR)~+ ~Look, we need everyone we can get if we are going to defeat Caelar.~ + BA.A
END 

IF ~~ BA.E 
SAY ~Such a fool! Good riddance to you, then!~ 
IF ~~ DO ~SetGlobal("X32VienBaelothConflict","LOCALS",-2)
SetGlobal("bd_joined","locals",0)
SetGlobal("bd_npc_camp","locals",1)
ChangeAIScript("bdparty",DEFAULT)LeaveParty()~
EXIT 
END 

// Talk 1 

IF ~Global("X32VienTalk","GLOBAL",2)~ Talk1 
SAY ~So, the hero of Baldur's gate. Don't expect that to last long.~ [X3VSonD]
++ ~What are you on about?~ + Talk1.A
++ ~Do you ever say *anything* nice?~ + Talk1.B
++ ~Oh do be quiet.~ + Talk1.C
END 

IF ~~ Talk1.A 
SAY ~You are a hero and useful to them now. But you know what others think. Some will wish to use you, and others destroy you.~
IF ~~ + Talk1.D 
END 

IF ~~ Talk1.B
SAY ~Please, I am trying to make a point, a warning to help you.~
IF ~~ + Talk1.A 
END 

IF ~~ Talk1.C 
SAY ~Oh fine! I will not speak my mind. You will of course, regret it later.~
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ Talk1.D 
SAY ~You will need to be careful. I was betrayed and exiled from Evermeet when my mentor saw an advantage. You do not want the same fate for yourself. Watch your friends and enemies carefully.~
++ ~You seem very certain this will happen.~ + Talk1.E 
++ ~Thank you for your concern. I'll be careful.~ + Talk1.F 
++ ~Do stop being paranoid.~ + Talk1.C 
END 

IF ~~ Talk1.E 
SAY ~History has a habit of repeating its echoes on others. I am merely giving advice.~ 
+~Global("X32VienWasInBG1","GLOBAL",1)~+ ~I recall you were not altogether innocent for your own fall, Vienxay.~ + Talk1.BG1
++ ~Thank you for your concern. I'll be careful.~ + Talk1.F 
++ ~Do stop being paranoid.~ + Talk1.C 
END 

IF ~~ Talk1.F 
SAY ~Good. You'll thank me later.~
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

IF ~~ Talk1.BG1 
SAY ~You know well the circumstances of that!~
= ~I suppose I will have to accept you have some sensibility and have helped me in the past. I only speak because I wish the best for you.~
+~Gender(Player1,MALE)!Race(Player1,HALFLING)!Race(Player1,DWARF)!Race(Player1,GNOME)~+ ~Have a soft spot for me, then?~ + Talk1.G // This line will set Romance to one. There aren't any gender checks, I'll just set up some race ones here.~
++ ~Thank you for your concern. I'll be careful.~ + Talk1.F 
++ ~Do stop being paranoid.~ + Talk1.C 
END 

IF ~~ Talk1.G 
SAY ~What? No! That hardly has anything to do with this! Ugh. The ideas in your head.~
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

// Talk 2

IF ~Global("X32VienTalk","GLOBAL",4)~ Talk2
SAY ~This crusade is really all another example of human inferiority.~ [X3VSonD] 
++ ~And what do you mean by that?~ + Talk2.A
+~Race(Player1,HUMAN)~+ ~Hey, watch it, elf.~ + Talk2.B
++ ~Caelar is not fully human, Vienxay. Nor would most consider her inferior.~ + Talk2.C
++ ~I see your nose is high in the sky.~ + Talk2.D
END

IF ~~ Talk2.A 
SAY ~This is another human war, that is shaping countless lives with little care. You've seen the refugees, the displaced, the dead.~
= ~It isn't going to end anytime soon.~
+~Alignment("X3Vien",NEUTRAL)~+ ~It sounds like you care for all of these people.~ + Talk2.E 
+~Alignment("X3Vien",NEUTRAL_EVIL)~+ ~It sounds like you care for all of these people.~ + Talk2.F
++ ~All creatures do this, Vienxay. All creatures are capable of destruction and harming others. Not just Caelar, and not just humanity.~ + Talk2.G
++ ~So? Might makes right.~ + Talk2.H
END 

IF ~~ Talk2.B
SAY ~Please. You aren't as worthless as other humans, if it soothes your heart. But I am clearly right.~ 
IF ~~ + Talk2.A 
END 

IF ~~ Talk2.C 
SAY ~She certainly seems superior than her counterparts, excluding you of course, but she shows all of the same flaws as the most worthless human.~
IF ~~ + Talk2.A 
END 

IF ~~ Talk2.D 
SAY ~And rightfully so.~
IF ~~ + Talk2.A 
END  

IF ~~ Talk2.E 
SAY ~Hrmph. Fine, I admit it. But only a little. Their suffering moves me.~
IF ~~ + Talk2.G
END 

IF ~~ Talk2.F 
SAY ~Hardly. I just loath watching humanity do its worst: Destroy.~
IF ~~ + Talk2.G
END 

IF ~~ Talk2.G 
SAY ~My people in Evermeet would never do this. They would be above it all.~
++ ~They aren't your people anymore. You were exiled.~ + Talk2.I
++ ~You must miss them a lot.~ + Talk2.J
++ ~Yeah, yeah, can you cut out the superiority? Thanks.~ + Talk2.K // This breaks romance.
END 

IF ~~ Talk2.H 
SAY ~So it does. But there is no need to exercise it so recklessly.~
IF ~~ + Talk2.G 
END 

IF ~~ Talk2.I 
SAY ~That is true. That is cold, but very true.~
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

IF ~~ Talk2.J 
SAY ~I do. I wish...Ugh! Whatever. It doesn't matter. And I don't wish to talk about them anymore.~
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

IF ~~ Talk2.K 
SAY ~The Audacity! I would give anything for home to be away from such rudeness and war. The misery!~
IF ~~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

// Talk 3

IF ~Global("X32VienTalk","GLOBAL",6)~ Talk3
SAY ~I must speak with you at once.~ [X3VSpeak] 
++ ~What is it?~ + Talk3.A
++ ~Is there a please somewhere?~ + Talk3.A
++ ~No.~ + Talk3.B
END 

IF ~~ Talk3.B 
SAY ~Please, I was hardly asking you.~ [X3VSonD]
IF ~~ + Talk3.A 
END 

IF ~~ Talk3.A 
SAY ~It's about before. About being stuck in this war.~ [X3VSonD]
++ ~You don't want to be here, helping?~ + Talk3.C
++ ~We don't always choose where we go.~ + Talk3.D
++ ~Nothing is keeping you here. Leave if you wish.~ + Talk3.E
++ ~I would really not want to talk about it.~ + Talk3.Exit 
END 

IF ~~ Talk3.C 
SAY ~I want to be home, sipping the finest elven wine, ridiculing the worst dressed Evermeet people, and enjoying peace without the presence of inferiors.~
IF ~~ + Talk3.F 
END 

IF ~~ Talk3.D 
SAY ~And that is precisely my irritation.~
IF ~~ + Talk3.C 
END 

IF ~~ Talk3.E 
SAY ~Please. If I leave they will just put me back in that awful cell. And I can't return to Evermeet.~
IF ~~ + Talk3.F 
END 

IF ~~ Talk3.F 
SAY ~Ugh. I should be grateful that I was allowed to be free to fight rather than be in that horrendous cell, but to be forced to fight irks me.~
++ ~Look at the positives. You've been an asset to me.~ + Talk3.G
++ ~It could be worse.~ + Talk3.H
++ ~Can you stop whining? There are more important things to do.~ + Talk3.Exit 
END 

IF ~~ Talk3.Exit 
SAY ~Fine, fine, fine!~
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

IF ~~ Talk3.G 
SAY ~Oh? Well, of course. I aim to please.~
IF ~~ + Talk3.I 
END 

IF ~~ Talk3.H 
SAY ~I suppose so.~
IF ~~ + Talk3.I 
END 

IF ~~ Talk3.I 
SAY ~Thank you for letting me get that off at least. Ugh. Well. To these horrid matters at hand, then.~
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

// Talk 4 

IF ~Global("X32VienTalk","GLOBAL",8)~ Talk4 
SAY ~I want your honest opinion. What do you think of me?~ [X3VSpeak] 
++ ~Oh dear. Where do I even start?~ + Talk4.A
++ ~Why do you ask?~ + Talk4.B 
++ ~I like you well enough, despite everything.~ + Talk4.C 
++ ~I don't think you want my honest opinion.~ + Talk4.B
++ ~You're valuable to me, and that's what matters.~ + Talk4.D
END 

IF ~~ Talk4.A 
SAY ~Do take your time with your praise.~
++ ~This is quite amusing.~ + Talk4.E
++ ~Oh, the praise has already ended. Let's move on to the criticism.~ + Talk4.F
++ ~You're valuable to me, and that's what matters.~ + Talk4.D
++ ~You are clearly deluded.~ + Talk4.F
++ ~I like you well enough, despite everything.~ + Talk4.C
END 

IF ~~ Talk4.B 
SAY ~I value your opinion, obviously.~
IF ~~ + Talk4.A 
END 

IF ~~ Talk4.C 
SAY ~Of course you do, as expected.~
IF ~~ + Talk4.G
END 

IF ~~ Talk4.D 
SAY ~Valuable? Well that is obvious, I suppose.~
IF ~~ + Talk4.G 
END 

IF ~~ Talk4.E 
SAY ~Amusing? Ugh. This was a serious question. If you can't answer it seriously, then never mind!~
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END

IF ~~ Talk4.F 
SAY ~How hurtful! Clearly you do not see the value I bring for you.~
IF ~~ + Talk4.G 
END 

IF ~~ Talk4.G
SAY ~I have done my most to be a good friend to you and do my part, despite being in a place I've no desire to be.~
+~Gender(Player1,MALE)!Race(Player1,HALFLING)!Race(Player1,DWARF)!Race(Player1,GNOME)Global("X32VienWasInBG1","GLOBAL",1)~+ ~Just a friend?~  + Talk4.H1 
+~Gender(Player1,MALE)!Race(Player1,HALFLING)!Race(Player1,DWARF)!Race(Player1,GNOME)!Global("X32VienWasInBG1","GLOBAL",1)~+ ~Just a friend?~  + Talk4.H2 
+~Gender(Player1,FEMALE)!Race(Player1,HALFLING)!Race(Player1,DWARF)!Race(Player1,GNOME)~+ ~Just a friend?~ + Talk4.H3 
+~OR(3)Race(Player1,HALFLING)Race(Player1,DWARF)Race(Player1,GNOME)~+ ~Just a friend?~ + Talk4.H4 
+~!Race(Player1,ELF)~+ ~I'm surprised. I'm not even an elf.~ + Talk4.I
++ ~I appreciate that friendship.~ + Talk4.J
++ ~That friendship is definitely one way.~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + Talk4.K
END 

IF ~~ Talk4.H1 
SAY ~For now. Who knows what will come after this crusade is dealt with.~
IF ~~ + Talk4.L
END 

IF ~~ Talk4.H2 
SAY ~Just? I suppose anyone would desire more out of me. Though if you are paying attention we are in the middle of dealing with a crusade.~
IF ~~ + Talk4.L
END 

IF ~~ Talk4.H3 
SAY ~Clearly only just. I'd only look at you with any lust if I were drunk.~
IF ~~ + Talk4.N 
END 

IF ~~ Talk4.H4 
SAY ~Clearly. Your height would make activities awkward and frustrating. A pity you weren't born an elf.~
IF ~~ + Talk4.N 
END

IF ~~ Talk4.I 
SAY ~Be surprised. And be grateful.~
IF ~~ + Talk4.M 
END 

IF ~~ Talk4.J 
SAY ~You should appreciate it.~
IF ~~ + Talk4.M
END 

IF ~~ Talk4.K 
SAY ~The audacity! The ungratefulness. I won't be nice to you anymore.~
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ Talk4.L 
SAY ~Let such thoughts wait until the crusade actually is over.~
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ Talk4.M 
SAY  ~Not all would be so lucky.~ 
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ Talk4.N 
SAY ~Though I do enjoy being desired.~
IF ~~ DO ~SetGlobalTimer("X32VienGameTalkTimer","GLOBAL",THREE_DAYS)RealSetGlobalTimer("X32VienRealTalkTimer","GLOBAL",ONE_HOUR)IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~Global("X32VienTalk","GLOBAL",10)~ Talk5 // IF the PC indicates they only wish friendship, or just wishes some rest, the romance becomes inactive even if they sleep together.
SAY ~Come here, <CHARNAME>. Do sit over and talk with me.~  
++ ~Certainly.~ + T5.A
++ ~Okay, what are you wanting to talk about?~ + T5.A 
++ ~Actually, I just want to get some rest.~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.X 
END 

IF ~~ T5.A 
SAY ~Good. Get comfortable as you please.~
IF ~Race(Player1,ELF)~ + T5.B1  
IF ~!Race(Player1,ELF)~ + T5.B2 
END 

IF ~~ T5.B1 
SAY ~I have not met such a...impressive individual of our people for some time.~ [X3VSpeak] 
= ~Not one so strong, striking, and of course, competent.~
++ ~You look lovely, yourself, Vienxay.~ + T5.C1
++ ~What are you getting at?~ + T5.D 
++ ~That sums me up quite perfectly.~ + T5.C2
++ ~Flattery? You must want something.~ + T5.D 
END  

IF ~~ T5.B2
SAY ~I have rarely met a person who wasn't an elf that I have as much respect for as you do.~
= ~Despite your race, you've proven to be strong, competent, and delightful to gaze upon.~ 
++ ~I'm surprised you're telling me this, given I am a <PRO_RACE>.~ + T5.C3 
++ ~You look lovely, yourself, Vienxay.~ +T5.C1 
++ ~What are you getting at?~ + T5.D 
++ ~That sums me up quite perfectly.~ + T5.C2 
++ ~Flattery? You must want something.~ + T5.D 
END 

IF ~~ T5.C1 
SAY ~With the way you admire me, I am very reassured of that.~
IF ~~ + T5.D 
END 

IF ~~ T5.C2 
SAY ~Well, I do have a flawless way of descriptive language.~
IF ~~ + T5.D 
END 

IF ~~ T5.C3 
SAY ~I usually am picky. But for once...I am more than willing to overlook it.~
IF ~~ + T5.D 
END 

IF ~~ T5.D 
SAY ~I haven't been touched in a while. I wish you to lay with me when we rest. I promise it will be... mutually beneficial.~
++ ~What? No, I can't do that.~ + T5.E 
++ ~I see no reason to refuse.~ + T5.H 
++ ~Why are you asking this?~ + T5.G 
END 

IF ~~ T5.E 
SAY ~And why not? I am not hideous. Are you nervous?~
++ ~This is too soon, Vienxay. I care about you, and that's why I want to slow down.~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",2)~ + T5.K 
++ ~I don't want this. You're a friend to me.~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.F 
++ ~A little.~ + T5.J
END 

IF ~~ T5.F 
SAY ~I don't ask anything more than friendship, <CHARNAME>, there's hardly anything to be concerned over. A few hours of entanglement and we can go by as if nothing happened.~
= ~A clear benefit for us both.~
++ ~All right then, just this once.~  + T5.H
++ ~I'm not interested.~ + T5.I 
++ ~This is about mere lust then? I don't want something so shallow, even as friends.~ + T5.I 
END 

IF ~~ T5.G 
SAY ~Sleeping alone is lonely. Companionship can stir a bit excitement and relaxing. I only ask for this once. After that, we are as we always were.~
++ ~All right then, just this once.~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",2)~ + T5.H 
++ ~I'm not interested.~  DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.I 
++ ~This is about mere lust then? I don't want something so shallow, even as friends.~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.I 
END 

IF ~~ T5.H 
SAY ~Then come closer, <CHARNAME>. You'll have one rest to remember far more fondly than all others.~
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)SetGlobal("X32VienPIDTalk3","GLOBAL",1)RestParty()~ EXIT // This PID variable activates Vienxay's last PID Talk and is used in talk 6
END 

IF ~~ T5.I 
SAY ~Ugh! What a stupid decision you've made. I have no further interest in conversing with you right now. A bed awaits for me without you.~
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)RestParty()~ EXIT // This PID variable activates Vienxay's last PID Talk and is used in talk 6
END 

IF ~~ T5.J
SAY ~I suppose exposing one's vulnerable skin can be...distressing at first. But when we're done, you'll wish you've done it sooner.~
++ ~All right then, just this once.~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",2)~ + T5.H 
++ ~I'm not interested.~  DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.I 
++ ~This is about mere lust then? I don't want something so shallow, even as friends.~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ + T5.I 
END 

IF ~~ T5.K 
SAY ~I...did not expect this. My...passions have always been mere indulgence of flesh and nothing more then that, sweet words merely to get what was truly desired.~
= ~I am lonely, <CHARNAME>. I miss...greatly miss Evermeet. Sometimes I struggle to sleep for it.~
= ~Your words touch me a lot, <CHARNAME>, and I will respect your wishes. But will you at least rest next to me? Your presence would be...a happy blessing.~
++ ~I would like that.~ + T5.L 
++ ~As long as you don't snore.~ + T5.M
++ ~With everything that is going on...I think it's better we stay as friends.~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~  + T5.N  
END  

IF ~~ T5.L 
SAY ~I think I will sleep peacefully tonight.~
= ~...Thank you. Thank you, <CHARNAME>.~ 
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)RestParty()~ EXIT 
END 

IF ~~ T5.M 
SAY ~Please! I certainly do not. Oh, you said that to rile me up. Such a trickster.~
IF ~~ + T5.L 
END 

IF ~~ T5.N 
SAY ~You just said...ugh, I opened myself up for no reason at all, only to get hurt.~
= ~Fine. It will be as you wish it.~ 
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)RestParty()~ EXIT 
END 


IF ~~ T5.X 
SAY ~You want to rest? Well, rest then. Hrmph!~
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)RestParty()~ EXIT 
END 

IF ~Global("X32VienTalk","GLOBAL",12)~ Talk6 
SAY ~Gods, they trapped us in here. I hardly want to go through that portal!~
++ ~We have to. It's the only way to finish this.~ + T6.A 
++ ~Would you rather stay here?~ + T6.B 
++ ~Don't you want to help me?~ + T6.C 
END 

IF ~~ T6.A 
SAY ~We do the work, while the human commander and his men just abandon us. Ugh.~
IF ~Global("X32VienRomanceActive","GLOBAL",2)~ + T6.D 
IF ~!Global("X32VienRomanceActive","GLOBAL",2)~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ T6.B 
SAY ~By myself? Hardly. I want out...and our exit requires Caelar dealt with.~
IF ~Global("X32VienRomanceActive","GLOBAL",2)~ + T6.D 
IF ~!Global("X32VienRomanceActive","GLOBAL",2)~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ T6.C 
SAY ~I didn't sign up to jump into a portal to the hells...but I suppose you will need my power.~
IF ~Global("X32VienRomanceActive","GLOBAL",2)~ + T6.D 
IF ~!Global("X32VienRomanceActive","GLOBAL",2)~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

IF ~~ T6.D 
SAY ~If we do survive, do know this, <CHARNAME>...~
IF ~GlobalGT("X32VienPIDTalk3","GLOBAL",0)~ + T6.E  
IF ~!GlobalGT("X32VienPIDTalk3","GLOBAL",0)~ + T6.F 
END 

IF ~~ T6.E 
SAY ~I enjoyed our...special night. I meant it to be a single instance, but if we get out of this, I will certainly not mind another.~
IF ~~ + T6.G 
END 

IF ~~ T6.F 
SAY ~You were...very comforting to me in a time of need, and I appreciate it. You've been nothing but caring. And I have often been selfish.~
IF ~~ + T6.G 
END 

IF ~~ T6.G 
SAY ~For that, I wish you to know I care about you, and ugh, just...don't do anything stupid when we jump through.~
++ ~I won't, Vienxay.~ + T6.H
++ ~That's what I have you along for.~ + T6.H
++ ~Stupid? It is our enemies who are the fools.~ +  T6.H
END 

IF ~~ T6.H 
SAY ~Well enough of that. Let's finish this.~ 
IF ~~ DO ~IncrementGlobal("X32VienTalk","GLOBAL",1)~ EXIT 
END 

// THRIX

IF ~Global("X32VienSacrifice","bd4500",1)~ ThrixTalk0
SAY ~Excuse me, excuse me! Explain yourself! Why would you even consider what you did?~
+ ~!Global("X32_thrix_mark_Vienxay","global",1)~ + ~I was bluffing. There's nothing to worry about.~ DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk2
+ ~Global("X32_thrix_mark_Vienxay","global",1)~ + ~I was bluffing. There's nothing to worry about.~ DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk1
+ ~!Global("X32_thrix_mark_Vienxay","global",1)~ + ~I'm sorry, Vienxay. I shouldn't have done that.~ DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk3
+ ~Global("X32_thrix_mark_Vienxay","global",1)~ + ~I'm sorry, Vienxay. I shouldn't have done that.~ DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk1
+ ~!Global("X32_thrix_mark_Vienxay","global",1)~ + ~I have an objective, and I'll do whatever it takes to get it done.~ DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk4
+ ~Global("X32_thrix_mark_Vienxay","global",1)~ + ~I have an objective, and I'll do whatever it takes to get it done.~ DO ~SetGlobal("X32VienSacrifice","bd4500",2)~ + ThrixTalk1
END

IF ~~ ThrixTalk1
 SAY ~I should have *never* trusted you. To throw away the group's most valuable asset!~
IF ~OR(2)
Global("X32VienRomanceActive","GLOBAL",1)
Global("X32VienRomanceActive","GLOBAL",2)~ + ThrixTalk5
IF ~!Global("X32VienRomanceActive","GLOBAL",1)
!Global("X32VienRomanceActive","GLOBAL",2)~ EXIT
END

IF ~~ ThrixTalk2
 SAY ~It's hardly convincing...but you did get the riddle right.~
IF ~~ + ThrixTalk6
END

IF ~~ ThrixTalk3
 SAY ~You understand that now? Now is too late.~
IF ~~ + ThrixTalk6
END

IF ~~ ThrixTalk4
 SAY ~Excuse me? You are as ruthless as my mentor.~
IF ~OR(2)
Global("X32VienRomanceActive","GLOBAL",1)
Global("X32VienRomanceActive","GLOBAL",2)~ + ThrixTalk5
IF ~!Global("X32VienRomanceActive","GLOBAL",1)
!Global("X32VienRomanceActive","GLOBAL",2)~ EXIT
END

IF ~~ ThrixTalk5
 SAY ~I should have never-...ugh, whatever!~
IF ~~ DO ~SetGlobal("X32VienRomanceActive","GLOBAL",3)~ EXIT
END

IF ~~ ThrixTalk6
 SAY ~Let's just get Caelar and get out of this horrible place for good.~
IF ~~ EXIT
END


// Shadow Weave. This talk will only fire at night, and one game day after talk 3.

IF ~Global("X32VQuestTalk","GLOBAL",2)~ QTalk 
SAY ~<CHARNAME>. Have you listened to some of the rumors going around camp?~ 
++ ~What are you talking about?~ + QTalk.1 
++ ~Do tell.~ + QTalk.1
++ ~I don't have time for gossip.~ + QTalk.2
END 

IF ~~ QTalk.1
SAY ~I've picked up word of an elder mage who practices shadow magic in the forest, taking the horns of wyverns and spider silk for her art.~
= ~If this is truly Shadow Magic and not Shar's aspect, I could have someone who may be able to share the secrets of their power with me. And the more powerful I am, the better we are.~
++ ~You want to speak to this elder mage, then?~ + QTalk.3
++ ~I'll consider it. We could use more power if we are to win this fight.~ + QTalk.4
++ ~If you can't tell, Vienxay, we're in the middle of an expedition. We don't have time for detours.~ + QTalk.5 
END 

IF ~~ QTalk.2 
SAY ~You should make time for it. Sometimes, you find useful tidbits of information spout in the rubbish of the common human's speech.~
IF ~~ + QTalk.1 
END 

IF ~~ QTalk.3 
SAY ~Of course I do. There are very few known practitioners of my art that are not...like my mentor, or unknown. If these men whispers held even a sliver of truth, it's an opportunity for me.~
= ~I am sure the expedition would not mind a small delay to their advantage, if it turns out to be a delay at all.~
IF ~~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",3)AddJournalEntry(@153,QUEST)~ EXIT  
END  

IF ~~ QTalk.4 
SAY ~I am glad you see it my way. All we have to do is find this forest and this "elder mage", and see what she will give for a taste of knowledge. I am sure it will be a breeze.~
IF ~~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",3)AddJournalEntry(@153,QUEST)~ EXIT  
END  

IF ~~ QTalk.5 
SAY ~Well I can't force you to be sensible...but perhaps if we are lucky, our road and my goals may yet still align.~
IF ~~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",3)AddJournalEntry(@153,QUEST)~ EXIT  
END  

IF ~Global("X32VQuestTalk","GLOBAL",9)~ QTalkFinal 
SAY ~I suppose...I should have expected that I wouldn't be able to gather the knowledge I wanted from this tome so quickly. This could take months, years, even.~
++ ~Don't be discouraged. Have you made any progress?~ + progress 
++ ~Then perhaps it's worthless, then. We may have just got manipulated by that mage.~ + manipulated 
++ ~Are you talking to yourself?~ + yourself 
END 

IF ~~ progress 
SAY ~All I have comprehended is this spell Shadowbolt. An innate bit of cold shadowy bolt that I could fling. I was hoping for something grander...more befitting of my greatness.~
= ~But...I still feel like a lowly student, the same sort that fell for my master's tricks back in Evermeet. I don't even know if I've improved at all.~
+~Global("X32VienWasInBG1","GLOBAL",1)~+ ~You've come a long way since I've met you, Vienxay. You've grown and become stronger, believe me.~ + believe_me 
++ ~You just have to keep pushing forward. If you give up now, then you know you'll never get better.~ + pushing_forward 
++ ~You haven't, really. But sometimes people just meet their plateau.~ + plateau 
++ ~I haven't known for very long, but...I think your skills with magic have been helpful to our cause.~ + helpful 
END

IF ~~ believe_me 
SAY ~That...is comforting, <CHARNAME>. I don't know why I was doubting myself so.~
IF ~~ + new_spell  
END 

IF ~~ new_spell 
SAY ~I suppose I will see just how useful Shadowbolt is in our next battle, if you'll let me. I am eager to test my new knowledge.~
IF ~~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",10)AddSpecialAbility("X3VSBLT")AddSpecialAbility("X3VSBLT")~ EXIT 
END 

IF ~~ pushing_forward 
SAY ~Ugh, I suppose you are right. Still, it would be better if results were more instaneous. I need the gratification.~ 
IF ~~ + new_spell 
END 

IF ~~ plateau 
SAY ~You are the worst! You are supposed to tell me how great I am. I guess you are just trying to be honest with your opinion. I can...tolerate that. Barely.~
IF ~~ + new_spell 
END 

IF ~~ helpful 
SAY ~"Helpful". I suppose...that is at least progress. Far from the terrified elf I was when I first left Evermeet that was afraid she couldn't protect herself from any element of danger, let alone others.~
IF ~~ + new_spell 
END 


IF ~~ manipulated 
SAY ~I wouldn't put it past her. Everyone else who know a thing about Shadow Magic only ended up using me before.~
IF ~~ + progress 
END 

IF ~~ yourself 
SAY ~Of course I am not talking to myself! Ugh. Fine, I was. I'm just frustrated at my lack of progress.~
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
~A wise choice.~
DO ~SetGlobal("X32VienViconiaConflict","LOCALS",-1)~
== BDVICONJ ~You know where to find me when you stop taking this fool's advice.~
DO ~SetGlobal("bd_joined","locals",0)
SetGlobal("bd_npc_camp","locals",1)
ChangeAIScript("bdparty",DEFAULT)LeaveParty()~
EXIT 

CHAIN X32VIENJ BA.C 
~Good, you are sensible!~
DO ~SetGlobal("X32VienBaelothConflict","LOCALS",-1)~
== BDBAELOJ ~A fiery fool to force this idea of leaving! To do better without I, Baeloth? Bah!~
DO ~SetGlobal("bd_joined","locals",0)
SetGlobal("bd_npc_camp","locals",1)
ChangeAIScript("bdparty",DEFAULT)LeaveParty()~
EXIT 

// Schael Corwin of Vienxay's location. We'll have to add a LOT to this one.
/*For this to be perfect, we should add the variable that flags the PC having met Vienxay, so they don't superfluously mention Vienxay even after rejecting her.*/

I_C_T2 BDSCHAEL 39 X3VienBDDSChael39
== BDSCHAEL ~There's an elf named Vienxay that's staying in a cell in the Flaming Fist headquarters.~
END

EXTEND_TOP BDSCHAEL 115 #3
+~!InParty("X3Vien")~+ ~What about Vienxay?~ EXTERN BDSCHAEL X3Vbdschael120
END

CHAIN BDSCHAEL X3Vbdschael120
~I was hoping you wouldn't bring her up. She's in the cells in the Flaming Fist Headquarters, if you want to see her.~
COPY_TRANS BDSCHAEL 120

EXTEND_TOP BDSCHAEL 60 #3
+~!InParty("X3Vien")~+ ~I am considering seeing Vienxay in her cell.~ EXTERN BDSCHAEL X3Vbdschael120A
END

EXTEND_TOP BDSCHAEL 62 #3
+~!InParty("X3Vien")~+ ~I am considering seeing Vienxay in her cell.~ EXTERN BDSCHAEL X3Vbdschael120A
END

EXTEND_TOP BDSCHAEL 63 #3
+~!InParty("X3Vien")~+ ~I am considering seeing Vienxay in her cell.~ EXTERN BDSCHAEL X3Vbdschael120A
END

EXTEND_TOP BDSCHAEL 64 #3
+~!InParty("X3Vien")~+ ~I am considering seeing Vienxay in her cell.~ EXTERN BDSCHAEL X3Vbdschael120A
END

CHAIN BDSCHAEL X3Vbdschael120A
~I was hoping you wouldn't bring her up. She's in the cells in the Flaming Fist Headquarters, if you want to see her. Are you seriously considering that?~
COPY_TRANS BDSCHAEL 65




I_C_T BDSCHAEL 65 X3VienBDDSChae65
== BDSCHAEL ~The elf there, Vienxay, is not much better than that mad cleric.~
END

EXTEND_TOP BDSCHAEL 73 #3
+~!InParty("X3Vien")~+ ~I am considering seeing Vienxay in her cell.~ EXTERN BDSCHAEL X3Vbdschael120B
END

EXTEND_TOP BDSCHAEL 74 #3
+~!InParty("X3Vien")~+ ~I am considering seeing Vienxay in her cell.~ EXTERN BDSCHAEL X3Vbdschael120B
END

CHAIN BDSCHAEL X3Vbdschael120B
~I was hoping you wouldn't bring her up. She's in the cells in the Flaming Fist Headquarters, if you really want to see that arrogant elf.~
COPY_TRANS BDSCHAEL 75

I_C_T BDSCHAEL 75 X3VienBDDSChae75
== BDSCHAEL ~The elf there, Vienxay, is not much better than that mad cleric.~
END

EXTEND_TOP BDSCHAEL 107 #3
+~!InParty("X3Vien")~+ ~I am considering seeing Vienxay in her cell.~ EXTERN BDSCHAEL X3Vbdschael120C
END

EXTEND_TOP BDSCHAEL 108 #3
+~!InParty("X3Vien")~+ ~I am considering seeing Vienxay in her cell.~ EXTERN BDSCHAEL X3Vbdschael120C
END

EXTEND_TOP BDSCHAEL 109 #3
+~!InParty("X3Vien")~+ ~I am considering seeing Vienxay in her cell.~ EXTERN BDSCHAEL X3Vbdschael120C
END

EXTEND_TOP BDSCHAEL 110 #3
+~!InParty("X3Vien")~+ ~I might. I am also considering seeing Vienxay there.~ EXTERN BDSCHAEL X3Vbdschael120C
END

CHAIN BDSCHAEL X3Vbdschael120C
~I was hoping you wouldn't bring her up. She's in the cells in the Flaming Fist Headquarters, if you really want to see that arrogant elf.~
COPY_TRANS BDSCHAEL 107

I_C_T BDSCHAEL 78 X3VienBDDSChae78
== BDSCHAEL ~The elf Vienxay is there as well. She is not much better.~
END

EXTEND_TOP BDSCHAEL 79 #3
+~!InParty("X3Vien")~+ ~It could be the smell of elf.~ EXTERN BDSCHAEL X3Vbdschael79A
END

CHAIN BDSCHAEL X3Vbdschael79A 
~You mean Vienxay? Her attitude stinks, and doesn't win her any friends. If that's who you want to speak to, let's get inside~
EXIT 

EXTEND_TOP BDSCHAEL 80 #3
+~!InParty("X3Vien")~+ ~Oh. Actually, it was Vienxay who I wanted to see.~ EXTERN BDSCHAEL X3Vbdschael79B
END

CHAIN BDSCHAEL X3Vbdschael79B
~The elf isn't much better. She was celled recently, but if you think she'll be useful, let's head on in.~
EXIT 

EXTEND_TOP BDSCHAEL 80 #3
+~!InParty("X3Vien")~+ ~Actually, can you tell me about Vienxay?~ EXTERN BDSCHAEL X3Vbdschael79C
END

CHAIN BDSCHAEL X3Vbdschael79C
~She claims to be from Evermeet. Exiled. She nearly killed a refugee in an inn with magic. She's dangerous, and not someone I would recommend taking along. But it is your call.~
EXIT 

I_C_T BDSCHAEL 209 X3VienBDDSChae209
== BDSCHAEL ~I almost forgot. You can find the elf Vienxay in the north block, the right side of the central chamber. If you really believe she is worth it, you can talk to her there.~
END

EXTEND_TOP BDSCHAEL 210 #3
+~InParty("X3Vien")IsValidForPartyDialogue("X3Vien")~+ ~Actually, I've spoken to Vienxay. Corwin, meet Vienxay. Vienxay, meet Corwin.~ EXTERN BDSCHAEL X3VienSchaelMeet
END

CHAIN BDSCHAEL X3VienSchaelMeet
~Good to meet you.~
== X32VienJ ~I wish I could say the same, human.~
== BDSCHAEL ~I see the rumors are all true about you. If we're done here, let's go.~
EXIT 

// Fritz 

EXTEND_TOP BDFritz 1 #3
+~!InParty("X3Vien")Global("X32Fritz","GLOBAL",1)~+ ~I would like you to release Vienxay. She is to march by my side with the Dragonspear Expedition~ EXTERN BDFritz X3VFritz
END

EXTEND_TOP BDFritz 1 #3
+~!InParty("X3Vien")GlobalLT("X32Fritz","GLOBAL",1)~+ ~I am <CHARNAME>, and I've come to speak to the prisoner Vienxay~ EXTERN BDFritz X3VFritz2
END

CHAIN BDFritz X3VFritz 
~If  you're sure. That elf has been a headache. I'll release her now.~
DO ~SetGlobal("X32Fritz","GLOBAL",2)StartCutSceneMode()
StartCutScene("X3Vcut01")~ EXIT 

CHAIN BDFritz X3VFritz2 
~She's in the north block, all the way down the end on the right. Very annoying.~
EXIT 


//Tiax 

I_C_T BDTIAX 0 X32VienBDTiax
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~Gods, not this lunatic.~
END

I_C_T BDMKHIIN 10 X32VienBDMKHIIN10 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~The drow is defeated by a goblin. Delightfully embarrassing.~
END

// Kieran
I_C_T BDKIERAN 2 X3VienBDKIERAN
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~A bad lie can get you killed, idiot.~
END

// Aileen 
I_C_T BDAILEEN 8 X3VienBDAileen 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~She doesn't deserve a cell. Not for that. That place is far too terrible for her.~
END

// Lucill

I_C_T BDLUCILL 0 X3vienBDLUCILL  
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~I'm just as happy watching these humans beat each other up.~
END

// Tanorm 

I_C_T BDTanorm 1 X3VienTanorm 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~The same reason I was thrown in a cell for. A bit of rowdiness from all of this hussle and crowding. These guards are overeager.~
END

I_C_T BDSETHYL 0 X3VienSethyl 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~I am quite happy to stab you, drow.~
END

I_C_T BDZAVIAK 1 X3VienZaviak 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~This conversation is about to go nowhere fast.~
END

I_C_T BDByzon 9 X3VienByzon
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~Helping him is a waste of time if you ask me. He'll never learn to stand up for himself now.~
END

I_C_T BDPriest 0 X3VienPriest0
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~It's a shame you have to house any at all.~
END

I_C_T BDRohma 1 X3VienRohma1
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~The stupidity of children. Ugh. I can't stand it.~
END

// Menhir 

EXTEND_TOP BDMENHI2 6 #7
+~IsValidForPartyDialog("X3Vien")~+ ~A coin for your thoughts, Vienxay?~ EXTERN X32VienJ X32VienMenhir2R 
END 

CHAIN X32VienJ X32VienMenhir2R
~Please, my thoughts are worth more than that. Though this is quite obvious: One is the wind, one is a tree, and the other a river.~
EXTERN BDMENHI2 2

I_C_T BDTELERI 32 X32RecBDTELERI32 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~A golem assistant. Worthwhile.~
END

I_C_T BDTELERI 15 X32RecBDTELERI15 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~A worthwhile trade. Do take care of yourself, kin.~
== BDTELERI ~Your concern is touching. Farewell.~
END

// Bridgefort 

I_C_T BDBF1 1 X32VIENBDBF11
== X32VIENJ IF ~IsValidForPartyDialogue("X3VIEN")~ THEN ~If *I* were in charge of the magical defenses this wouldn't be happening! I feel like something is draining me.~
END

EXTEND_TOP BDWYNAN 7 #4
+ ~IsValidForPartyDialogue("X3Vien")~ + ~Vienxay. Can you be helpful and lend your magical expertise?~ EXTERN X32VIENJ bdwynan7
END

CHAIN X32VienJ bdwynan7
~Fine! Let me make it simple so that even you understand. This stone is draining our energy. It will effect everyone, making us weak.~
= ~So obviously, we need to go find whoever did this, kill them, and see if they have a scroll to reverse it.~
COPY_TRANS BDWYNAN 8

EXTEND_TOP BDBF2 2 #4
+ ~IsValidForPartyDialogue("X3Vien")~ + ~Vienxay. Can you be helpful and lend your magical expertise?~ EXTERN X32VIENJ bdwynan7B
END

CHAIN X32VienJ bdwynan7B
~Fine! Let me make it simple so that even you understand. This stone is draining our energy. It will effect everyone, making us weak.~
= ~So obviously, we need to go find whoever did this, kill them, and see if they have a scroll to reverse it.~
COPY_TRANS BDWYNAN 8

EXTEND_TOP BDWYNAN 14 #4
+ ~IsValidForPartyDialogue("X3Vien")~ + ~I've got it. If you would, Vienxay?~ EXTERN X32VIENJ bdwynan14
END 

I_C_T BDKHALID 66  X32VienBDKHALID66
== X32VIENJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~Please. It's surprising it already hasn't fallen with a half-breed in charge.~
END

I_C_T BDDOSIA 25 X32VienBDDOSIA25 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~What, do you think valuable healthcare should be free? Foolish.~
END 

I_C_T BDWAIZAH 19 X32VienBDWAIZAH19 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~This best pay well. One of us is above tedious fetching.~
END 

CHAIN X32VienJ bdwynan14 
~Of course. Besides, only an elf could see this done right.~
DO ~SetGlobal("BD_SDD200","GLOBAL",3)
SetGlobal("BD2100GL","GLOBAL",3)
StartCutSceneMode()
ClearAllActions()
StartCutScene("X3Vcutg")~
EXIT

// Training 

EXTEND_TOP BDDANINE 3 #4 
+ ~IsValidForPartyDialogue("X3Vien")~ + ~Something to suggest, Vienxay?~ DO ~SetGlobal("BD_DANINE_INTRO","BD3000",2)
IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2)
SetGlobal("bd_sdd301_danine_skill","global",2)~ EXTERN X32VienJ bdDanine3
END 

CHAIN X32VienJ bdDanine3
~You're hopeless like that. You need every move you can get. Get mean.~ 
EXTERN BDDanine 6

EXTEND_TOP BDGARROL 1 #4 
+ ~IsValidForPartyDialogue("X3Vien")~ + ~Something to suggest, Vienxay?~ EXTERN X32VienJ bdGarrol1
END 

CHAIN X32VienJ bdGarrol1 
~He'll never make it as a soldier. But I detect a smidgen of magical potential. Get him to learn with the magi.~ 
DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",1)
SetGlobal("bd_sdd301_garrold_skill","global",1)~
EXTERN BDGarrol 3

I_C_T BDHALAT 8 X32VienBDHALAT8 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~Please. He should be wary of *us*. Or at least me.~
END 

I_C_T BDSHAPUR 12 X32VienBDSHAPUR12
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~Must we care? I begrudgingly defer to you, <CHARNAME>, but I have no love of these creatures.~
END

I_C_T BDDELANC 49 X32VienBDDELANC49 
== X32VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN ~Gods, such a human thing to say.~
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
~I see an arrogant elf, an Ar'Tel'Quessir in their language. Her power would be useful to me.~
END
++ ~As you wish. I will forfeit Vienxay to you if I get the riddle wrong.~ DO ~SetGlobal("X32VienSacrifice","bd4500",1) SetGlobal("bd_thrix_sacrifice_companion","global",1)~ EXTERN BDTHRIX 116
+ ~OR(2) Global("X32VienRomanceActive","GLOBAL",1) Global("X32VienRomanceActive","GLOBAL",2)~ + ~You ask for too much. Vienxay cannot be yours.~ DO ~SetGlobal("X32_Saved_Vienxay","bd4500",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ EXTERN X32VienJ ThrixWager2
+ ~!Global("X32VienRomanceActive","GLOBAL",1) !Global("X32VienRomanceActive","GLOBAL",2)~ + ~You ask for too much, fiend. Vienxay's soul is worth too much for me to risk it. Choose another.~ DO ~SetGlobal("X32_Saved_Vienxay","bd4500",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ EXTERN X32VienJ ThrixWager2
++ ~It's a poor <PRO_MANWOMAN> indeed who'd sacrifice a friend in such a way. If I can't answer your riddle, you will take me, and let them go on their way. Agreed?~ EXTERN BDTHRIX 113
++ ~I'll not play your twisted game, devil. Stand aside, or pay the price.~ EXTERN BDTHRIX 12

CHAIN X32VienJ ThrixWager2
~You could hardly afford me even if you wanted me.~
== BDTHRIX ~I was quite looking forward to the power she could bring. Such a pity.~
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
~Yes. Yes. Yes! You and your magic are mine, elf.~
END
++ ~Sorry, Vienxay. I guess I couldn't get it right.~ DO ~SetGlobal("X32_thrix_mark_Vienxay","global",1)~ EXTERN X32VienJ ThrixWager5
++ ~That's not happening, fiend!~ EXTERN BDTHRIX 10

CHAIN X32VienJ ThrixWager5
~Ugh! I trusted you!~
DO ~SetGlobal("bd_thrix_plot","global",11)~ EXTERN BDTHRIX 140

// Imoen

EXTEND_BOTTOM BDIMOEN 104
+ ~Global("X3Vien_SoDparty_epilogue","GLOBAL",1)~ + ~I'm not surprised Vienxay is absent.~ EXTERN BDIMOEN bdimoen1
END

EXTEND_BOTTOM BDIMOEN 109
+ ~Global("X3Vien_SoDparty_epilogue","GLOBAL",1)~ + ~I'm not surprised Vienxay is absent.~ EXTERN BDIMOEN bdimoen1
END

CHAIN BDIMOEN bdimoen1
~I thought about her, but after she hurled an insult at my race I stopped bothering.~
EXTERN BDIMOEN 119

APPEND X32VienJ 

IF ~IsGabber(Player1) AreaCheck("bd4300")GlobalGT("bd_plot","global",585)~ THEN BEGIN SoD.BattleOver 
SAY ~I better be appreciated for all the sacrifices I've done for these people. But I have a feeling they will only be appreciating you.~
IF ~~ EXIT 
END

IF ~IsGabber(Player1) OR(2) AreaCheck("BD0120")AreaCheck("BD0130")~ THEN BEGIN Vien.PIDCrypt1  
SAY  ~I am tired of crypts, dungeons, and the places we've gone into. We're parting after this, and I am finding the most luscious inn and luxurious bath and sticking myself in it when we're done here.~
IF ~~ EXIT 
END 


IF ~IsGabber(Player1) CombatCounter(0) !Detect([ENEMY])~ THEN BEGIN Vienxay.PID 
SAY  ~*Sigh* How may I assist you?~ [VienRar2]
 + ~HPPercentGT(Myself,74)RandomNum(5,1)~ + ~How are you doing?~ + Vienxay.PHowAreYou1 // ~How are you doing?~
 + ~HPPercentGT(Myself,74)RandomNum(5,2)~ + ~How are you doing?~ + Vienxay.PHowAreYou2 // ~How are you doing?~
 + ~HPPercentGT(Myself,74)RandomNum(5,3)~ + ~How are you doing?~ + Vienxay.PHowAreYou3 // ~How are you doing?~
 +~HPPercentLT(Myself,75)HPPercentGT(Myself,49)RandomNum(2,1)~+ ~How are you doing?~ + Vienxay.PHowAreYouInjured // ~How are you doing?~ //(Under 75%, Over 50%)
 +~HPPercentLT(Myself,50)~+ ~How are you doing?~ + Vienxay.PHowAreYouHurt // ~How are you doing?~ //(Under 50%)
 +~HPPercentGT(Myself,74)RandomNum(5,4)~+ ~How are you doing?~ + Vienxay.PHowAreYou4 // ~How are you doing?~
 +~HPPercentGT(Myself,74)RandomNum(5,5)~+ ~How are you doing?~ + Vienxay.PHowAreYou5 // ~How are you doing?~
 +~HPPercentLT(Myself,75)HPPercentGT(Myself,49)RandomNum(2,2)~+ ~How are you doing?~ + Vienxay.PHowAreYouInjured2  // ~How are you doing?~
 ++ ~Let's stop and chat for a bit.~ + Vienxay.PTalk // ~Let's stop and chat for a bit.~ 
 ++ ~I need nothing at the moment.~ EXIT // ~I need nothing at the moment.~ 
 END 
 
 IF ~~ Vienxay.PHowAreYou1
SAY ~I am tired of being around less brilliant minds. But I am enduring.~ 
IF ~~ EXIT  
END 

IF ~~ Vienxay.PHowAreYou2
SAY ~I feel slave-driven. Do you ever consider letting me give all of the orders?~ 
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYou3
SAY ~Unstimulated. Give me something more complex to do.~ 
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYouInjured
SAY ~What does it look like? I have an injury. Fix it.~ 
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYouHurt
SAY ~I am in pain. Is it not obvious?!~ 
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYou4
SAY ~I am enduring for now.~
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYou5
SAY ~I suppose the day has been satisfactory.~
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYouInjured2
SAY ~Stop asking such stupid questions. I'm injured and need healing, now!~
IF ~~ EXIT  
END

IF ~~ Vienxay.PTalk 
SAY  ~Yes?~ [VienCom1]
/*Options will  vary as the game goes on.*/ 
// Companion Thoughts 
+ ~NumInPartyAliveGT(2)~ + ~What do you think of our companions?~  + Vienxay.PCompanionThoughts // ~What do you think of our companions?~ 
+ ~Race(Player1,Elf)~ + ~What do you think of me?~ + Em.Me1 // ~What do you think of me?~
+ ~!Race(Player1,Elf)~ + ~What do you think of me?~ + Em.Me2 // ~What do you think of me?~
// Dialogue From Talk Expansions. These fire once, and there will be 3 only: A talk of things while they were gone (7/8), something friendly, and something flirty. 
+~Global("X32VienxayCell","GLOBAL",0)~+ ~I'd like to know more about how you ended up in a cell.~ DO ~SetGlobal("X32VienxayCell","GLOBAL",1)~  + Vienxay.PCell // ~I'd like to know more about how you ended up in a cell.~
+~Global("X32VienxayShadowWeave","GLOBAL",0)Global("X32VQuestTalk","GLOBAL",9)~+ ~I'd like to talk about the Shadow Weave.~ DO ~SetGlobal("X32VienxayShadowWeave","GLOBAL",1)~ + Vienxay.PSWYes
+~Global("X32VienxayShadowWeave","GLOBAL",0)Global("X32VQuestTalk","GLOBAL",10)~+ ~I'd like to talk about the Shadow Weave.~ DO ~SetGlobal("X32VienxayShadowWeave","GLOBAL",1)~ + Vienxay.PSWNo
+~Global("X3VienPHaughtyTopic","GLOBAL",0)~+ ~Are you always so haughty?~  DO ~SetGlobal("X3VienPHaughtyTopic","GLOBAL",1)~ + Vienxay.PHaughty // ~Are you always so haughty?~ 
+~RandomNum(3,1)~+ ~Can you give me any tips about Stealth?~ + Vienxay.PStealth1 // ~Can you give me any tips about Stealth?~
+~RandomNum(3,2)~+ ~Can you give me any tips about Stealth?~ + Vienxay.PStealth2
+~RandomNum(3,3)~+ ~Can you give me any tips about Stealth?~ + Vienxay.PStealth3
+~Global("X32VQuestTalk","GLOBAL",9)Global("X3VienWandTopic","GLOBAL",0)~+ ~Could you teach me the Shadow weave?~ DO ~SetGlobal("X3VienWandTopic","GLOBAL",1)~ + Vienxay.PWand // ~Could you teach me the Shadow weave?~
END 

IF ~~ Vienxay.PCompanionThoughts 
SAY ~Who?~ // ~Which one, now?~ 
// BG1

+~InParty("Dynaheir")~+ ~Dynaheir.~ + Em.Dynaheir
+~InParty("Khalid")~+ ~Khalid.~ + Em.Khalid 
+~InParty("Minsc")~+ ~Minsc.~ + Em.Minsc 
+~InParty("Jaheria")~+ ~Jaheria.~ + Em.Jaheria
+~InParty("Safana")~+ ~Safana.~ + Em.Safana 
+~InParty("Edwin")~+ ~Edwin.~ + Em.Edwin
+~InParty("Viconia")~+ ~Viconia.~ + Em.Viconia 
    
// EE 
+~InParty("Baeloth")~+ ~Baeloth.~ + Em.Baeloth 
+~InParty("Dorn")~+ ~Dorn.~ + Em.Dorn
+~InParty("Neera")~+ ~Neera.~ + Em.Neera 
+~InParty("Rasaad")~+ ~Rasaad.~ + Em.Rasaad 
// SoD 
+~InParty("Corwin")~+ ~Corwin.~ + Em.Corwin 
+~InParty("Glint")~+ ~Glint.~ + Em.Glint 
+~InParty("Mkhiin")~+ ~Viconia.~ + Em.Mkhiin 
+~InParty("Voghlin")~+ ~Voghlin.~ + Em.Voghlin 
// CrossMod Choices 
+~InParty("X3Vien")~+ ~Kale.~ + Em.Kale
+~InParty("X3Rec")~+ ~Recorder.~ + Em.Recorder
+~InParty("X3mily")~+ ~Recorder.~ + Em.Emily
+~InParty("X3Helga")~+ ~Recorder.~ + Em.Helga
+~InParty("c0aura")~+ ~Aura.~ + Em.Aura 
+~InParty("c0Drake")~+ ~Drake.~ + Em.Drake
+~InParty("#Ishy")~+ ~Ishlilka.~ + Em.Ishy 
+~InParty("C0Sirene")~+ ~Sirene.~ + Em.Sirene 
+ ~InParty("L#1DVER")~ + ~Verr'sza.~ + Em.Verrsza 
+~!Global("X32VienRomanceActive","GLOBAL",2)~+ ~Myself~ + Em.Me1 
+~!Global("X32VienRomanceActive","GLOBAL",2)!Race(Player1,Elf)~+ ~Myself~ + Em.Me2
+~Global("X32VienRomanceActive","GLOBAL",2)~+ ~Myself~ + Em.Me3 
++ ~Nevermind~ EXIT  
END 

IF ~~ Em.Dynaheir 
SAY ~Compotent for a mage. Even if she's human.~
IF ~~ EXIT 
END 

IF ~~ Em.Khalid 
SAY ~I'm not fond of half-bloods. But he is surprisingly competent, despite his meek demeanor.~
IF ~~ EXIT 
END 

IF ~~ Em.Jaheria
SAY ~Gods. I have no love of her at all. Could you get more pleasant company for a change?~
IF ~~ EXIT 
END 

IF ~~ Em.Edwin
SAY ~He thinks he is the best mage in this party. Do correct him and inform him of my superiority.~
IF ~~ EXIT 
END 

IF ~~ Em.Minsc 
SAY ~A mad idiot who is reckless and dangerous. Plus he talks to that...thing. Why did you bring him along at all?~
IF ~~ EXIT 
END 

IF ~~ Em.Safana 
SAY ~She thinks far too much of herself. *I* am the most beautiful among us.~
IF ~~ EXIT 
END 

IF ~~ Em.Viconia
SAY ~I typically despise drow, but she is an exception. Be wary of her however, there's no telling what secrets she keeps.~
IF ~~ EXIT 
END 

IF ~~ Em.Baeloth
SAY ~Must we travel with drow? It is humiliating, and his way with speech irritates me.~
IF ~~ EXIT 
END 

IF ~~ Em.Neera
SAY ~She's a childish mutt that plays with power she hardly understands. A bad accident waiting to happen.~
IF ~~ EXIT 
END 

IF ~~ Em.Dorn
SAY ~He is powerful, that is indisputable. But I wonder if his loyalty to his patron will come into conflict with your own goals.~
IF ~~ EXIT 
END 

IF ~~ Em.Rasaad
SAY ~He is just another idealist to me. But he does seem more pleasant than most humans.~
IF ~~ EXIT 
END 

IF ~~ Em.Corwin
SAY ~If you think she is a good archer, or a person worth being interested in, you've never seen the archers of Evermeet.~
IF ~~ EXIT 
END 

IF ~~ Em.Mkhiin
SAY ~You invited a goblin into our party, and you are dumb enough to think I will like it? Gods no.~
IF ~~ EXIT 
END 

IF ~~ Em.Voghlin
SAY ~He is useless to us. If we were on a quest of merriment, I'd have a different opinion.~
IF ~~ EXIT 
END 

IF ~~ Em.Glint
SAY ~He's a gnome. Am I supposed to have a more elaborate opinion then that?~
IF ~~ EXIT 
END 

IF ~~ Em.Kale
SAY ~A useful meat shield, for a halfling. Otherwise I'm not fond of him.~
IF ~~ EXIT 
END 

IF ~~ Em.Emily
SAY ~I don't like mutts. And she shares blood that is like our enemy. Can she even be trusted?~
IF ~~ EXIT 
END 

IF ~~ Em.Helga
SAY ~If she yaps about battle one more time...a dwarf can be so irksome.~
IF ~~ EXIT 
END 

IF ~~ Em.Recorder
SAY ~I suppose it is useful to have someone to record what you do around. If only she wasn't so righteous.~
IF ~~ EXIT 
END 

IF ~~ Em.Aura
SAY ~Artifice is inferior to magic, and she's got a hideously large nose. You must have taken her out of pity.~
IF ~~ EXIT 
END 

IF ~~ Em.Sirene 
SAY ~She'd be more useful if she embraced her power and stopped with the ridiculous idealism approach.~
IF ~~ EXIT 
END 

IF ~~ Em.Verrsza 
SAY ~You bring a being of great power on your adventures. Our success is even more assured.~
IF ~~ EXIT 
END 

IF ~~ Em.Ishy
SAY ~She is a very whiny spoiled orc. But a useful meat shield, like most of them are.~
IF ~~ EXIT 
END 

IF ~~ Em.Drake
SAY ~He's...different than what I would expect of a human. But as likable as the rest, which is only so much.~
IF ~~ EXIT 
END 
 
IF ~~ Em.Me1 
SAY ~Yourself? It is fine to travel with an elf. I've run into too few of my kind since my banishment.~ 
IF ~~ EXIT 
END 

IF ~~ Em.Me2 
SAY ~You are tolerable, even if you aren't an elf. That is the most I will give you.~ 
IF ~~ EXIT 
END 

IF ~~ Em.Me3
SAY ~I'll admit it. I'm beginning to quite like you.~ 
IF ~~ EXIT 
END 

IF ~~ Vienxay.PHaughty
SAY ~Why am I always so Haughty? What kind of question is this?~
= ~I act as I should. I am a noble, thus better than most. I am an elf, thus better than all other races. I should be asking you why you aren't treating me with more reverence.~
++ ~It's starting to grow on me.~ + Vienxay.PTGrow // ~It's starting to grow on me.~
++ ~Why can't you be a normal elf?~ + Vienxay.PTElf // ~Why can't you be a normal elf?~
++ ~You are not my superior. Don't forget who is in charge, here.~ + Vienxay.PTCharge // ~You are not my superior. Don't forget who is in charge, here.~
++ ~Let's talk about something else.~ + Vienxay.PTalk // ~Let's talk about something else.~ 
++ ~Let's keep moving.~ EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTGrow
SAY ~Truly? The feeling is somewhat mutual, I suppose.~
++ ~Let's talk about something else.~  + Vienxay.PTalk // ~Let's talk about something else.~ 
++ ~Let's keep moving.~ EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTElf
SAY ~Please, a normal elf? I am also a noble elf, a mage, and gifted with shadow magic. I am better than a normal elf.~
++ ~Let's talk about something else.~  + Vienxay.PTalk // ~Let's talk about something else.~ 
++ ~Let's keep moving.~ EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTCharge
SAY ~You fret needlessly. There will be no usurpation of your leadership. Although I would be better at it.~
++ ~Let's talk about something else.~  + Vienxay.PTalk // ~Let's talk about something else.~ 
++ ~Let's keep moving.~ EXIT // ~Let's keep moving.~
END 

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
++ ~Let's talk about something else.~  + Vienxay.PTalk // ~Let's talk about something else.~ 
++ ~Let's keep moving.~ EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTeachShadow
SAY ~You already know as much as I do. I may do the technique more flawlessly, but I am sure you can improve on your own.~
++ ~Let's talk about something else.~  + Vienxay.PTalk // ~Let's talk about something else.~ 
++ ~Let's keep moving.~ EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTeachNo1
SAY ~My talent in shadows is innate and guided by my former mentor. Yours is not, and I cannot help you.~
++ ~Let's talk about something else.~  + Vienxay.PTalk // ~Let's talk about something else.~ 
++ ~Let's keep moving.~ EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTeachNo2 
SAY ~You're not like I. There is nothing I can teach you.~
++ ~Let's talk about something else.~  + Vienxay.PTalk // ~Let's talk about something else.~ 
++ ~Let's keep moving.~ EXIT // ~Let's keep moving.~
END 


IF ~~ Vienxay.PStealth1
SAY ~You want advice? Stop talking to me and be quiet.~
IF ~~ EXIT 
END

IF ~~ Vienxay.PStealth2
SAY ~Magic can enhance stealth beyond mundane means. But lacking that, quality equipment can make up for deficiencies.~
IF ~~ EXIT 
END

IF ~~ Vienxay.PStealth3
SAY ~If you had any hope in the art, you wouldn't be asking me.~
IF ~~ EXIT 
END

IF ~~ Vienxay.PCell
SAY ~Does it matter?~
++ ~I'm curious, what happened?~ + VienxayPCellTell
++ ~Yes, it does. Tell me.~ + VienxayPCellTell
++ ~If you don't want to tell me, fine.~ + Vienxay.PCellNo
END 

IF ~~ Vienxay.PCellNo 
SAY ~I don't, but I suppose I will for your curiosity this time.~
IF ~~ + VienxayPCellTell
END 

IF ~~ VienxayPCellTell
SAY ~An idiot peasant made a disparaging remark about my kind while I was stuck cramped in an inn due to the crisis. He poked me with a finger. So I gave him a piece of my magic.~
++ ~That was quite mature.~ + VienxayPCellMature
++ ~I suppose might makes right.~ + VienxayPCellMight
+~Alignment("X3Vien",NEUTRAL_EVIL)~+ ~That was wrong of you.~ + VienxayPCellJudge1
+~Alignment("X3Vien",NEUTRAL)~+ ~That was wrong of you.~ + VienxayPCellJudge2
END 

IF ~~ VienxayPCellMature
SAY ~Please, it's called self-defense.~
IF ~Alignment("X3Vien",NEUTRAL_EVIL)~ + VienxayPCellJudge1 
IF ~Alignment("X3Vien",NEUTRAL)~ + VienxayPCellJudge2 
END 

IF ~~ VienxayPCellMight 
SAY ~You would think inferiors would understand that, and leave their betters be, but alas.~
IF ~Alignment("X3Vien",NEUTRAL_EVIL)~ + VienxayPCellJudge1 
IF ~Alignment("X3Vien",NEUTRAL)~ + VienxayPCellJudge2 
END 

IF ~~ VienxayPCellJudge1 
SAY ~Power keeps you safe. Intimidation is necessary for the lesser, it is all they know to fear.~
= ~Regardless, the guards heard the peasant screaming, and some others unintentionally affected, and I was thrown in a cell until you came along.~
++ ~It was not the best way to behave.~ + VienxayPCellBehave1
++ ~You're free now, in my company.~ + VienxayPCellFree 
END 

IF ~~ VienxayPCellJudge2 
SAY ~Perhaps...it was not the best way to display such power responsibly. I should have kept my head high, not resorted to violence.~
= ~Regardless, the guards heard the peasant screaming, and some others unintentionally affected, and I was thrown in a cell until you came along.~
++ ~It's good you understand it was not the best way of acting.~ + VienxayPCellBehave2
++ ~Accountable is very unlike you.~ + VienxayPAccountable
END 

IF ~~ VienxayPCellBehave1 
SAY ~I don't care what you think. It reminded them not to trifle with me.~
IF ~~ + VienxayPCellGo 
END 

IF ~~ VienxayPCellBehave2 
SAY ~Yes, well, I don't care about your opinion. I'm not seeing it for your benefit.~
IF ~~ + VienxayPCellGo 
END 

IF ~~ VienxayPCellFree 
SAY ~For now. I hardly expect such luxury to remain the same.~
IF ~~ + VienxayPCellGo 
END 

IF ~~ VienxayPAccountable 
SAY ~Please. I have been accountable before. I am just...more understanding.~
IF ~~ + VienxayPCellGo 
END 

IF ~~ VienxayPCellGo 
SAY ~Now, let's stop languishing our time and do something.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PSWYes 
SAY ~What about it?~
++ ~Could you draw more magic from it than you do now?~ + Vienxay.PSWYes1
++ ~Is it like normal magic?~ + Vienxay.PSWYes2 
++ ~Nothing. Let's talk about something else.~ + Vienxay.PTalk
++ ~Nothing. Let's continue on.~ EXIT 
END 

IF ~~ Vienxay.PSWYes1 
SAY ~I could. But I won't, for now. There is little time for the research and understanding. Tomes do not exactly lay waiting in libraries for it to be learned.~
++ ~Is it like normal magic?~ + Vienxay.PSWYes2 
++ ~Let's talk about something else.~ + Vienxay.PTalk
++ ~Let's continue on.~ EXIT 
END 

IF ~~ Vienxay.PSWYes2 
SAY ~In some ways, and in some ways it is not.~
= ~Magic to drain or weaken targets is the shadow weave's specialty. My Shadowbolt is meant to chill and weaken the energy of life, for example.~
= ~But altering or evoking energy is less effective with the shadow weave.~
= ~Beyond that, much is a mystery, even to me, and perhaps best if little is ever shared.~
++ ~Could you draw more magic from it than you do now?~ + Vienxay.PSWYes1
++ ~Let's talk about something else.~ + Vienxay.PTalk
++ ~Let's continue on.~ EXIT 
END 

IF ~~ Vienxay.PSWNo
SAY ~You made your wishes for it not to be used. There is little else that should be talked about.~
+~Alignment("X3Vien",NEUTRAL)~+ ~And are you okay with that?~ + Vienxay.PSWNo1 
+~Alignment("X3Vien",NEUTRAL_EVIL)~+ ~And are you okay with that?~ + Vienxay.PSWNo2 
++ ~I suppose. Let's talk about something else.~ + Vienxay.PTalk
++ ~Let's continue on, then.~ EXIT 
END 

IF ~~ Vienxay.PSWNo1 
SAY ~I am...suprised you care. I suppose...I am okay with it. I do not need to resort to it when I have...friends like you.~
= ~Thank you for asking. It means a lot. Though don't expect me to be nice to you *all* the time now, either.~ 
++ ~I'd hope not. You wouldn't be Vienxay without a bit of sass.~ + Vienxay.PSWNo5 
++ ~Let's talk about something else.~ + Vienxay.PTalk
++ ~Let's continue on.~ EXIT 
END 

IF ~~ Vienxay.PSWNo2 
SAY ~I am suprised you care. I suppose...I have made my peace. It brought my downfall. Why go back to it after all?~
= ~Thank you for asking, I suppose. Though I still occasionally question your motives, you seem to know what you are doing.~
++ ~I'd hope so.~ + Vienxay.PSWNo3 
++ ~Of course I do.~ + Vienxay.PSWNo4 
++ ~Let's talk about something else.~ + Vienxay.PTalk
++ ~Let's continue on.~ EXIT 
END 

IF ~~ Vienxay.PSWNo3 
SAY ~We would all hope so.~
++ ~Let's talk about something else.~ + Vienxay.PTalk
++ ~Let's continue on.~ EXIT 
END 

IF ~~ Vienxay.PSWNo4 
SAY ~At least you're confident, then.~
++ ~Let's talk about something else.~ + Vienxay.PTalk
++ ~Let's continue on.~ EXIT 
END 

IF ~~ Vienxay.PSWNo5 
SAY ~Well, obviously! Ugh, I'm getting flustered now.~
++ ~Let's talk about something else.~ + Vienxay.PTalk
++ ~Let's continue on.~ EXIT 
END 


/*Append End*/
END


 
