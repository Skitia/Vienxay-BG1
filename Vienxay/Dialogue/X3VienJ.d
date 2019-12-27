BEGIN X3VienJ
// Baeloth Conflict 

IF ~Global("X3VienBaelothConflict","LOCALS",1)~ BaelothConflict 
SAY @577 
+~CheckStatGT(Player1,15,STR)~+ @578 +  BA.B 
+~CheckStatLT(Player1,16,STR)~+ @578 +  BA.B 
+~CheckStatLT(Player1,16,STR)~+ @578 +  BA.A 
+~CheckStatLT(Player1,16,STR)~+ @578 +  BA.A 
+~InParty("Viconia")~+ @579 + BA.D
++ @580 + BA.C // ~I didn't think of the ramifications. Baeloth, please go.~
+~CheckStatGT(Player1,15,CHR)~+ @581 + BA.B // ~Look, we need everyone we can get. You've seen what we're up against.~
+~RandomNum(3,1)CheckStatLT(Player1,16,CHR)~+ @581 + BA.B // ~Look, we need everyone we can get. You've seen what we're up against.~
+~RandomNum(3,2)CheckStatLT(Player1,16,CHR)~+ @581 + BA.A // ~Look, we need everyone we can get. You've seen what we're up against.~
+~RandomNum(3,3)CheckStatLT(Player1,16,CHR)~+ @581 + BA.A // ~Look, we need everyone we can get. You've seen what we're up against.~
END 

IF ~~ BA.A 
SAY @586 // ~My power is capable enough that you don't have to resort to the worst offenses. Make your decision, him or me.~
++ @587 + BA.E // ~Then I choose Baeloth.~
++ @588 + BA.C // ~Then I will choose you.~
END 

IF ~~ BA.B 
SAY @589 // ~Ugh! Fine. I'll tolerate him, for now.~
IF ~~ DO ~SetGlobal("X3VienBaelothConflict","LOCALS",2)~ EXIT
END 

IF ~~ BA.D
SAY @590 // ~You speak as if two makes it easier to tolerate one. I am not inclined with that at all.~ 
+~CheckStatGT(Player1,15,STR)~+ @578 +  BA.B 
+~CheckStatLT(Player1,16,STR)~+ @578 +  BA.B 
+~CheckStatLT(Player1,16,STR)~+ @578 +  BA.A 
+~CheckStatLT(Player1,16,STR)~+ @578 +  BA.A
++ @582 + BA.C
+~CheckStatGT(Player1,15,CHR)~+ @581 + BA.B
+~RandomNum(3,1)CheckStatLT(Player1,16,CHR)~+ @581 + BA.B
+~RandomNum(3,2)CheckStatLT(Player1,16,CHR)~+ @581 + BA.A
+~RandomNum(3,3)CheckStatLT(Player1,16,CHR)~+ @581 + BA.A
END 

IF ~~ BA.E 
SAY @583 
IF ~~ DO ~SetGlobal("X32VienBaelothConflict","LOCALS",-2)
SetGlobal("X3VienKickedOut","GLOBAL",1)
SetDialog("X3VienP")
EscapeAreaMove("AR2300",4012,2570,S)LeaveParty()~
EXIT 
END 




/* Talk 1. 
 For now we are going to use Bran's T1 style. I may change this up or keep it as I go. For testing purposes the first is largely left in tact in its shape. */
IF ~Global("X3VienTalk","GLOBAL",2)~ t1
SAY @0 /*~My feet are killing me. And the food we have is awful. I miss the cuisine back home.~ */
++ @1 /* ~You complain a lot, Vienxay. Why not just go home?~ */ + t1.1
++ @2 /* ~You're welcome to cook.~ */ + t1.2
++ @3 /* ~We can stop for a moment. We've been moving quite a bit.~ */ + t1.3
++ @4 /* ~Stop groveling and keep moving.~ */ + t.0
END

IF ~~ t.0
SAY @5 // ~Fine, whatever.~
IF ~~ DO ~IncrementGlobal("X3VienTalk","GLOBAL",1) RealSetGlobalTimer("X3VienTimer","GLOBAL",3400)~ EXIT //This timer bit is unnecessary until we add more talks.
END

/* Branches t1.1, t1.2 and t1.3 are "looping branches" - they create different answers for Branwen, but they would still loop back to the same place, t1.4. It's efficient: you don't have to create big separate branches. */

IF ~~ t1.1
SAY @6 // ~I'm exiled, obviously. ~
++ @516 + t1.4 // ~How did you get exiled, exactly?~
++ @518 + t1.4A // ~I'm not surprised~
++ @4 /* ~Stop groveling and keep moving.~ */ + t.0
END

IF ~~ t1.2
SAY @9 // ~Please that is what servants are for. But I suppose it is hard to hire a good cook and a good warrior, and I've not had a succulent meal since that witch destroyed my life.~
++ @516 + t1.4 // ~How did you get exiled, exactly?~
++ @517 + t1.4B // ~Adventurers don't get cooks and the luxury of nobility on the road.~
++ @4 /* ~Stop groveling and keep moving.~ */ + t.0
END

IF ~~ t1.3
SAY @10 // ~Really? Well. Thank you. It is not all the fault of your awful pace. I have been chasing this witch for sometime now, with little rest.~
++ @516 + t1.4 // ~How did you get exiled, exactly?~
++ @518 + t1.4A // ~I'm not surprised~
IF ~~ + t1.4
END

IF ~~ t1.4A 
SAY @519 // ~Not surprised? Do you expect me to suffer? No matter. You should hear the story before you judge.~
IF ~~ + t1.4 
END 

IF ~~ t1.4B 
SAY @520 // ~Yes, I know that. Obviously. Ugh. Let me tell you how I got into this awful situation anyway.~
IF ~~ + t1.4 
END 


IF ~~ t1.4
SAY @11 // ~My master, Lina, befriended me with promises of ascending higher into the court, learning as her apprentice, gaining power and prestige in the process. Things that should have rung my suspicion, but did not.~
= @12 // ~My parents had high expectations for me, and I had two little sisters to be an example for. While my family thought it best to decline her offers, I accepted and worked for her directly.~
= @13 // ~I should have stopped when she started teaching to me about the shadow weave. But I kept at it, while doing her odd jobs and tasks for experiments.~
= @14 // ~Then one day I discovered too late that one of her "jobs" was moving dead elves she was using for experiments. When I was about to betray her with this knowledge, she betrayed me first, pinning their deaths on me.~

++ @16 /* ~Serves you right. Sounds like she was a Sharran.~ */ + t1.6
++ @17 /*~I am sorry for what happened.~ */ + t1.7
++ @18 /* ~This master of yours did a terrible thing to you.~ */ + t1.7
END

IF ~~ t1.5
SAY @19 
IF ~~ + t1.8
END

IF ~~ t1.6
SAY @20 // ~I don't expect you to understand why I was pulled in, or why I was blind to their loyalties. You wouldn't understand the pressure of the first born of nobility.~
IF ~~ + t1.8
END

IF ~~ t1.7
SAY @21 // ~Your sympathy is touching. Kinder than what I received from Evermeet. No matter.~
IF ~~ + t1.8
END

IF ~~ t1.8
SAY @22 // ~And what of you? I understand you lost a family member of your own?~
++ @23 /* ~He wasn't my father, but Gorion was as good as any.~ */ + t1.9
++ @24 /* ~I did. And I intend to return the favor.~ */ + t1.9
++ @25 /* ~We weren't close.~ */ + t1.9
++ @26 /* ~None of  your business.~ */ + t.0
END

IF ~~ t1.9
SAY @27 // ~I hope you get your chance at retribution, <CHARNAME>~
IF ~~ DO ~IncrementGlobal("X3VienTalk","GLOBAL",1) RealSetGlobalTimer("X3VienTimer","GLOBAL",3400)~ EXIT
END

/* We need IncrementGlobal() and RealSetGlobalTimer() in every dialogue. The last state is the best place, IF the dialogue has one ending, otherwise you'll have to duplicate. */

// Talk 2: Vienxay brings up Evermeet again.

IF ~Global("X3VienTalk","GLOBAL",4)~ t2
SAY @33 // ~If the people filtered who could even come into this land, there wouldn't be all of these peasants causing a ruckus. Evermeet had it right.~
++ @34 + t2.1 // ~Vienxay, it is not just the lower class, and not all of them are bad.~
++ @35 + t2.2 // ~Whining again, I see.~
++ @36 + t2.3 // And what would you even propose?~
++ @37 + t2.1 // ~This isn't Evermeet. Welcome to the rest of the world.~
END

IF ~~ t2.1
SAY @38 // ~Of course not, I obviously know that. Evermeet was one of the most safe places however because we enforced who could even enter.~
IF ~~ + t2.3
END

IF ~~ t2.2 
SAY @39 // ~Why not? I don't mind the eviscerating of degenerates, but I'd get less blood on my clothes if they weren't even here.~
IF ~~ + t2.3
END

IF ~~ t2.3
SAY @40 // ~A simple wall to keep them out, many are foreigners, you know. Like myself, except with lowly, simple minds.~
= @41 // ~I doubt the mages around are capable of the magic of Evermeet, keeping all but elves away from our homeland.~
++ @42 + T2.3E // ~What was Evermeet like?~
++ @43 + T2.3D // ~So they just closed themselves off from the world?~
++ @44 + T2.3F // ~That's not possible here. There's benefits to being open.~
++ @45 + T2.3Z // ~I think I've listened to all I can handle.~
END
// This starts a block where each dialogue can be picked once, for realism purposes. 

IF ~~ T2.3E
SAY @46 // ~What was Evermeet not like? Do be specific, what do you want to know exactly?~
+~Global("X3VienEveLand","GLOBAL",0)~+ @67 DO ~IncrementGlobal("X3VienEveLand","GLOBAL",1)~ + T2.E1  // ~What was the land like?~ 
+~Global("X3VienEveCit","GLOBAL",0)~+ @47 DO ~IncrementGlobal("X3VienEveCit","GLOBAL",1)~ + T2.E2  // ~What were the cities like?~ 
+~Global("X3VienEveExcept","GLOBAL",0)~+ @48 DO ~IncrementGlobal("X3VienEveExcept","GLOBAL",1)~ + T2.E3 // ~Were there any exceptions to the elves only policy?~
+~Global("X3VienEveGov","GLOBAL",0)~+ @49 DO ~IncrementGlobal("X3VienEveGov","GLOBAL",1)~ + T2.E4  // ~What sort of government was there?~
++ @50 + T2.3Z // ~Maybe another time.~
END

IF ~~ T2.3D
SAY @51 // ~People build houses, and close themselves off for security. Please. It's hardly a foreign concept, and it's quite sensible.~
++ @52 + T2.E3 // ~Some thieves break into houses.~
++ @42 + T2.3E // ~What was Evermeet like?~
++ @45 + T2.3Z // ~I think I've listened to all I can handle.~
++ @54 + T2.3Z // ~We can debate more another time.~
END

IF ~~ T2.3F
SAY @53 // ~I've seen enough of these "benefits", thank you.~
++ @42 + T2.3E // ~What was Evermeet like?~
++ @45 + T2.3Z // ~I think I've listened to all I can handle.~
++ @54 + T2.3Z // ~We can debate more another time.~
END

IF ~~ T2.3Z
SAY @55 // ~Back then to our business. I hope you consider hiring a carriage, it'd be faster and less painful on my feet.~
IF ~~ DO ~IncrementGlobal("X3VienTalk","GLOBAL",1) RealSetGlobalTimer("X3VienTimer","GLOBAL",3400)~ EXIT
END

IF ~~ T2.E1
SAY @56 // ~It's an island full of strong pines in the north with rugged hills and mountains, and lush oak forests to the east. Civilization and nature in harmony; as it should.~
= @57 // ~In the plains, you would see an assortment of beautiful horses living on the land, nothing like the lowly quality you have locally. Giant Eagles watched from the trees.~
= @58 // ~No Orc or beast would taint our land like this land has.~
+~Global("X3VienEveCit","GLOBAL",0)~+ @47 DO ~IncrementGlobal("X3VienEveCit","GLOBAL",1)~ + T2.E2  // ~What were the cities like?~ 
+~Global("X3VienEveExcept","GLOBAL",0)~+ @48 DO ~IncrementGlobal("X3VienEveExcept","GLOBAL",1)~ + T2.E3 // ~Were there any exceptions to the elves only policy?~
+~Global("X3VienEveGov","GLOBAL",0)~+ @49 DO ~IncrementGlobal("X3VienEveGov","GLOBAL",1)~ + T2.E4  // ~What sort of government was there?~
++ @59 + T2.ET // ~Thank you, that was enlightening.~
END

