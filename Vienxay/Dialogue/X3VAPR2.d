BEGIN X3VAPR2 

CHAIN IF ~!InParty("X3Vien")~ THEN X3VAPR2 General
@0 // ~Careful in the forest. There are many delightful ways you can die here.~
EXIT 


CHAIN IF ~IsValidForPartyDialog("X3Vien")~ THEN X3VAPR2 PreAttack
@1 // ~If it isn't the exile. Come to beg for your place back to Master Luna?~
== X3VienJ @13 // ~I've come to slay her. Make it easy for us and tell us where she is.~
== X3VAPR2 @2 // ~I'd rather bring you and your ally's corpse to impress her. You stand little chance.~
END 
++ @3 EXTERN X3VienJ Listen  // ~Listen to Vienxay. There's no need for this to get rough.~
++ @4 EXTERN X3VienJ Full // ~Are all of you so full of yourselves?~
++ @5 EXTERN X3VAPR2 Fight// ~I've been wanting a fight.~
++ @6 EXTERN X3VAPR2 Spare // ~We just want to know where she is. Tell us and we'll spare you.~ 

CHAIN X3VienJ Listen 
@7 // ~Don't be ridiculous. Rough is exactly what she wants.~
== X3VAPR2 @8 // ~You know me so well.~
EXTERN X3VAPR2 Fight 

CHAIN X3VienJ Full 
@9 // ~Please, at least my arrogance is backed by compotence.~
== X3VAPR2 @10 // ~Delusional as ever. You haven't changed, Vienxay.~
EXTERN X3VAPR2 Fight 

CHAIN X3VAPR2 Spare 
@11 // ~Why would I want that? I will show your corpses where she is, though.~
EXTERN X3VAPR2 Fight 

CHAIN X3VAPR2 Fight 
@12 // ~Now, let's see how quick you will die.~ 
DO ~Enemy()AddJournalEntry(@10026,QUEST)~ 
EXIT 
