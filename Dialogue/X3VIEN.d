// Vienxay's Join/Rejoin Dialogue File

BEGIN X3VIEN

//Vienxay spawns in the Friendly Arm Inn, on the second floor.

CHAIN IF ~Global("X3VIENmet","GLOBAL",0)~ THEN X3VIEN b1
//These @ lines refer to our Translation File. // Will show current text, though translation file is the most accurate line
@0 // Excuse me!
DO ~SetGlobal("X3VIENmet","GLOBAL",1)~ 
= @1 // You look more competent than the rest of the commoners around here. I need aid to help track someone!
END

// I could go with EXTERN or + after the PC dialog, but I think EXTERN is more clear. May switch chaotically from double slash to  slash star, but it really is the same. //

++ @2 /* ~My lady, speak of who eludes you, and I will gladly aid.~ */ EXTERN X3VIEN b1.1
++ @3 /*Tell me about this person, and what I get for helping you with them. */ EXTERN X3VIEN b1.1
++ @4 /*I'm not interested. I have far more important things to do. */ EXTERN X3VIEN b1.2

// Let's Set up the Rejection Path first (.2 and .3) //

CHAIN X3VIEN b1.2
@5 /* What? No, hear me out first, I demand it! */
END
++ @6 /* All right. I'm listening. */ EXTERN X3VIEN b1.1
++ @7 /* ~You demand it? I think we're done here.~ */ EXTERN X3VIEN b1.3

CHAIN X3VIEN b1.3
@8 /* *Huff* Commoners! */
EXIT

// Let's now set up the Join Path //
CHAIN X3VIEN b1.1
@9 /* ~ I am Vienxay, and I am chasing a mage that completely ruined my family and framed me for murder. Now I'm exiled from evermeet and stuck traveling in these icky common human lands because of that witch.~ */
= @10 /*My trail leads me to a former lover and fellow apprentice of mine, who is in Nashkel. She may be there as well, if he still serves her.*/
END
+~Race(Player1,ELF)~+ @11 /* I've never been to Evermeet, but heard stories. I can understand your shame. */ EXTERN X3VIEN b1.4
+~!Race(Player1,ELF)~+ @12 /* I take offense to that, elf. */ EXTERN X3VIEN b1.5
++ @13 /* And what do I get in turn? */ EXTERN X3VIEN b1.6
++ @14 /* Say no more. You have my assistance. */ EXTERN X3VIEN b1.7
++ @15 /*I'm not interested. You are on your own.*/ EXTERN X3VIEN b1.3

CHAIN X3VIEN b1.4
@16 /* ~I'm glad you understand. Will you help me?~ */
END
++ @14 /* ~Say no more. You have my assistance. ~ */ EXTERN X3VIEN b1.7
++ @13 /* ~And what do I get in turn?~ */ EXTERN X3VIEN b1.6
++ @15 /* ~I'm not interested. You are on your own.*/ EXTERN X3VIEN b1.3

CHAIN X3VIEN b1.5
@17 /* ~Whatever! Will you help me or not?!~ */
END
++ @18 /* I don't like your tone, but mind your tongue, and you'll have my aid. */ EXTERN X3VIEN b1.7
++ @13 /* ~And what do I get in turn? */ EXTERN X3VIEN b1.3
++ @19 /* You have my assistance. */ EXTERN X3VIEN b1.7
++ @15 /* ~I'm not interested. You are on your own.*/ EXTERN X3VIEN b1.3

CHAIN X3VIEN b1.6
@20 /* ~I am more than just a refined lady. I possess great talent with stealth and Mystra's art. I can aid you on your own travels.~ */
END
++ @14 /* ~Say no more. You have my assistance. ~ */ EXTERN X3VIEN b1.7
++ @15 /* ~I'm not interested. You are on your own.*/ EXTERN X3VIEN b1.3

CHAIN X3VIEN b1.7
@21 /* ~You will not regret this commoner. I'm even all packed. I tire of this dull place and it's lack of entertainment. Now please, let's be off.~ */
DO ~AddJournalEntry(@10021,QUEST)
JoinParty()~ // Welcome to the party, Vienxay! //
EXIT

// I didn't really need to use CHAIN for this part, but if I decide to add NPC comments later, it can be useful. Do need to add append since I'm going to switch to SAY for the rest. //
APPEND X3VIEN

IF ~Global("X3VIENMet","GLOBAL",1)~ b2 
SAY @30 /* ~Please tell me you have changed your mind. I am tired of idleness.~ */
++ @31 /* ~I have. Join us.~ */ + b1.7
++ @32 /* ~Not at the moment.~ */ + b1.3
END 

// Remember that APPEND needs its own END //
END