IF ~~ T2.E2
SAY @60 // ~Gorgeous, of course. There was no starving peasants, our people were proud and worked hard, not like the lowly local folk here.~
= @61 // ~The towers would rise into the sky, and the walk ways would wrap around trees and nests, leaving them undisturbed.~
= @62 // ~The architecture is second to none. Nothing was made without mind for beauty.~
+~Global("X3VienEveLand","GLOBAL",0)~+ @67 DO ~IncrementGlobal("X3VienEveLand","GLOBAL",1)~ + T2.E1  // ~What was the land like?~ 
+~Global("X3VienEveExcept","GLOBAL",0)~+ @48 DO ~IncrementGlobal("X3VienEveExcept","GLOBAL",1)~ + T2.E3 // ~Were there any exceptions to the elves only policy?~
+~Global("X3VienEveGov","GLOBAL",0)~+ @49 DO ~IncrementGlobal("X3VienEveGov","GLOBAL",1)~ + T2.E4  // ~What sort of government was there?~
++ @59 + T2.ET // ~Thank you, that was enlightening.~
END

IF ~~ T2.E3
SAY @63 // ~They could try, they would fail. Raiders tried. Drow, Pirates, Red Wizards. They all failed. There is no fleet in Toril as fierce or strong as Evermeet's, no one could launch a succesful invasion against us.~
+~Global("X3VienEveLand","GLOBAL",0)~+ @67 DO ~IncrementGlobal("X3VienEveLand","GLOBAL",1)~ + T2.E1  // ~What was the land like?~ 
+~Global("X3VienEveCit","GLOBAL",0)~+ @47 DO ~IncrementGlobal("X3VienEveCit","GLOBAL",1)~ + T2.E2  // ~What were the cities like?~ 
+~Global("X3VienEveGov","GLOBAL",0)~+ @49 DO ~IncrementGlobal("X3VienEveGov","GLOBAL",1)~ + T2.E4  // ~What sort of government was there?~
++ @45 + T2.3Z // ~I think I've listened to all I can handle.~
++ @59 + T2.ET // ~Thank you, that was enlightening.~
END

IF ~~ T2.E4
SAY @64 // ~Queen Moonflower was our monarch. Of course, my family was on their way to having some influence on her council...bar certain setbacks happening, we could have had some influence in Evermeet's governing.~
= @65 // ~The Queen is a force to be respected, and far more reasonable than the typical human leadership you've locally, with your fat mayors and foolish lords.~
+~Global("X3VienEveLand","GLOBAL",0)~+ @67 DO ~IncrementGlobal("X3VienEveLand","GLOBAL",1)~ + T2.E1  // ~What was the land like?~ 
+~Global("X3VienEveCit","GLOBAL",0)~+ @47 DO ~IncrementGlobal("X3VienEveCit","GLOBAL",1)~ + T2.E2  // ~What were the cities like?~ 
+~Global("X3VienEveExcept","GLOBAL",0)~+ @48 DO ~IncrementGlobal("X3VienEveExcept","GLOBAL",1)~ + T2.E3 // ~Were there any exceptions to the elves only policy?~
++ @45 + T2.3Z // ~I think I've listened to all I can handle.~
++ @59 + T2.ET // ~Thank you, that was enlightening.~
END

IF ~~ T2.ET 
SAY @66 // ~Yes, of course. And thank you. I feel better now, even if this land is still awful.~
IF ~~ DO ~IncrementGlobal("X3VienTalk","GLOBAL",1) RealSetGlobalTimer("X3VienTimer","GLOBAL",3400)~ EXIT
END

// Talk 3 

/* This occurs only after the Nashkel Inn event. It will need a check to make sure the PC isn't in that room.
This is still technically talk 3, but is not tied to the regular talks. */

IF ~Global("X3VienApprenticeTalk","GLOBAL",2)~ T3
SAY @68 // ~<CHARNAME>, we need to talk.~
+~!Dead("X3VAPR")~+ @69 + T3.Speak1 // ~What's wrong?
+~!Dead("X3VAPR")~+ @70 + T3.Speak1 // ~Speak your mind.~
+~Dead("X3VAPR")~+ @69 + T3.Speak2 // ~What's wrong?
+~Dead("X3VAPR")~+ @70 + T3.Speak2 // ~Speak your mind.~
++ @71 + T3.NotNow // ~Now isn't the time.~ 
END 

IF ~~ T3.NotNow 
SAY @72 // ~Now is bloody well the time.~
IF ~!Dead("X3VAPR")~ + T3.Speak1
IF ~Dead("X3VAPR")~ + T3.Speak2 
END 

IF ~~ T3.Speak1 
SAY @73 //~Why did you let him get away? He didn't reveal the truth that could have got me saved back in Evermeet!~
++ @74 + T3.Right // ~Because he was repentant, and ultimately as used as yourself.~
++ @75 + T3.Mad // ~To make you mad, really.~ (This will hurt P.I.D.). 
++ @76 + T3.Right // ~I'm not here to play executioner to every pawn. They are not the one we seek.~
++ @77 + T3.Right // ~Because I believed it was the best decision, got it?~
END 

IF ~~ T3.Right 
SAY @78 // ~Hells. Fine. You have a point. I am just...angry. Stupid man got roped away from me with her seductive Sharran darkness!~
IF ~~ + T3.Speak2 
END 

IF ~~ T3.Mad 
SAY @79 // ~You did it to make me MAD?! Oh, I am very angry, <CHARNAME>. 
= @80 // ~If you play this game when we meet my former master, I will be livid.~
IF ~~ + T3.Speak2 
END 

IF ~~ T3.Speak2 
SAY @81 // ~We know where she is now. I expect you to make every preparation before we meet her, her magic will be fierce.~
++ @82 + T3.Frustration // ~I'll do this right. We will get her, Vienxay.~
+~!Dead("X3VAPR")~+ @83 + T3.AnyLess1 // ~Do you expect any less of me?~
+~Dead("X3VAPR")~+ @83 + T3.AnyLess2 // ~Do you expect any less of me?~
+~!Dead("X3VAPR")~+ @84 + T3.AnyLess1 // ~Don't bark at me. I know what to do.~
+~Dead("X3VAPR")~+ @84 + T3.AnyLess2 // ~Don't bark at me. I know what to do.~
END 

IF ~~ T3.AnyLess1 
SAY @85 // ~I do, given what happened in the inn.~
IF ~~ + T3.Frustration 
END 

IF ~~ T3.AnyLess2
SAY @94  // ~No, I admit you've done well so far.~
IF ~~ + T3.Frustration 
END 

IF ~~ T3.Frustration 
SAY @86 // ~I am just...concerned.~ 
= @87 // ~I remember sitting in shame, amongst the council, my family and sisters in attendance, as my sentence of being cast out was given.
= @88 // ~And I remember that bitch and my ex just watching. I hated them both for it.~
= @89 // ~This is all I have, <CHARNAME>. Don't let me lose this.~
++ @90 + T3.Vengeance // ~There's more to life than vengeance, Vienxay.~
++ @91 + T3.IKnow // ~I know what this means to you. They're as good as dead.~
++ @92 + T3.Fret// ~Stop fretting. Your doubt of me is insulting.~
++ @93 + T3.We // ~We'll see.~
END 

IF ~~ T3.Vengeance 
SAY @128 // ~Not for me, and not in the present.~
IF ~~ + T3.MoveOn
END 

IF ~~ T3.MoveOn 
SAY @95 // ~Let's just move on. Her death won't come with us chatting about it.~
IF ~~ DO ~IncrementGlobal("X3VienApprenticeTalk","GLOBAL",1)~ EXIT
END 

IF ~~ T3.IKnow 
SAY @96 // ~Thank you, <CHARNAME>.~
IF ~~ + T3.MoveOn
END 

IF ~~ T3.Fret 
SAY @97 // ~I've every *right* to fret. This is crucial to me.~
IF ~~ + T3.MoveOn
END 

IF ~~ T3.We 
SAY @98 // ~I don't appreciate vague reassurance, <CHARNAME>.
IF ~~ + T3.MoveOn 
END 

// Talk 4 
/*Note this talk uses 6.*/  

IF ~Global("X3VienTalk","GLOBAL",6)~ T4
SAY @99 // ~I've a question of you, <CHARNAME>.
++ @100 + T4.Skills // ~What is it?~ 
++ @101 + T4.Skills // ~I'm listening.~
++ @102 + T4.Skills // ~This will be interesting.~
++ @103 + T4.Over // ~This isn't the best time.~ 
END  

IF ~~ T4.Over 
SAY @104 // ~Hrmph. As you say.~
IF ~~ DO ~IncrementGlobal("X3VienTalk","GLOBAL",1) RealSetGlobalTimer("X3VienTimer","GLOBAL",3400)~ EXIT
END

IF ~~ T4.Skills 
SAY @105 // ~It is more of an observation, of sorts.~
IF ~Class(Player1,MAGE_ALL)~ + T4.Mage
IF ~Class(Player1,BARD_ALL)~ + T4.Bard
IF ~Class(Player1,CLERIC_ALL)~ + T4.Cleric
IF ~Class(Player1,DRUID_ALL)~ + T4.Druid
IF ~Class(Player1,THIEF_ALL)~ + T4.Thief
IF ~!Class(Player1,BARD_ALL)!Class("Player1",MAGE_ALL)!Class("Player1",CLERIC_ALL)!Class("Player1",DRUID_ALL)!Class("Player1",THIEF_ALL)~ + T4.Warrior
END 

IF ~~ T4.Mage 
SAY @106 // ~You took the path of the mage. What influenced you to make this life-decision?~ 
++ @107 + T4.Gorion // ~It was a path that Gorion believed best for me.~
++ @108 + T4.Candlekeep // ~There were many tomes and spells in Candlekeep. It was the natural choice.~
++ @109 + T4.Personal // ~That's a personal question. I'd rather not share.~
++ @110 + T4.Unknown // ~I'm not sure. I just...went that way.~
END 

IF ~~ T4.Bard 
SAY @111 // ~You took the path of the bard. What influenced you to the way of song, magic and blade?~
++ @107 + T4.Gorion // ~It was a path that Gorion believed best for me.~
++ @112 + T4.Candlekeep // ~There were many tomes and spells in Candlekeep, with many stories of ages past. It was the natural choice.~
++ @109 + T4.Personal // ~That's a personal question. I'd rather not share.~
++ @110 + T4.Unknown // ~I'm not sure. I just...went that way.~
END 

IF ~~ T4.Cleric 
SAY @113 // ~You're a priest. What influenced you to be such a path?~
++ @114 + T4.Gods // ~I felt a connection to my god, this path is right for me.~
++ @107 + T4.Gorion // ~It was a path that Gorion believed best for me.~
++ @109 + T4.Personal // ~That's a personal question. I'd rather not share.~
++ @110 + T4.Unknown // ~I'm not sure. I just...went that way.~
END 

IF ~~ T4.Druid 
SAY @115 // ~You're a forest walker. What influenced you to choose this path?~
++ @114 + T4.Gods // ~I felt a connection to the walk of life, this path felt right for me.~
++ @107 + T4.Gorion // ~It was a path that Gorion believed best for me.~
++ @109 + T4.Personal // ~That's a personal question. I'd rather not share.~
++ @110 + T4.Unknown // ~I'm not sure. I just...went that way.~
END 

IF ~~ T4.Thief 
SAY @116 // ~You're a rogue, skilled with all sorts of skullduggery. Why this path?~ 
++ @117 + T4.Rogue // ~I've always wanted to live by the thrill of the rogue's trickery. This suits me.~
++ @118 + T4.Gorion // ~Gorion didn't approve of it, but it helped cure the boredom of Candlekeep, following this path.~
++ @109 + T4.Personal // ~That's a personal question. I'd rather not share.~
++ @110 + T4.Unknown // ~I'm not sure. I just...went that way.~
END 

IF ~~ T4.Warrior 
SAY @119 // ~You're trained to fight in battle, when you could have gone so many other ways. Why this path?~
++ @120 + T4.Defense // ~I needed to know how to defend myself. Being a <PRO_CLASS> felt suiting.~
++ @107 + T4.Gorion // ~It was a path that Gorion believed best for me.~
++ @109 + T4.Personal // ~That's a personal question. I'd rather not share.~
++ @110 + T4.Unknown // ~I'm not sure. I just...went that way.~
END 

IF ~~ T4.Gorion 
SAY @121 // ~Our caretakers are such great influence of our life path.~
IF ~~ + T4.Choice 
END 

