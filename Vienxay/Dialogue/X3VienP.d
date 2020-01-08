BEGIN X3VienP

// Player kicking out Vienxay. Vienxay will not leave the party out of unhappiness despite moaning. 

IF ~Global("X3VienKickedOut","GLOBAL",0)~ kicked1
SAY @1 /*~You are an idiot. Getting rid of me?! I'm your most useful and high-class ally!~*/
++ @2 /*~I'm sorry, my mistake. Stay with me.~ */ DO ~JoinParty()~ EXIT
++ @3 /*Don't be offended. If I need you, I know to find you outside the Friendly Arm Inn.*/ DO ~SetGlobal("X3VienKickedOut","GLOBAL",1) EscapeAreaMove("%bg1_eet_symbol%2300",4012,2570,S)~ EXIT
++ @9 DO ~SetGlobal("X3VienKickedOut","GLOBAL",1)LeaveParty()~ EXIT // ~Stay here for now.~ 
END


// Vienxay previously kicked out, and not in party. 

IF ~Global("X3VienKickedOut","GLOBAL",1)~ kicked2
SAY @4 //~About time you come to your senses. You did come back to take me along, yes?~
++ @5 /*~I have. Join me.~*/ + b3.1
++ @6 /* ~Not at the moment.~*/ + b3.2
END 

IF ~~ b3.1
SAY @7 /* ~About time. Let's set off.~ */
IF ~~ DO ~SetGlobal("X3VienKickedOut","GLOBAL",0) JoinParty()~ EXIT
END

IF ~~ b3.2
SAY @8 /* ~Whatever.~ */
IF ~~ EXIT
END
