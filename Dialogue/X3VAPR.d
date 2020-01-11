BEGIN X3VAPR

CHAIN IF ~IsValidForPartyDialog("X3Vien")
Global("X3VienApprenticeTalk","GLOBAL",0)~ THEN X3VAPR Apr1
@0 // ~Can't you see I'm enjoying my drink, here?~
DO ~SetGlobal("X3VienApprenticeTalk","GLOBAL",1)~
== X3VienJ @1 // ~Don't recognize me, idiot "sweetheart"?
== X3VAPR @2 // ~Vienxay?! What...what are you doing here?~
== X3VienJ @3 // ~Tracking down our old master, Lacius. Now talk before I spill your guts on the floor.~
END
++ @4 EXTERN X3VAPR Apr2  // ~Let me handle this, Vienxay.~ 
++ @5 EXTERN X3VienJ Apr3 // ~You best answer her questions.~
++ @6 EXTERN X3VAPR Apr2 // ~There's no need to threaten him.~ 
++ @7 EXTERN X3VienJ Apr3 // ~Just hurry up and get what you need from him.~

CHAIN X3VAPR Apr2
@8 // ~I'm not involved anymore with her, honest! She left me a letter to go see her in the Cloakwood, she's collecting regents and components from the Shadow Druids, but I'm done serving her.~
== X3VAPR @9 // ~I didn't know what she was until it was too late, and I didn't dare leave her when Evermeet began to get suspicious after Vienxay's exile.~
== X3VAPR @10 // ~You've got to believe me.~
== X3VienJ @11 // ~He's lying. I'm going to spill his guts for betraying me and sticking with the Sharran, Lacius.~
END 
++ @13 EXTERN X3VienJ Apr4 // ~Let him walk, Vienxay. He's not the big fish anyway.~
++ @14 EXTERN X3VienJ Apr4 // ~He's not the one who ultimately wronged you. You can go, Lacius.~
++ @15 EXTERN X3VAPR Death // ~I won't stop you, Vienxay.~
++ @16 EXTERN X3VAPR Death // ~Just make it quick.~


CHAIN X3VienJ Apr3 
@12 // ~Talk, Lacius. NOW.~
EXTERN X3VAPR Apr2

CHAIN X3VienJ Apr4 
@17 // ~The hells would I spare him?~
END 
++ @18 + Apr5 // ~Because I said NO, Vienxay.~
++ @19 + Apr5 // ~Because his crimes are insufficient.~
++ @20 + Apr5 // ~Because even if he hurt you, he is not the one that deserves death.~
++ @21 EXTERN X3VAPR Death //~You know what? Do as you please.~
++ @22 EXTERN X3VAPR Death //~I've changed my mind, go ahead.~

CHAIN X3VAPR Death 
@23 // ~No. No no no. Nooooo! Shar protect me!~
DO ~AddJournalEntry(@10023,QUEST)
Wait(1)
Enemy()~
EXIT 

CHAIN X3VienJ Apr5 
@24 // ~How I loath obeying your advice. Fine. Go, Lacius. I never loved you.~
EXTERN X3VAPR Flee 

CHAIN X3VAPR Flee 
@25 // ~You are not as heartless as you act. Thank you, Vienxay, and thank you stranger. I'll be leaving, and neither of you will hear from me again.~
DO ~AddJournalEntry(@10023,QUEST)
Wait(1)
EscapeArea()~
EXIT 