IF ~~ T4.Candlekeep 
SAY @122 // ~I suppose that makes sense, the world around you influencing what cards you could pick from.~ 
IF ~~ + T4.Choice 
END

IF ~~ T4.Personal 
SAY @123 // ~Whatever you want. It is not that important for me to know.~
IF ~~ + T4.Choice 
END

IF ~~ T4.Unknown
SAY @124 // ~Spoken like someone who has given little thought of who they are.~
IF ~~ + T4.Choice 
END 

IF ~~ T4.Gods 
SAY @125 // ~I'll hardly understand such spirituality, and how it seizes some people.~
IF ~~ + T4.Choice 
END 

IF ~~ T4.Rogue 
SAY @126 // ~A suiting choice, a suiting reason.~
IF ~~ + T4.Choice 
END 

IF ~~ T4.Defense 
SAY @127 // ~A good reason, though magic is a better choice for defense.~
IF ~~ + T4.Choice 
END 

IF ~~ T4.Choice 
SAY @129 // ~I myself was always destined to be a mage. Smarter than my peers, I took to magic naturally, and as the eldest, I had to show my siblings what they could become.~
++ @130 + T4.Fail // ~That doesn't seem to have worked out for you.~
++ @131 + T4.Siblings // ~You've not told me much of your siblings.~
++ @132 + T4.Shadow // ~You also know shadow magic and the skills of a thief.~
++ @133 + T4.Over // ~It suits you, though we've spoken long enough.~
++ @134 + T4.Insult // ~You're not that good, Vienxay.~
END 

IF ~~ T4.Fail 
SAY @135 // ~For now. Don't expect things to remain as they are.~
IF ~~ + T4.Shadow 
END 

IF ~~ T4.Siblings 
SAY @136 // ~They are only so interesting, though I do love them. My youngest sister is naive and doesn't understand the world much, sweet and goodly.~
=@137 // ~My other, also younger sister is more rebellious, getting into the wrong crowds. She never made the mistakes I did, though, and she knows how to behave when she needs to.~
=@138 // ~Naturally, my example was one they were not able to follow completely, with my greatness and achievements in Evermeet.~
++ @130 + T4.Fail // ~That doesn't seem to have worked out for you.~
++ @132 + T4.Shadow // ~You also know shadow magic and the skills of a thief.~
++ @133 + T4.Over // ~It suits you, though we've spoken long enough.~
++ @134 + T4.Insult // ~You're not that good, Vienxay.~
END 

IF ~~ T4.Shadow 
SAY @137 // ~Yes. My mentor taught me the power of shadow, and it was also my undoing. Dangerously similar to the shadow weave, yet still uniquely apart. Still, the power entertained me, allowed me to do even more with my already great talents.~
++ @138 + T4.Share // ~Have you thought of sharing the lessons of your talents?~
++ @133 + T4.Over // ~It suits you, though we've spoken long enough.~
++ @134 + T4.Insult // ~You're not that good, Vienxay.~
END 

IF ~~ T4.Insult 
SAY @139 // ~Please. You may attack me with your tongue in lie, but I know the truth. You'd be lucky to even have me share my talent, though I've little time for such nonsense.~
IF ~~ + T4.Leave
END 

IF ~~ T4.Share 
SAY @140 // ~I suppose I could share my talent, though I'd hardly want to teach a lesson. I'll...ruminate on it for your benefit, however.~
IF ~~ + T4.Leave 
END

IF ~~ T4.Leave 
SAY @141 // ~Now, off to the next road, or, whatever, isn't it?~
IF ~~ DO ~IncrementGlobal("X3VienTalk","GLOBAL",1) RealSetGlobalTimer("X3VienTimer","GLOBAL",3400)~ EXIT
END


// Quest Reminder Upon Entering Nashkel. 

IF ~Global("X3VienQuestStart", "GLOBAL", 1)~ VienxayT.Reminder
SAY @142 // ~It's about time we're here.~
IF ~~ + VienxayT.Reminder2
END

IF ~~ VienxayT.Reminder2
SAY @143 // ~They're bound to be in the vicinity, perhaps the inn. Let's look around.~
IF ~~ DO ~SetGlobal("X3VienQuestStart","GLOBAL",2)~ EXIT
END  

// Player Kills Apprentice without talking to him first. 

IF ~Global("X3VienAprKilledFirst","GLOBAL",1) ~ Vienxay.Idiot1
SAY @144 // ~You idiot. How the hell are we supposed to find her now?~
IF ~~ + Vienxay.Idiot2
END 

IF ~~ Vienxay.Idiot2 
SAY @145  // ~Wait. He has a letter...she's in the cloakwood, is she? I suppose it's not a lost cause after all.~
IF ~~ DO ~SetGlobal("X3VienAprKilledFirst","GLOBAL",2)~ EXIT 
END 



// GENDER CHANGE.

IF ~Global("X3VienSexChange","GLOBAL",1)~ VGender
SAY @28 //~No.~
= @29 //~No. NO!~
= @30 //~I am hideous! And it won't come off! Get it off of me, NOW!~
IF ~~ DO ~SetGlobal("X3VienSexChange","GLOBAL",2)~ EXIT
END



// Talk 5 
IF ~Global("X3VienTalk","GLOBAL",8)~ T5
SAY @146 // ~<CHARNAME>, a moment.~
++ @147 + T5.Plan // ~Yes, Vienxay?~ 
++ @148 + T5.Really // ~What is it now?~
++ @149 + T5.Wait // ~Can it wait?~ 
END 


IF ~~ T5.Plan
SAY @150 // ~I am curious what your plans are for this party. We have been traveling for a while together and I wish to understand your objective.~
++ @151 + T5.Ear // ~I am taking it by ear.~
+~GlobalGT("CHAPTER","GLOBAL",3)~+ @152 + T5.Bottom // ~I want to get to the bottom of this Iron Throne.~
++ @153 + T5.Region // ~There are widespread problems across the region I intend to resolve.~
++ @154 + T5.Kill // ~Finding out who is sending all of these assassins after me, and why.~
++ @155 + T5.Matter // ~Does it matter?~ 
END 

IF ~~ T5.Ear 
SAY @156 // ~By ear? I suppose following your intuition can work, if you have any sense of intelligence, that is.~
= @523 // ~But that will not always be enough. You need to have a plan.~
++ @522 + T5.Trust // ~I've led us this far. Have some trust.~
++ @524 + T5.Consider // ~I'll consider your words.~
++ @525 + T5.Advice // ~I don't need your advice.~
END 

IF ~~ T5.Region 
SAY @526 // ~That is not useful to our time to help every mud-worn peasant with trivial tasks.~
= @527 // ~There are greater issues we should deal with. Don't forget that.~
++ @522 + T5.Trust // ~I've led us this far. Have some trust.~
++ @524 + T5.Consider // ~I'll consider your words.~
++ @525 + T5.Advice // ~I don't need your advice.~
END 

IF ~~ T5.Kill 
SAY @528 // ~A sound idea, of sorts though you need not to fret over them. I will clearly make sure you stay alive.~
= @529 // ~Just remember to have a plan to deal with them. Such killers will certainly be planning on how to take you down.~
++ @522 + T5.Trust // ~I've led us this far. Have some trust.~
++ @524 + T5.Consider // ~I'll consider your words.~
++ @525 + T5.Advice // ~I don't need your advice.~
END 

IF ~~ T5.Bottom 
SAY @157 // ~I see. They seem quite powerful, quite connected. They remind me of my own master's ruthlessness.~
= @523 // ~You must be prepared to be just as ruthless. Whatever this organization is, they certainly do not have issues with money.~
++ @522 + T5.Trust // ~I've led us this far. Have some trust.~
++ @524 + T5.Consider // ~I'll consider your words.~
++ @525 + T5.Advice // ~I don't need your advice.~
END 

IF ~~ T5.Trust 
SAY @530 // ~Blind trust can get you killed. But you have proven yourself so far. I will give you a break from my pestering We've a task at hand as is.~
IF ~~ DO ~IncrementGlobal("X3VienTalk","GLOBAL",1) RealSetGlobalTimer("X3VienTimer","GLOBAL",3400)~ EXIT
END

IF ~~ T5.Consider 
SAY @531 // ~Good. You're learning quite well, it seems.~
IF ~~ DO ~IncrementGlobal("X3VienTalk","GLOBAL",1) RealSetGlobalTimer("X3VienTimer","GLOBAL",3400)~ EXIT
END

IF ~~ T5.Advice 
SAY @532 // ~Fine, but if you get any of us killed with your lack of listening, you won't hear the end of my anger.~
IF ~~ DO ~IncrementGlobal("X3VienTalk","GLOBAL",1) RealSetGlobalTimer("X3VienTimer","GLOBAL",3400)~ EXIT
END

IF ~~ T5.Really 
SAY @158 // ~No need to be rude. Particularly to me.~
IF ~~ + T5.Plan
END 

IF ~~ T5.Wait 
SAY @159 // ~Can it wait? I find such a question stupid. I'll be disinterested in asking about it later, but as you wish.~
IF ~~ DO ~IncrementGlobal("X3VienTalk","GLOBAL",1) RealSetGlobalTimer("X3VienTimer","GLOBAL",3400)~ EXIT
END

IF ~~ T5.Matter 
SAY @161 // ~Does it matter? Of course it matters. I want to know our objective is sound.~
++ @522 + T5.Trust // ~I've led us this far. Have some trust.~
++ @151 + T5.Ear // ~I am taking it by ear.~ 
+~GlobalGT("CHAPTER","GLOBAL",3)~+ @152 + T5.Bottom // ~I want to get to the bottom of this Iron Throne.~
++ @153 + T5.Region // ~There are widespread problems across the region I intend to resolve.~
++ @154 + T5.Kill // ~Finding out who is sending all of these assassins after me, and why.~
END 

// Talk 6 
/* Splits, pending on whether Vienxay's master is dead or not. IF They are not dead, and the PC's Charisma is insufficient, Vienxay will leave. She will leave regardless if her ex is also not dead.*/
IF ~Dead("X3VMAS")Global("X3VienQuestDone","GLOBAL",2)~ T6.Killed 
SAY @521 // ~Dead. Hahaha, yes! Dead! Dead! At last, you bitch, the grave you deserve.~
= @393 // ~Let us be away from this place. We may have cause for revelry later.~
IF ~~ DO ~IncrementGlobal("X3VienQuestDone","GLOBAL",2) RealSetGlobalTimer("X3VienFinalTimer","GLOBAL",3400)~ EXIT 
END 

IF ~Global("X3VienBribed","GLOBAL",1)Global("X3VienQuestDone","GLOBAL",2)~ T6.Bribed 
SAY @376 // ~You idiot. Is your desire of power so strong you succumbed so easily to her bribe?~
= @377 // ~I should have known better than to trust in you!~
++ @378 + T6.BPower // ~She was too powerful, Vienxay, and you know it. This was the best course of action.~ 
++ @379 + T6.BNothing // ~Vengeance would have solved nothing. You would still be banished from Evermeet.~ 
++ @380 + T6.BPursue // ~Pursue her, then. I saved your life. I saved *all of our lives, and I look out for us.~
END 

IF ~~ T6.BPursue 
SAY @381 // ~I *will* pursue her. Without you. Good riddance, you useless peasant.~
IF ~~ EXIT 
END 

IF ~~ T6.BPower 
SAY @382 // ~Individually she is very powerful, but you had no faith in our own power combined? You disgust me.~
IF ~~ + T6.BWhy 
END 

IF ~~ T6.BNothing 
SAY @383 // ~Don't lecture me. Not right now. Not after you just let her go!~
IF ~~ + T6.BWhy 
END 

/* Note a lot of dialogue below repeats four times. There are two paths to success: Dead Ex + 13 Charisma or more, or Alive Ex + 16 Charisma or more. */
IF ~~ T6.BWhy 
SAY @384 // ~I feel every desire to leave and get the job done myself. Why should I bother staying with such incompotent fools?~
+~CheckStatGT(Player1,15,CHR)Dead("X3VAPR")~+ @385 + T6.BPersuade1 // ~Because you are needed *here*. Let the gods judge her, and we can move forward with our lives.~
+~CheckStatGT(Player1,15,CHR)Dead("X3VAPR")~+ @386 + T6.BPersuade1 // ~Because your master is insignificant now, spared because of our own leniency. Take that as satisfaction.~
+~CheckStatGT(Player1,15,CHR)Dead("X3VAPR")~+ @387 + T6.BPersuade1 // ~Because I like you, and want you to see more than just petty revenge!~
+~CheckStatGT(Player1,12,CHR)!Dead("X3VAPR")~+ @385 + T6.BPersuade2 // ~Because you are needed *here*. Let the gods judge her, and we can move forward with our lives.~
+~CheckStatGT(Player1,12,CHR)!Dead("X3VAPR")~+ @386 + T6.BPersuade2 // ~Because your master is insignificant now, spared because of our own leniency. Take that as satisfaction.~
+~CheckStatGT(Player1,12,CHR)!Dead("X3VAPR")~+ @387 + T6.BPersuade2 // ~Because I like you, and want you to see more than just petty revenge!~
+~CheckStatLT(Player1,16,CHR)Dead("X3VAPR")~+ @385 + T6.Leave // ~Because you are needed *here*. Let the gods judge her, and we can move forward with our lives.~
+~CheckStatLT(Player1,16,CHR)Dead("X3VAPR")~+ @386 + T6.Leave // ~Because your master is insignificant now, spared because of our own leniency. Take that as satisfaction.~
+~CheckStatLT(Player1,16,CHR)Dead("X3VAPR")~+ @387 + T6.Leave // ~Because I like you, and want you to see more than just petty revenge!~
+~CheckStatLT(Player1,13,CHR)!Dead("X3VAPR")~+ @385 + T6.Leave // ~Because you are needed *here*. Let the gods judge her, and we can move forward with our lives.~
+~CheckStatLT(Player1,13,CHR)!Dead("X3VAPR")~+ @386 + T6.Leave // ~Because your master is insignificant now, spared because of our own leniency. Take that as satisfaction.~
+~CheckStatLT(Player1,13,CHR)!Dead("X3VAPR")~+ @387 + T6.Leave // ~Because I like you, and want you to see more than just petty revenge!~
++ @380 + T6.BPursue // ~Pursue her, then. I saved your life. I saved *all of our lives, and I look out for us.~
END 

IF ~~ T6.BPersuade1 
SAY @388 // ~You spare my ex, her other apprentice. And now my master. I do not understand your logic, but I have traveled for you for this long, and have nowhere else truly to go.~
= @389 // ~I shall continue to follow your lead, but don't bother me! I want space from all of your...mercifulness.~
IF ~~ DO ~IncrementGlobal("X3VienQuestDone","GLOBAL",1) RealSetGlobalTimer("X3VienFinalTimer","GLOBAL",3400)SetGlobal("X3VienPIDOFF","GLOBAL",1)~ EXIT /* Vienxay's P.I.D. is turned off, rest of exit script is normal. */ 
END 

IF ~~ T6.BPersuade2 
SAY @390 // ~I...I suppose it hardly matters, in the grand scope of things. How I hate to admit it.~
= @389 // ~I shall continue to follow your lead, but don't bother me! I want space from all of your...mercifulness.~
IF ~~ DO ~IncrementGlobal("X3VienQuestDone","GLOBAL",1) RealSetGlobalTimer("X3VienFinalTimer","GLOBAL",3400)SetGlobal("X3VienPIDOFF","GLOBAL",1)~ EXIT /* Vienxay's P.I.D. is turned off, rest of exit script is normal. */ 
END 

IF ~~ T6.Leave 
SAY @391 // ~That does not matter to me. Only vengeance matters to me.~ 
IF ~~ + T6.BPursue 
END 

// Talk 7
/*Vienxay Laments never being able to return.*/
IF ~Global("X3VienFinalTalk","GLOBAL",2)~ T7 
SAY @404 // <CHARNAME>, I need...an ear. I would appreciate you listening.~
+~Dead("X3VMAS")~+ @405 + T7.Dead // ~I'm always here, Vienxay.~ 
+~!Dead("X3VMAS")~+ @405 + T7.Alive // ~I'm always here, Vienxay.~
+~!Dead("X3VMAS")~+ @406 + T7.Alive // ~What is it?~
+~Dead("X3VMAS")~+ @406 + T7.Dead // ~What is it?~
++ @407 + T7.Later // ~This isn't the time.~ 
END 

IF ~~ T7.Dead 
SAY @408 // ~For a while, I felt true, pure joy from her death. Finally. Vengeance. Justice. All of those feelings of anger and discontent left me.~
IF ~~ + T7.Empty 
END 

IF ~~ T7.Alive 
SAY @409 // ~I have found it excruciatingly difficult to accept she will remain alive. To let go fo the vengeance, anger, and discontent.~
IF ~~ + T7.Empty  
END 

IF ~~ T7.Later 
SAY @410 // ~Fine! Have it your way.~
IF ~~ DO ~IncrementGlobal("X3VienFinalTalk","GLOBAL",1)SetGlobal("X3VienPIDOFF","GLOBAL",2)~ EXIT 
END 

IF ~~ T7.Empty 
SAY @411 // ~But now, I feel empty. My family is still so far away, and Evermeet remains unreachable for the several centuries of my life I have left.~
++ @412 + T7.Know // ~I don't know what to say, Vienxay.~
++ @413 + T7.Find // ~You will find a new home. You can move on.~
++ @414 + T7.Perhaps // ~Perhaps for the best.~
END 

IF ~~ T7.Know 
SAY @415 // ~You don't need to say anything, <CHARNAME>. Just listening is all I needed.~
= @416 // ~There's no need to dwell on it further. Your own problems await solving, and you will have my assistance until it is done.~
IF ~~ DO ~IncrementGlobal("X3VienFinalTalk","GLOBAL",1)SetGlobal("X3VienPIDOFF","GLOBAL",2)~ EXIT 
END 

IF ~~ T7.Find 
SAY @417 // ~That is far easier said than done. 
= @418 // ~It would be less difficult if my family was dead, and the island sunk, for it could not tease the hope of return.~
++ @536 + T7.Forward // ~Then look forward. Look at what you have done since, by my side.~
++ @537 + T7.Home // ~Then make a new home. This is your chance to be someone new.~
++ @538 + T7.Later // ~I tire of listening to your whining.~
++ @412 + T7.Know // ~I don't know what to say, Vienxay.~
IF ~~ DO ~IncrementGlobal("X3VienFinalTalk","GLOBAL",1)SetGlobal("X3VienPIDOFF","GLOBAL",2)~ EXIT 
END

IF ~~ T7.Perhaps 
SAY @419 // ~It is not for the best. It is shameful, it is humiliating, and it leaves me empty.~
++ @536 + T7.Forward // ~Then look forward. Look at what you have done since, by my side.~
++ @537 + T7.Home  // ~Then make a new home. This is your chance to be someone new.~
++ @538 + T7.Later // ~I tire of listening to your whining.~
++ @412 + T7.Know // ~I don't know what to say, Vienxay.~
IF ~~ DO ~IncrementGlobal("X3VienFinalTalk","GLOBAL",1)SetGlobal("X3VienPIDOFF","GLOBAL",2)~ EXIT 
END

IF ~~ T7.Forward 
SAY @539 // ~There is...satisfaction to be had by that, to see all I have done with you. But it is not enough for me.~
IF ~~ + T7.Listen 
END 

IF ~~ T7.Listen
SAY @540 // ~Thank you for listening, I suppose. My problems may be frustratingly unfixable, but I shall continue to assist with yours, for as long as you have me.~
IF ~~ DO ~IncrementGlobal("X3VienFinalTalk","GLOBAL",1)SetGlobal("X3VienPIDOFF","GLOBAL",2)~ EXIT 
END

IF ~~ T7.Home 
SAY @541 // ~As sensible as that may seem, no home will ever match what I had. Nothing.~
IF ~~ + T7.Listen 
END 


// Reputation/Alignment Shift Talk.
/* This only appears post quest, and if party's reputation hits 18.*/
IF ~Global("X3VienRepTalk","GLOBAL",1)~ VieRep
SAY @420 // ~I would like to talk.~
= @421 // ~I've seen so much of "Helping them", and "Helping poor them.". Why? Why do you bother aiding such...hopeless people?~
++ @422 + Rep1  // ~Because I want to do right.~
++ @423  + Rep2 // ~Because I feel happy when others are happy.~
++ @424 + VieRep3 // ~Why don't you?~
END 

IF ~~ Rep1 
SAY @425 // ~Because you want to? I will never understand.~
IF ~~ + VieRep3 
END 

IF ~~ Rep2 
SAY @426 // ~Our emotions tied to another's well being seems more dangeorus than benefitial.~
IF ~~ + VieRep3
END 

IF ~~ VieRep3 
SAY @427 // ~Ever since I fell into the likes of my Master, I followed the ruthless ideals of the self-first.~
= @428 // ~But I suppose there is little benefit to a legacy if you solely serve your own interests.~
= @429 // ~Your example annoys me because it is...contagious, and I am beginning to think about...sometimes doing the same.~
++ @430 + VieRep4 // ~Aiding others is something that would benefit you, Vienxay.~
++ @431 + VieRep5 // ~You? Being less selfish? Don't make me laugh.~
++ @432 + VieRep4 // ~You should follow your heart.~
++ @433 + VieRep5 // ~I would rather not listen to this.~
END 

IF ~~ VieRep4 
SAY @434 // ~I will think about it some more, at the least. It still is slightly discomforting, but...maybe...that is the lesson Evermeet wished to teach.~
IF ~~ DO ~IncrementGlobal("X3RepTalk","GLOBAL",1)ChangeAlignment("X3Vien",NEUTRAL)~ EXIT 
END 

IF ~~ VieRep5 
SAY @435 // ~Fine. I will stop talking about this.~
IF ~~ DO ~IncrementGlobal("X3VienRepTalk","GLOBAL",1)~ EXIT 
END 

// INTERJECTIONS 

CHAIN X3VIENJ BA.C 
@584 // ~Good, you are sensible!~
DO ~SetGlobal("X3VienBaelothConflict","LOCALS",-1)~
== BAELOTHJ @585 // ~A fiery fool to force this idea of leaving! To do better without I, Baeloth? Bah!~
DO ~SetGlobal("KickedOut","LOCALS",1)
SetDialog("BAELOTHP")
EscapeAreaMove("AR2300",4721,3045,S)LeaveParty()~
EXIT 

// Lighthouse
I_C_T Ardrou 0 X3VienArdrou0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @453 // ~What an awful parent. We should consider just giving her child away. Letting a boy play in an abandoned light house!~
END 

//Dead Cat 
I_C_T Drienn 1 X3VienDrienn1
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @454 // ~Does she really believe in the idiotic idea that cats have nine lives? We may as well show her the reality of animal incompetence.~
END 

// Noble #9 
I_C_T Nobl9 0 X3VienNoble90 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @455 // ~Excuse me?! Who do you think we are? Ugh! Humans are so aggravating.~
== Nobl9 @591 // ~I'm not paying you to grovel. Off with you.~
END

// Melica 
I_C_T2 Melica 11 X3VienMelica11 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @456 // ~Incompetent mages do not deserve aid. Particularly those trying spells beyond their meager ability.~
END

// Ashen
I_C_T2 Ashen 2 X3VienAshen2
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @457 //~His description of this backwater land could not be more accurate.~
END

// Tamah 

I_C_T2 Tamah 5 X3VienTamah5 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @458 //~Doing something nice for no reward is a good way to never ascend far up in life.~
END

// Town Crier 
I_C_T TownCR 0 X3VienTownCR0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @459 //~A worthy endeavor for a party of our skill.~
END

I_C_T TownCR 2 X3VienTownCR2
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @460 //~Please. 3,000? <PRO_HESHE> is worth double.~
END

I_C_T TownCR 4 X3VienTownCR4
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @461 //~I'm insulted I remain uncredited for my part in this.~
END

// Tick 
I_C_T Tick 0 X3VienTick0 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @462 //~I'm insulted I remain uncredited for my part in this.~
END

// Tarnes
I_C_T Tarnes 0 X3VienTarnes0 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @542 //~Careful. This human has been asking about you. Say little and move on.~
END

// Prism
I_C_T Prism 1 X3VienPrism1 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @543 // ~Don't we have better things to do? I hardly care for this human artist.~
END

// Berrun
I_C_T Berrun 8 X3VienBerrun8
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @544 // ~"Go now and do what we can?" For nine hundred? We're clearly worth more. Or at least I am.~
END

// Berrun
I_C_T Berrun 11 X3VienBerrun11
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @545 // ~The work at hand best be matched by an appropriate reward. Delving into a mine is beneath me.~
END

// Berrun
I_C_T Berrun 12 X3VienBerrun12
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @545 // ~The work at hand best be matched by an appropriate reward. Delving into a mine is beneath me.~
END

// Berrun
I_C_T Berrun 13 X3VienBerrun13
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @545 // ~The work at hand best be matched by an appropriate reward. Delving into a mine is beneath me.~
END

// Berrun
I_C_T Berrun 19 X3VienBerrun19
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @545 // ~The work at hand best be matched by an appropriate reward. Delving into a mine is beneath me.~
END

//Rasaad 
I_C_T Rasaad 11 X3VienRasaad11
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @546 // ~What a stupid philosophy. It is only designed to manipulate and reduce self-worth. I'd almost rather revere Shar.~
END

//Bentley
I_C_T Bently 0 X3VienBently0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @547 // ~Don't ask for elven wine. He had not a single pitcher.~
== Bently IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @548 // ~We only have ale, lass.~
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @549 // ~And that is why this inn is subpar.~
END

//Bentley
I_C_T Bently 1 X3VienBently1
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @547 // ~Don't ask for elven wine. He had not a single pitcher.~
== Bently IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @548 // ~We only have ale, lass.~
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @549 // ~And that is why this inn is subpar.~
END

//Jaheira 
I_C_T Jaheir 0 X3VienJaheir0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @550 // ~Were you wanting to meet these mutts? They've been here longer than I.~
END 

//Jaheira 
I_C_T Jaheir 1 X3VienJaheir1
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @550 // ~Were you wanting to meet these mutts? They've been here longer than I.~
END 

//Khalid
I_C_T Khalid 1 X3VienKhalid1
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @550 // ~Were you wanting to meet these mutts? They've been here longer than I.~
END 

// Mulahehey
I_C_T Mulahe 3 X3VienMulah3 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @551 // ~How low you have fallen, Cyrcist. I say finish it and kill him, <CHARNAME>.~
END 

//Mutamin
I_C_T Mutami 0 X3VienMutami0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @463 //~Ugh, he even sounds snakish. Don't under-estimate a mage that has basilisks as pets.~
END

//Molkar
I_C_T Molkar 0 X3VienMolkar0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @464 //~Oh please. Let's show them what we're made of, we've more important things than scuffle with these peasants.~
END
// Permid
I_C_T2 PERMID 0 X3VienPermid 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @465 //~Typical human ambition. Dreams beg. Settles for less.~
END
// Thalan 
I_C_T2 THALAN 0 X3VienThalan
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @466 //~This mage clearly doesn't know when he's crossed paths with his better.~
END

// Teven 
I_C_T Teven 3 X3VienTeven3
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @552 //~Please. We are a flat improvement over your common lot.~
END

// Ender, Location Learned
I_C_T2 Ender 6 X3VienEnder6
== X3VienJ IF ~Global("X3VienApprenticeTalk","GLOBAL",3) InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @553 //~The same place as my master. Fitting.~
END

// Ender, Location Not Learned 
I_C_T2 Ender 6 X3VienEnder6
== X3VienJ IF ~!Global("X3VienApprenticeTalk","GLOBAL",3) InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @554 //~Your enemy is now known. A target we can now strike at.~
END

//Drasus 
I_C_T Drasus 0 X3VienDrasus0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @555 // ~This idiot isn't understanding that making the same mistake as the other bounty hunters won't change the outcome.~
END

// Drunk 
I_C_T Drunk 0 X3VienDrunk
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @467 //~You're a joking idiot. Ugh. Worse. You're a drunk idiot.~
END

// Kahrk 
I_C_T2 Kahrk 0 X3VienKahrk
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @468 //~I was expecting something more. No matter, this will be enjoyable.~
END

// Bentan 
I_C_T Bentan 2 X3VienBentan
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @469 //~I am going to plug my ears now.~
END

//Larry 
I_C_T Larry 0 X3VienLarry0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @470 //~The world has gone mad, clearly.~
END

//Landrin 
I_C_T Landri 0 X3VienLandri0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @471 //~We're not butlers. One of us here is elven nobility. Such rudeness.~
END

//Lena 
I_C_T Lena 0 X3VienLena0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @472 
END

//Lantanara
I_C_T2 Lantan 1 X3VienLantan1
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @473 
END

//Caldo 
I_C_T Caldo 0 X3VienCaldo0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @474 
END

//Slave4 
I_C_T Slave4 0 X3VienSlave4
== X3VienJ IF ~!Alignment(Myself,NEUTRAL) InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @556 // ~Please. Helping the weak like him will only land him in a similiar situation. Such fools are destined for the low rungs of life.~
END

I_C_T Slave4 0 X3VienSlave41
== X3VienJ IF ~Alignment(Myself,NEUTRAL) InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @557 // ~I suppose there's no harm in helping these pitiful peasants.~
END

I_C_T FCOOK2 0 X3VienFCOOK2 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @558 // ~Human desperation reeks.~
END

I_C_T Yeslic 1 X3VienYeslic1
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @559 // ~If you're actually considering his offer, remember he is a dwarf, and was a prisoner. Clearly only so useful.~
END

I_C_T IRON9 0 X3VienIron90 
== X3VienJ IF ~!Alignment(Myself,NEUTRAL) InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @560 // ~Gods, the whining. Please, kill this oaf.~
END

I_C_T IRON9 0 X3VienIron901 
== X3VienJ IF ~Alignment(Myself,NEUTRAL) InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @561 // ~Gods, the whining. Just let him run away like the coward he is~
END

I_C_T Rielta 6 X3VienRelta6
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @564 // ~This is your chance for revenge. Do *not* let it slip away.~
END

I_C_T Stepha 0 X3VienStepha0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @562 // ~Typical for underlings to be so quick to beg for their life.~
END

I_C_T2 Scar 13 X3VienScar13 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @563 // ~Finally. Proper appreciation.~
END

I_C_T Angelo 0 X3VienAngelo0 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @565 // ~Surrendering was clearly a mistake. Talk us out of this, <CHARNAME>.~
END

I_C_T Aldeth 0 X3VienAldeth0 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @566 // ~I can hardly stand savages either. I suppose for the right reward I would support assisting this man.~
END

I_C_T Tamoko 0 X3VienTamoko0 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @567 // ~If you intend to speak to this stranger make it quick. We are being hunted by guards, if you can bother remembering our simple crisis.~
END

I_C_T Cythan 0 X3VienCythan0 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @568 // ~She must be an idiot if she can't figure out our purpose here.~
END

I_C_T Krysti 1 X3VienKrysti1 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @569 // ~Please. Someone like you fits right in here, harlot.~
== Krysti IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @570 // ~Oh Slythi baby, she's so jealous.~
END

I_C_T Gregor 0 X3VienGregor0 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @571 // ~Typical. The shepherd falls and the sheep go mad.~
END 

I_C_T2 HUSAM 31 X3VienHusam31
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @572 // ~Impressive that this drunk was a shadow thief all along. He has my respect.~
END 

I_C_T Belt 11 X3VienBelt11 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @573 // ~He is right. We should see that Sarevok is slain.~
END

I_C_T Viconi 5 X3VienViconia5 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @576 // ~Typically I would be against this arrangement, to walk with a drow. But she seems weak and...helpless. Even my heart pities her.~
END

I_C_T Viconi 6 X3VienViconia6
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @576 // ~Typically I would be against this arrangement, to walk with a drow. But she seems weak and...helpless. Even my heart pities her.~
END

I_C_T Voleta 8 X3VienVoleta8 
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @574 // ~"Get going". Do watch who you command.~
END

I_C_T Winski 0 X3VienWinski0
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @575 // ~Glories that are at an end. How the mighty have fallen.~
END
// New 
I_C_T FLAM5 0 X3VienFlam50
== X3VienJ IF ~InParty("X3Vien") InMyArea("X3Vien") !StateCheck("X3Vien",CD_STATE_NOTVALID)~ THEN @592 // ~Here we go again. Another false accusation. Ugh.~
END

APPEND X3VienJ 
// Durlag's Tower 

IF ~Global("X3VienBasement","GLOBAL",1)~ VienDurlag1
SAY @475 // ~How deep does this place go? So typical of a dwarf to dig, dig, dig.~
++ @476 + VienDurlag2 // ~I don't know, but keep your guard up.~
++ @477 + VienDurlag3 // ~Keep quiet. We'll be at our treasure soon enough.~
++ @478 + VienDurlag4 // ~Isn't it? It won't make a difference in the end.~
END 

IF ~~ VienDurlag2 
SAY @479 // ~What, do you think I don't know what I'm doing? I'll obviously be careful. Just watch out for yourself.~
IF ~~ DO ~SetGlobal("X3VienBasement","GLOBAL",2)~ EXIT 
END 

IF ~~ VienDurlag3 
SAY @480 // ~Yes, yes, whatever.~ 
IF ~~ DO ~SetGlobal("X3VienBasement","GLOBAL",2)~ EXIT 
END 

IF ~~ VienDurlag4 
SAY @481 // ~It will on my patience. I tire of these puzzles and traps.~
IF ~~ DO ~SetGlobal("X3VienBasement","GLOBAL",2)~ EXIT 
END 
// Cloakwood 
IF ~Global("X3VienCloak","GLOBAL",1)~ VienCloak1 
SAY @482 // ~We are close. Somewhere in this vast forest is my old master.~
= @483 // ~Be watchful, for she may have other apprentices with her as well.~
++ @484 + VienCloak2 // ~Are you ready to face her?~
++ @485 + VienCloak3 // ~This won't be a problem.~
++ @486 + VienCloak3 // ~I get it. We'll be careful.~
END 

IF ~~ VienCloak2 
SAY @487 // ~For a long time. Let's kill that witch.~
IF ~~ DO ~SetGlobal("X3VienCloak","GLOBAL",2)~ EXIT 
END 

IF ~~ VienCloak3 
SAY @488 // ~Good, but don't get careless. Her spells are not mere tickles. Now, let's find that witch.~
IF ~~ DO ~SetGlobal("X3VienBasement","GLOBAL",2)~ EXIT 
END 

// Baldur's Gate (Southwest)
IF ~Global("X3VienBaldur","GLOBAL",1)~ VienBaldur1
SAY @489 // ~Human cities are all the same. The stench, the disregard of the natural world, the need for big and grand.~
++ @490 + VienBaldur2 // ~More than just humans live here, Vienxay.~
+~Race(Player1,ELF)~+ @491 + VienBaldurmeet // I find myself agreeing with you.~
++ @492 + VienBaldurmeet // ~Let me guess: It's not as grand as your homeland.~ 
END 

IF ~~ VienBaldur2 
SAY @493 // ~Yes, but this is clearly designed and founded for t he majority human population. You can tell because of how hideous it is.~
IF ~~ + VienBaldurmeet
END 

IF ~~ VienBaldurmeet 
SAY @494 // ~Evermeet designed its cities right. With a marriage to the surrounding nature, not a domination. With beauty and splendor, and walkways free of garbage and filth.~
= @495 // ~We certainly didn't have a suspicious sewer system that crooks could make use of.~
++ @496 + VienBaldur3 // ~Well, I happen to like this city.
++ @497 + VienBaldur4 // ~It does sound like an improvement.~
++ @498 + VienBaldur5 // ~Whatever you say, Vienxay.~
END 

IF ~~ VienBaldur3
SAY @499 // ~Yes, well you've not seen better than it. I suppose it is to be expected.~
= @500 // ~Well now, we have things to do, don't we?~
IF ~~ DO ~SetGlobal("X3VienBaldur","GLOBAL",2)~ EXIT 
END 

IF ~~ VienBaldur4 
SAY @501 // ~Of course it sounds like an improvement. It *is* an improvement.~
= @502 // ~But I'll speak no more of it. I am beginning to terribly miss it.~
IF ~~ DO ~SetGlobal("X3VienBaldur","GLOBAL",2)~ EXIT 
END 

IF ~~ VienBaldur5 
SAY @503 // ~Whatever I say. Don't say it so dismissively. What I say is pure gold.~
= @500 // ~Well now, we have things to do, don't we?~
IF ~~ DO ~SetGlobal("X3VienBaldur","GLOBAL",2)~ EXIT 
END 

// Larswood 

IF ~Global("X3VienLars","GLOBAL",1)~ VienLars1 
SAY @504 // ~These forests are the only thing of decency you can find amongst these lands.~
++ @505 + VienLars2 // ~Always with the insults.~
++ @506 + VienLars3 // ~I do enjoy the serenity of nature.~ 
++ @507 + VienLars2 // ~Can you just be quiet?~
END 

IF ~~ VienLars2 
SAY @508 // ~Yes, I am not fond of the civilization here. But I will bite my tongue if that is what you are begging me to do.~
IF ~~ DO ~SetGlobal("X3VienLars","GLOBAL",2)~ EXIT 
END 

IF ~~ VienLars3 
SAY @509 // ~Exquisite, isn't it? I suppose your enemies however won't let you rest on your laurels to enjoy it for long. A shame.~
IF ~~ DO ~SetGlobal("X3VienLars","GLOBAL",2)~ EXIT 
END 

// Peldvale 

IF ~Global("X3VienPeld","GLOBAL",1)~ VienPeld1 
SAY @510 // ~I was on this road not long ago. Hrmph. Be careful. Between bandits, goblins, the wild animals, there's plenty out there to kill a lesser skilled person.~
++ @511 + VienPeld2 // ~Thanks for the warning.~
++ @512 + VienPeld3 // ~Sounds like you had a hard time out here.~
++ @513 + VienPeld2 // ~I'll be fine.~
END 

IF ~~ VienPeld2 
SAY @514 // ~Yes, of course. Just do heed my warning and don't get us killed.~
IF ~~ DO ~SetGlobal("X3VienPeld","GLOBAL",2)~ EXIT 
END 

IF ~~ VienPeld3 
SAY @515 // ~Please. Someone of my caliber would manage just fine. You're not quite at my level yet, so I am concerned. Do heed my warning and don't get us killed.~
IF ~~ DO ~SetGlobal("X3VienPeld","GLOBAL",2)~ EXIT 
END 

// P.I.D. 


IF ~IsGabber(Player1) CombatCounter(0) !Detect([ENEMY])!Global("X3VienPIDOFF","GLOBAL",1)~ THEN BEGIN Vienxay.PID 
 SAY @168 // ~*Sigh* How may I assist you?~ [VienRar2]~
 + ~HPPercentGT(Myself,74)RandomNum(3,1)~ + @225 + Vienxay.PHowAreYou1 // ~How are you doing?~
 + ~HPPercentGT(Myself,74)RandomNum(3,2)~ + @225 + Vienxay.PHowAreYou2 // ~How are you doing?~
 + ~HPPercentGT(Myself,74)RandomNum(3,3)~ + @225 + Vienxay.PHowAreYou3 // ~How are you doing?~
 +~HPPercentLT(Myself,75)HPPercentGT(Myself,49)~+ @225 + Vienxay.PHowAreYouInjured // ~How are you doing?~ //(Under 75%, Over 50%)
 +~HPPercentLT(Myself,50)~+ @225 + Vienxay.PHowAreYouHurt // ~How are you doing?~ //(Under 50%)
 +~RandomNum(3,1)~+ @353 + Vienxay.PThinkingAbout1a //~What are you thinking about?~
 +~RandomNum(3,2)~+ @353 + Vienxay.PThinkingAbout1b //~What are you thinking about?~
 +~RandomNum(3,3)~+ @353 + Vienxay.PThinkingAbout1c  //~What are you thinking about?~
 ++ @359 + Vienxay.PTalk // ~Let's stop and chat for a bit.~ 
++ @169  EXIT
 END 
 
IF ~IsGabber(Player1) CombatCounter(0) !Detect([ENEMY]) Global("X3VienPIDOFF","GLOBAL",1)~ THEN BEGIN Vienxay.PID2
SAY @394 // ~I've no interest in chatting now, peasant. Stand aside.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PHowAreYou1
SAY @162 // ~I'm not a baby. You don't need to check on me.~ 
IF ~~ EXIT  
END 

IF ~~ Vienxay.PHowAreYou2
SAY @163 // ~How do you think I am doing?~ 
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYou3
SAY @164 // ~Clearly I am doing splendidly.~ 
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYouInjured
SAY @165 // ~Why haven't you see my wounds tended to is beyond me.~ 
IF ~~ EXIT  
END

IF ~~ Vienxay.PHowAreYouHurt
SAY @166 // ~I need healing. As this group's most significant asset, letting me limp around is foolish.~ 
IF ~~ EXIT  
END

IF ~~ Vienxay.PThinkingAbout1a
SAY @167 // ~What is in my thoughts is in my thoughts for a reason.~
IF ~~ EXIT  
END

IF ~~ Vienxay.PThinkingAbout1b
SAY @226 // ~Evermeet crossed my mind for a moment. A place I can only think about now.~
IF ~~ EXIT  
END

IF ~~ Vienxay.PThinkingAbout1c
SAY @173 // ~I am trying to plan my next spell sequence. Our victories require my brilliant thinking.~
IF ~~ EXIT  
END


  
IF ~~ Vienxay.PTalk 
SAY @171 // ~What would you like to talk about?~ 
/*Options will  vary as the game goes on.*/ 
/*Chapter Advice, these repeat.*/ 
+~Global("Chapter","GLOBAL",1)~+ @174 + Vienxay.PC1Advice // ~What do you think I should do now?~
+~Global("Chapter","GLOBAL",2)~+ @174 + Vienxay.PC2Advice // ~What do you think I should do now?~
+~Global("Chapter","GLOBAL",3)~+ @174 + Vienxay.PC3Advice // ~What do you think I should do now?~
+~Global("Chapter","GLOBAL",4)~+ @174 + Vienxay.PC4Advice // ~What do you think I should do now?~
+~Global("Chapter","GLOBAL",5)~+ @174 + Vienxay.PC5Advice // ~What do you think I should do now?~
+~Global("Chapter","GLOBAL",6)~+ @174 + Vienxay.PC6Advice // ~What do you think I should do now?~
+~Global("Chapter","GLOBAL",7)~+ @174 + Vienxay.PC7Advice // ~What do you think I should do now?~
// Companion Thoughts 
+ ~NumInPartyAliveGT(2)~ + @175 + Vienxay.PCompanionThoughts // ~What do you think of our companions?~ 
+ ~NumInPartyAliveLT(3)Race(Player1,Elf)~ + @375 + Vie.Me1 // ~What do you think of me?~
+ ~NumInPartyAliveLT(3)!Race(Player1,Elf)~ + @375 + Vie.Me2 // ~What do you think of me?~
// Dialogue From Talk Expansions. These fire once. 
+~GlobalGT("X3VienTalk","GLOBAL",2)Global("X3VienPExileTopic","GLOBAL",0)~+ @183 DO ~SetGlobal("X3VienPExileTopic","GLOBAL",1)~  + Vienxay.PT1  // ~What was it like, your first days of Exile?~
+~GlobalGT("X3VienTalk","GLOBAL",4)Global("X3VienPFamilyTopic","GLOBAL",0)~+ @184 DO ~SetGlobal("X3VienPFamilyTopic","GLOBAL",1)~  + Vienxay.PT2 // ~You speak a lot of your family’s prominence. What did your parents do?~
+~GlobalGT("X3VienApprenticeTalk","GLOBAL",2)Global("X3VienPLaciusTopic","GLOBAL",0)~+ @185 DO ~SetGlobal("X3VienPLaciusTopic","GLOBAL",1)~  + Vienxay.PT3 // ~Tell me more of Lacius. How did he figure into your master’s operations.~
+~GlobalGT("X3VienTalk","GLOBAL",6)Global("X3VienPMasterTopic","GLOBAL",0)~+ @186 DO ~SetGlobal("X3VienPMasterTopic","GLOBAL",1)~  + Vienxay.PT4 // ~Tell me more about your master. You’ve given very little detail about her.~
+~GlobalGT("X3VienTalk","GLOBAL",8)Global("X3VienPShadowTopic","GLOBAL",0)~+ @187 DO ~SetGlobal("X3VienPShadowTopic","GLOBAL",1)~  + Vienxay.PT5 // ~What made you not use the Shadow Weave?~
+~GlobalGT("X3VienQuestDone","GLOBAL",2)~+ @188 + Vienxay.PT6 // ~So, how do you feel, now that this issue with your master is over?~ 
+~GlobalGT("X3VienFinalTalk","GLOBAL",2)~+ @189 + Vienxay.PT7 // ~There are other elven communities out there. Have you thought of going to them?~
+~Global("X3VienPHaughtyTopic","GLOBAL",0)~+ @190 DO ~SetGlobal("X3VienPHaughtyTopic","GLOBAL",1)~ + Vienxay.PHaughty // ~Are you always so haughty?~ 
+~RandomNum(3,1)~+ @191 + Vienxay.PStealth1 // ~Can you give me any tips about Stealth?~
+~RandomNum(3,2)~+ @191 + Vienxay.PStealth2
+~RandomNum(3,3)~+ @191 + Vienxay.PStealth3
+~GlobalGT("X3VienTalk","GLOBAL",8)Global("X3VienWandTopic","GLOBAL",0)~+ @192 DO ~SetGlobal("X3VienWandTopic","GLOBAL",1)~ + Vienxay.PWand // ~Could you teach me the Shadow weave?~
+~Dead("X3VMAS")Global("X3VienLoversTopic","GLOBAL",0)~+ @436 DO ~SetGlobal("X3VienLoversTopic","GLOBAL",1)~ + Vienxay.PLovers /* Vienxay unique: Have you had lovers before Lacius? */

END 

IF ~~ Vienxay.PC1Advice 
SAY @176 // ~I think we should head to Nashkel. That's where the iron crisis is coming from, isn't it?~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PC2Advice 
SAY @177 // ~I suppose we may as well visit the mines, seeing as they are so close. But then we get back to *my* needs.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PC3Advice 
SAY @178 // ~The destruction of these bandits is what we should be doing. The money we would earn would be useful for our eventual task.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PC4Advice 
SAY @179 // ~We head to the forest. It is time for me to say hello and goodbye to my former Master.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PC5Advice 
SAY @180 // ~Tracking down your hunters, obviously. These constant assassination attempts must come to an end.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PC6Advice 
SAY @181 // ~Getting this dull task done as soon as possible.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PC7Advice 
SAY @182 // ~It's obvious what we need to do. Stop asking me stupid questions.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PCompanionThoughts 
SAY ~Which one exactly?~
// BG1
+~InParty("Ajantis")~+ @260 + Em.Ajantis
+~InParty("Alora")~+ @261 + Em.Alora
+~InParty("Branwen")~+ @262 + Em.Branwen
+~InParty("Coran")~+ @263 + Em.Coran 
+~InParty("Dynaheir")~+ @264 + Em.Dynaheir
+~InParty("Edwin")~+ @265 + Em.Edwin
+~InParty("Eldoth")~+ @266 + Em.Eldoth 
+~InParty("Faldorn")~+ @267 + Em.Faldorn 
+~InParty("Garrick")~+ @268 + Em.Garrick 
+~InParty("Imoen")~+ @269 + Em.Imoen 
+~InParty("Jaheira")~+ @270 + Em.Jaheira 
+~InParty("Kagain")~+ @271 + Em.Kagain
+~InParty("Khalid")~+ @272 + Em.Khalid 
+~InParty("Kivan")~+ @273 + Em.Kivan 
+~InParty("Minsc")~+ @274 + Em.Minsc 
+~InParty("Montaron")~+ @275 + Em.Montaron 
+~InParty("Quayle")~+ @276 + Em.Quayle 
+~InParty("Safana")~+ @277 + Em.Safana 
+~InParty("Sharteel")~+ @278 + Em.Sharteel
+~InParty("Skie")~+ @279 + Em.Skie 
+~InParty("Tiax")~+ @280 + Em.Tiax 
+~InParty("Viconia")~+ @281 + Em.Viconia 
+~InParty("Xan")~+ @282 + Em.Xan 
+~InParty("Xzar")~+ @283 + Em.Xzar 
+~InParty("Yeslick")~+ @284 + Em.Yeslick     
// EE 
+~InParty("Neera")~+ @285 + Em.Neera 
+~InParty("Rasaad")~+ @286 + Em.Rasaad 
+~InParty("Dorn")~+ @287 + Em.Dorn 
+~InParty("Baeloth")~+ @288 + Em.Baeloth 
// CrossMod Choices 
+~!Race("X3mily",AASIMAR)InParty("X3mily")~+ @289 + Em.Emily 
+~Race("X3mily",AASIMAR)InParty("X3mily")~+ @289 + Em.Emily2 
+~InParty("X3Kale")~+ @290 + Em.Kale 
+~InParty("c0aura")~+ @291 + Em.Aura 
+~InParty("C0Sirene")~+ @292 + Em.Sirene1 
+ ~InParty("L#1DVER")~ + @293 + Em.Verrsza
+~InParty("#Ishy")~+ ~Ishlilka.~ + Em.Ishy 
+~InParty("c0Drake")~+ ~Drake.~ + Em.Drake
+~InParty("X3Rec")~+ ~Recorder.~ + Em.Recorder
+~InParty("X3Helga")~+ ~Recorder.~ + Em.Helga
// Myself 
/* There are 4 versions of this:
High Reputation (13), High Approval.
Low Reputation (8), Low Approval. 
Low Reputation (8), High Approval. 
Low Approval, but Above 8 Reputation (Standard)
For now, just script high and low reputation*/
+~Race(Player1,ELF)~+ @294 + Vie.Me1 
+~!Race(Player1,ELF)~+ @294 + Vie.Me2
++ ~Nevermind~ EXIT  
END 

IF ~~ Em.Helga
SAY ~If she yaps about battle one more time...a dwarf can be so irksome.~
IF ~~ EXIT 
END 

IF ~~ Em.Recorder
SAY ~I suppose it is useful to have someone to record what you do around. If only she wasn't so righteous.~
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

IF ~~ Em.Ajantis 
SAY @295 // ~He's the type that judges what they don't understand. He annoys me, but if you can bear him, he's at least a useful meat shield.~ 
IF ~~ EXIT 
END 

IF ~~ Em.Alora
SAY @296 // ~I can't stand halflings. Or pickpockets. Put both together, and you have a real pest.~
IF ~~ EXIT 
END 

IF ~~ Em.Branwen 
SAY @297 // ~Those of the human faiths are hardly interesting to me.~
IF ~~ EXIT 
END 

IF ~~ Em.Coran 
SAY @298 // ~I've respect for my kin, and his talents with the bow are useful for our group.~
IF ~~ EXIT 
END 

IF ~~ Em.Dynaheir 
SAY @299 // ~She's unnecessary. You only need one mage: Me.~
IF ~~ EXIT 
END 

IF ~~ Em.Edwin 
SAY @300 // ~A worthy rival. One day I will duel him and show him why I am superior.~
IF ~~ EXIT 
END 

IF ~~ Em.Eldoth 
SAY @301 // ~He's not bad, for a human. But he will be disappointed if he attempts to strike a physical relationship with me.~ 
IF ~~ EXIT 
END 

IF ~~ Em.Faldorn 
SAY @302 // ~A sensible human. And sensible is rare. Sensible humans more so.~
IF ~~ EXIT 
END 

IF ~~ Em.Garrick 
SAY @303 // ~He's useless. If we want to hear awful music, we can just step into an inn for an hour.~
IF ~~ EXIT 
END 

IF ~~ Em.Imoen 
SAY @304 // ~I don't know why she's here. Her lack of experience will get her killed.~
IF ~~ EXIT 
END 

IF ~~ Em.Jaheira 
SAY @305 // ~She's a mutt. A very irksome mutt.~
IF ~~ EXIT 
END 

IF ~~ Em.Kagain 
SAY @306 // ~Don't tell him I said it, but his company is pleasant. I do enjoy a dwarf to hurl insults at.~
IF ~~ EXIT 
END 

IF ~~ Em.Khalid 
SAY @307 // ~Useless Coward. And a mutt. He's worse than a stray dog.~
IF ~~ EXIT 
END 

IF ~~ Em.Kivan
SAY @308 // ~I respect him. A man who seeks action for those who wronged him. More people should be like him.~
IF ~~ EXIT 
END 

IF ~~ Em.Minsc 
SAY @309 // ~The man is trouble in the head. Why is trouble walking with us?~
IF ~~ EXIT 
END 

IF ~~ Em.Montaron 
SAY @310 // ~He's different than most halflings. I almost find him tolerable.~    
IF ~~ EXIT 
END 

IF ~~ Em.Quayle 
SAY @311 // ~He's so dumb. DUMB.~
IF ~~ EXIT 
END 

IF ~~ Em.Safana 
SAY @312 // ~A human who understands how to get what she wants. Respectable enough.~
IF ~~ EXIT 
END 

IF ~~ Em.Sharteel 
SAY @313 // ~If there were more women like her, men wouldn't exist. She is that competent.~ 
IF ~~ EXIT 
END 

IF ~~ Em.Skie 
SAY @314 // ~She is everything wrong with human nobility. Elves are far more classy and graceful in the upper classes, while not being glassy and useless.~
IF ~~ EXIT 
END 

IF ~~ Em.Tiax 
SAY @315 // ~You brought an insane gnome into our party. I am wondering if  you are also insane.~
IF ~~ EXIT 
END 

IF ~~ Em.Viconia 
SAY @316 // ~I'd normally protest the presence of a drow. But she is...interesting.~
IF ~~ EXIT 
END 

IF ~~ Em.Xan 
SAY @317 // ~He's refreshing. We should travel with more elves, you get positive results.~
IF ~~ EXIT 
END 

IF ~~ Em.Xzar 
SAY @318 // ~A human necromancer with a dreadful demeanor. You are an idiot for welcoming him in our party.~
IF ~~ EXIT 
END 

IF ~~ Em.Yeslick 
SAY @319 // ~Typical dwarf. And I do not like a typical dwarf.~ 
IF ~~ EXIT 
END 

IF ~~ Em.Neera
SAY @320 // ~A mutt who wields unpredictable power. You are better off with me serving your mage needs without her.~
IF ~~ EXIT 
END 

IF ~~ Em.Dorn 
SAY @321 // ~Orcs are typically...unlikeable, half or otherwise but Dorn is an appreciative work of power.~
IF ~~ EXIT 
END 

IF ~~ Em.Rasaad 
SAY @322 // ~A monk. Punching is not going to get us very far with your enemies, <CHARNAME>. Let the primitive human stay in his monasteries.~
IF ~~ EXIT 
END 

IF ~~ Em.Baeloth 
SAY @323 // ~He's a drow. We don't need a drow to be our mage, when I am plenty useful already.~
IF ~~ EXIT 
END 

IF ~~ Em.Emily
SAY @324 // ~A mutt who wants to play archer. And a noble idealist at that. Ugh.~
IF ~~ EXIT 
END 

IF ~~ Em.Emily2
SAY @341 // ~I'll admit I underestimated her. An Aasimar with us? I can almost ignore that she's a mutt now.~
IF ~~ EXIT 
END 

IF ~~ Em.Kale 
SAY @325 // ~An annoying halfling. We should just forbid shorties from joining us at all.~
IF ~~ EXIT 
END 

IF ~~ Em.Aura
SAY @326 // ~Artifice is inferior to magic, and she's got a hideously large nose. You must have taken her out of pity.~
IF ~~ EXIT 
END 

IF ~~ Em.Sirene1 
SAY @327 // ~She'd be more useful if she embraced her power and stopped with the ridiculous idealism approach.~
IF ~~ EXIT 
END 

IF ~~ Em.Verrsza 
SAY @329 // ~You bring a being of great power on your adventures. Our success is even more assured.~
IF ~~ EXIT 
END 
 
IF ~~ Vie.Me1 
SAY @330 // ~You're an elf, and I tolerate you for that. No need to concern yourself.~  
IF ~~ EXIT 
END 

IF ~~ Vie.Me2 
SAY @331 // ~You're an inferior. But so long as you respect me, we will get along just fine.~ 
IF ~~ EXIT 
END 

IF ~~ Vienxay.PT1
SAY @215  // ~Are you expecting a tale of joy, <CHARNAME>?~ 
= @216 // ~They sailed me in chains like a common criminal through the mist that blinds non-elven sailors, and let me off at the first port on the larger continent.~ 
= @217 // ~They were kind enough to let me have the clothes on my back and a sum of gold to make my way, a fraction of the riches stored in my home.~
= @218 // ~They echoed my sentence of no return for elves that I did not kill, and I was left to fend for myself. I ate slop from inns like a common peasant, stirring in rage, until news of my master led me here.~
++ @219 + Vienxay.PT1Sorry  // ~I'm sorry for what you went through.~
++ @220 + Vienxay.PT1Scared // ~You must have been scared.~
++ @221 + Vienxay.PT1Scared // ~You seem to be all right now, at least.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT1Sorry 
SAY @222 // ~Sorry is useless and does *nothing* for me. Leave your pity for lesser people, I'll speak no more of this.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PT1Scared 
SAY @223 // ~I am strong. I am Vienxay Starlight, not some doe-eyed naive girl. The skills I learned in Evermeet helped me gradually get used to my fate.~
= @224 // ~Still, the world around me is inadequate. I will have to find a better life for myself, but for now, revenge suits me just as well.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PT2
SAY @231 // ~My parents were in charge of finance, and advised on the spending of the very court and council of Evermeet.~
= @232 // ~My father was brilliant with money, though less with people. My mother's assistance helps elevate his reach and influence, with her way with words.~
= @233 // ~Naturally, I take more to my mother myself, though I'd rather serve my own interests.~
++ @234 + Vienxay.PT2Selfish // ~You do seem selfish.~
++ @235 + PT2Fine // ~They seem fine people.~
++ @236 + PT2Boring // ~Your life sounds a little boring, it's surprising what you turned out to be.~
++ @237 + PT2Suprising // ~That's surprising, I was expecting something else.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END

IF ~~ Vienxay.PT2Selfish
SAY @238 // ~You say the word selfish as if it is a bad thing.~  
= @239 // ~Queens and Kings take the throne because they desire it, grappling others to their cause.~
= @227 // ~The merchant sets up his business because he wants to set up his business.~
= @228 // ~And the bandit is on the road pillaging because he believes that is the best way to make his life. Clearly he isn't asking others.~
= @229 // ~So I will happily accept selfish as a descriptor, and take it as a compliment.~
++ @230 + Vienxay.PT2Okay // ~Ooookay.~  
++ @240 + Vienxay.PT2Okay // ~I did not mean to ire you.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END

IF ~~ Vienxay.PT2Okay 
SAY @241 // ~Now, we have other things to do, don't we?~
IF ~~ EXIT 
END 

IF ~~ PT2Fine
SAY @242 // ~Of course they're fine people. Their descendants even finer.~
IF ~~ + Vienxay.PT2Okay
END 

IF ~~ PT2Boring 
SAY @243 // ~Are you insulting them? I don't entirely disagree with boring, but do watch your remarks.~
= @244 // ~I suppose that is why it made it easy to be compelled by my master's offering of learning and power, a draw to something more interesting.~
IF ~~ +Vienxay.PT2Okay
END 

IF ~~ PT2Suprising
SAY @245 // ~Yes, well I hardly care what else you expected, that is what they are. Obviously, I am far more interesting person, as you know.~
IF ~~ +Vienxay.PT2Okay
END

IF ~~ Vienxay.PT3
SAY @250 // ~He was an apprentice like myself. Lured in with the promises she made.~
= @251 // ~At first he was just competition to me. So I did everything in my power to be the first to grasp Shadow Magic.~
= @252 // ~I used my skills to charm my way into his chambers. I had thought he had notes of worth.~
= @253 // ~He had nothing of value, except his own body.~
++ @254 + PT3Body // ~His own body?~
+~Dead("X3VAPR")~+ @255 + PT3Dead1 // ~I still don't understand why you wanted Lacius dead.~
+~!Dead("X3VAPR")~+ @255 + PT3Dead2 // ~I still don't understand why you wanted Lacius dead.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ PT3Body 
SAY @257 // ~He was good in bed. He knew how to please a lady. I've had many lovers before, and he was better than most of them.~
++ @254 + PT3Body1 // ~That is...more than I needed to know.~
+~Race(Player1,ELF)Gender(Player1,Male)~+ @246 + PT3Body2 // ~Better than most? You haven't had me yet.~
+~!Race(Player1,ELF)Gender(Player1,Male)~+ @246 + PT3Body3 // ~Better than most? You haven't had me yet.~
+~Gender(Player1,Female)~+ @246 + PT3Body4 // ~Better than most? You haven't had me yet.~
+~Dead("X3VAPR")~+ @255 + PT3Dead1 // ~I still don't understand why you wanted Lacius dead.~
+~!Dead("X3VAPR")~+ @255 + PT3Dead2 // ~I still don't understand why you wanted Lacius dead.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ PT3Dead1 
SAY @247 // ~I killed him because he knew the truth and said nothing. I asked him to support me. But he supported our master instead, and his input saw me condemned.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ PT3Dead2 
SAY @248 // ~I wanted to kill him because he knew the truth and said nothing. I asked him to support me. But he supported our master instead, and his input saw me condemned. And now he is spared.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ PT3Body1 
SAY @258 // ~People are such prudes outside of Evermeet.~
+~Dead("X3VAPR")~+ @255 + PT3Dead1 // ~I still don't understand why you wanted Lacius dead.~
+~!Dead("X3VAPR")~+ @255 + PT3Dead2 // ~I still don't understand why you wanted Lacius dead.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ PT3Body2 
SAY @256 // ~Is that confidence you show, kin? It suits you. Perhaps one day it may even reward you.~ 
+~Dead("X3VAPR")~+ @255 + PT3Dead1 // ~I still don't understand why you wanted Lacius dead.~
+~!Dead("X3VAPR")~+ @255 + PT3Dead2 // ~I still don't understand why you wanted Lacius dead.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ PT3Body3
SAY @249 // ~And you'll be left wondering. I've no interest in your kind, and would never risk diluting my bloodline.~
+~Dead("X3VAPR")~+ @255 + PT3Dead1 // ~I still don't understand why you wanted Lacius dead.~
+~!Dead("X3VAPR")~+ @255 + PT3Dead2 // ~I still don't understand why you wanted Lacius dead.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ PT3Body4 
SAY @259 // ~You lack the proper equipment, <CHARNAME>. I wouldn't ever be interested, I am more strict in my desires than some of my kin.~
+~Dead("X3VAPR")~+ @255 + PT3Dead1 // ~I still don't understand why you wanted Lacius dead.~
+~!Dead("X3VAPR")~+ @255 + PT3Dead2 // ~I still don't understand why you wanted Lacius dead.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT4
SAY @332 // ~She was ambitious, confident, and a master of deception. No one would have second-guessed her true nature.~
= @333 // ~She played herself as a merchant, selling all sorts of goods that bought up interest. People like myself and Lacius wished to know more about the items, and she talked to us privately.~
= @334 // ~She spun the idea of business and contacts, and power and magic. I was too good of an offer to refuse. In retrospect, it was too good of an offer.~
++ @335 + Vienxay.PT4Clever // ~She seems very clever.~
++ @336 + Vienxay.PT4Here // ~If she's here now, do you think her operations in Evermeet were found out?~
++ @337 + Vienxay.PT4Foolish // ~You were foolish to trust her.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT4Clever 
SAY @338 // ~She was very clever. I admire that in her even if I hate her for what she did to me.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 


IF ~~ Vienxay.PT4Here
SAY @339 // ~I hope so. There would be far less chance of her retreating to the one place I could not chase her. But it would be doubtful Evermeet would ever see me innocent, regardless.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT4Foolish
SAY @340 // ~It is easy for you to say. Just try not repeating the same mistake I did before needlessly judging me.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT5 
SAY @207 // ~What, do you think I was tempted to? Well, I was tempted to, I admit. It's power unfortunately has drawbacks, and I am not keen on angering Mystra, who has my devotions.~
++ @208 + Vienxay.PT5Mystra // ~You pray to Mystra, then?~
++ @209 + Vienxay.PT5Draw // ~What are the drawbacks?~
++ @210 + Vienxay.PT5Used // ~So you never used it?~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
END 

IF ~~ Vienxay.PT5Mystra
SAY @211 // ~Obviously. She and the Seldarine, though they have heard from me less, given my circumstances.~
++ @209 + Vienxay.PT5Draw // ~What are the drawbacks?~
++ @210 + Vienxay.PT5Used // ~So you never used it?~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 



IF ~~ Vienxay.PT5Draw
SAY @212 // ~You use your own essence in some spells. Weakening yourself for Shar in exchange for her boon of power.
++ @213 + Vienxay.PT5Used // ~You speak like you've used it before.~ 
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT5Used
SAY @214 // ~Once...but I will never again. And we will not talk about this further.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PT6
SAY @396 // ~That is a stupid question.~ 
IF ~Dead("X3VMAS")~ + Vienxay.PT6Dead 
IF ~!Dead("X3VMAS")~ + Vienxay.PT6Alive 
END 

IF ~~ Vienxay.PT6Dead 
SAY @397 // ~I feel happier than I have in a long time. Justice, *finally*. What Evermeet could not give me, you did, and you will have my gratitude for that, for a long time.~
+~Race(PLayer1,ELF)~+ @398 + Vienxay.PT6Elf // ~Thank you, I appreciate that.~
+~!Race(PLayer1,ELF)~+ @398 + Vienxay.PT6NonElf // ~Thank you, I appreciate that.~
+~Race(PLayer1,ELF)~+ @399 + Vienxay.PT6Elf // ~It was nothing.~
+~!Race(PLayer1,ELF)~+ @399 + Vienxay.PT6NonElf // ~It was nothing.~
++ @400 + Vienxay.PT6Right // ~I didn't do it for you, I did it because it was the right thing to do.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT6Right 
SAY @401 // ~Then I am glad our goals aligned to get this deed done.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT6Elf 
SAY @402 // ~It has been too long since another Tel'Quessir has supported this much. I truly mean it when I say thank you.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT6NonElf 
SAY @403 // ~One of your kind has never done so much for me, at such risk. I truly mean it when I say thank you.~
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT6Alive 
SAY @401 // ~I am angry that I did not get my justice. I accept it was meaningless, but it does not sate my rage.~
= @402 // ~I will talk no more of it. Bark your orders, I imagine we have things to do.~
IF ~~ EXIT 
END 

IF ~~ Vienxay.PT7
SAY @437 // ~There are, I admit, other elven sanctuaries I could seek and call home.~
= @438 // ~Many would likely reject me if they learned the truth, but it is an option.~
++ @439 + Vienxay.PT7Happy // ~I just want you to be happy.~
++ @440 + Vienxay.PT7Stay // ~You could also stay with me, adventuring.~
++ @441 + Vienxay.PT7Happy // ~You won't know unless you try.~
++ @442 + Vienxay.PT7Happy // ~Just offering advice.~ 
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT7Happy
SAY @443 // ~The restoration of my rightful place in Evermeet would make me happy, and little else.~
= @444 // ~But thank you for your half-useful advice.~
++ @440 + Vienxay.PT7Stay// ~You could also stay with me, adventuring.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PT7Stay
SAY @445 // ~Admittedly, your company has been pleasant enough.~
= @446 // ~I suppose it will be an option I take until I see a better one.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PLovers 
SAY @447 // ~Dozens. I have emotional and physical needs, rarely have I gone long without a lover.~
++ @448 + Vienxay.PExpect // ~That is very surprising that you would have any lovers at all.~
++ @449 + Vienxay.Male // ~Are they all male?~
++ @450 + Vienxay.Regret // ~I regret bringing up this topic.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PExpect 
SAY @451 // ~Why? I am very good at enticing and pleasing. It is a game, and the winner is everyone so long as you know when to wait and when to give in.~
= @452 // ~I could teach you a few things, on how be as good a lover and seducer as I if that is your desire.~
+~Gender(Player1,Male)Race(Player1,Elf)~+ @454 + Vienxay.PTMale // ~You mean...together?~
+~Gender(Player1,Female)Race(Player1,Elf)~+ @454 + Vienxay.PTFemale // ~You mean...together?~
+~!Race(Player1,Elf)~+ @454 + Vienxay.PTNotElf // ~You mean...together?~
++ @457 + Vienxay.WhyNot // ~Sure, why not?~ 
++ @455 + Vienxay.Lust// ~I'd rather a relationship, not a lustful episode.~
++ @450 + Vienxay.Regret // ~I regret bringing up this topic.~
END 

IF ~~ Vienxay.PTMale 
SAY @456 // ~Well. I have done such arrangements before for the desperate to impress, tempting as it is. But there is hardly a place for it. I'd just give you spoken advice.`
++ @457 + Vienxay.WhyNot // ~Sure, why not?~ 
++ @455 + Vienxay.Lust// ~I'd rather a relationship, not a lustful episode.~
++ @450 + Vienxay.Regret // ~I regret bringing up this topic.~
END 

IF ~~ Vienxay.PTFemale 
SAY @458 // ~No. This would just be advice. You hardly have the equipment for such anyway.~
++ @457 + Vienxay.WhyNot // ~Sure, why not?~ 
++ @455 + Vienxay.Lust// ~I'd rather a relationship, not a lustful episode.~
++ @450 + Vienxay.Regret // ~I regret bringing up this topic.~
END 

IF ~~ Vienxay.PTNotElf 
SAY @459 // ~Goodness, no! Disgusting. Just spoken advice.~
++ @457 + Vienxay.WhyNot // ~Sure, why not?~ 
++ @455 + Vienxay.Lust// ~I'd rather a relationship, not a lustful episode.~
++ @450 + Vienxay.Regret // ~I regret bringing up this topic.~
END 

IF ~~ Vienxay.Lust 
SAY @460 // ~Suit yourself.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.WhyNot 
SAY @461 // ~Excellent. You will come away knowing how to please and get what you want all the more. But let's wait until your little crisis is over for such talk.
= @462 // ~It'd be silly to tell you how to seduce when it will hardly benefit you against people who want you dead.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.Regret 
SAY @452 // ~Yes, such is the reaction I'd expect from people outside of Evermeet. Such prudes.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.Male 
SAY @392 // ~I've had my brief curiosities and drunken incidents, but excluding those all were certainly male. It is my preference, my attraction, and they please me best.~
++ @448 + Vienxay.PExpect // ~That is very surprising that you would have any lovers at all.~
++ @450 + Vienxay.Regret // ~I regret bringing up this topic.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PHaughty
SAY @342 // ~Why am I always so Haughty? What kind of question is this?~
= @343 // ~I act as I should. I am a noble, thus better than most. I am an elf, thus better than all other races. I should be asking you why you aren't treating me with more reverence.~
++ @344 + Vienxay.PTGrow // ~It's starting to grow on me.~
++ @345 + Vienxay.PTElf // ~Why can't you be a normal elf?~
++ @346 + Vienxay.PTCharge // ~You are not my superior. Don't forget who is in charge, here.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTGrow
SAY @347 // ~Truly? The feeling is somewhat mutual, I suppose.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTElf
SAY @348 // ~Please, a normal elf? I am also a noble elf, a mage, and gifted with shadow magic. I am better than a normal elf.
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTCharge
SAY @349 // You fret needlessly. There will be no usurpation of your leadership. Although I would be better at it.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PWand 
SAY @195 // ~I am certain I said that the luxury of time does not exist for this. Besides...~
IF ~Class(Player1,MAGE_ALL)Alignment(Player1,MASK_GOOD)~ + Vienxay.PTeach1
IF ~Class(Player1,MAGE_ALL)!Alignment(Player1,MASK_GOOD)~ + Vienxay.PTeach2 
IF ~!Class(Player1,MAGE_ALL)~ + Vienxay.PTeach3 
END 

IF ~~ Vienxay.PTeach1 
SAY @196 // ~It is not for you. Your heart is...kind. Thoughtful. Traits I find exasperating, and surely the Shadow Weave would find the same.~
IF ~~ + Vienxay.PTeachNo 
END 

IF ~~ Vienxay.PTeach2 
SAY @197 // ~While you have the capacity to learn the Shadow Weave, there are risks for you and I, and unlike my Master I do not wish to touch her teachings again. Not even for a student.~
IF ~~ + Vienxay.PTeachNo 
END 

IF ~~ Vienxay.PTeach3 
SAY @198 // ~You are not even a mage. It would be a waste of time.~
IF ~~ + Vienxay.PTeachNo 
END 

IF ~~ Vienxay.PTeachNo
SAY @199 // ~No, I will not teach you.~
+~Kit(Player1,SHADOWDANCER)~+ @206 + Vienxay.PTeachShadow // ~What about your thieving talents, your ability to slip in shadow at will?~
+~Class(Player1,THIEF_ALL)!Kit(Player1,SHADOWDANCER)~+ @206 + Vienxay.PTeachNo1 // ~What about your thieving talents, your ability to slip in shadow at will?~
+~!Class(Player1,THIEF_ALL)~+ @206 + Vienxay.PTeachNo2 // ~What about your thieving talents, your ability to slip in shadow at will?~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTeachShadow
SAY @533 // ~You already know as much as I do. I may do the technique more flawlessly, but I am sure you can improve on your own.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTeachNo1
SAY @534 // ~My talent in shadows is innate and guided by my former mentor. Yours is not, and I cannot help you.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 

IF ~~ Vienxay.PTeachNo2 
SAY @535 // ~You're not like I. There is nothing I can teach you.~
++ @205 + Vienxay.PTalk // ~Let's talk about something else.~ 
++ @204 EXIT // ~Let's keep moving.~
END 


IF ~~ Vienxay.PStealth1
SAY @332 // ~You want advice? Stop talking to me and be quiet.~
IF ~~ EXIT 
END

IF ~~ Vienxay.PStealth2
SAY @333 // ~Magic can enhance stealth beyond mundane means. But lacking that, quality equipment can make up for deficencies.~
IF ~~ EXIT 
END

IF ~~ Vienxay.PStealth3
SAY @334 // ~If you had any hope in the art, you wouldn't be asking me.~
IF ~~ EXIT 
END

END  