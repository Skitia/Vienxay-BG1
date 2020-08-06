// BG Enhanced Edition Characters Banters.

// Baeloth

CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Baeloth",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienBaeloth1","GLOBAL",0)~ THEN BBAELOTH X3VienBaeloth1
@0 // ~Speak up, speak up! You obviously want to say something, Vienxay.~
DO ~SetGlobal("X3VienBaeloth1","GLOBAL",1)~
== X3VienB @1 // ~I've no desire to speak to you at all. We are taught to kill your kind, not tolerate it.~
== BBAELOTH @2 // ~What's stopping you? Go on ahead.~
== X3VienB @3 // ~I've no desire to listen to the complaining of <CHARNAME>. And your magic is undeniable useful for the party, for now.~
== X3VienB @4 // ~When that ceases to be however, I may fulfill your wish.~
EXIT

// Dorn
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Dorn",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienDorn1","GLOBAL",0)~ THEN %DORN_BANTER% X3VienDorn1
@3 // ~Your power is not what I expected for an elf.~
DO ~SetGlobal("X3VienDorn1","GLOBAL",1)~
== X3VienB @4 // ~There are not many of us who delve into Shadow Magic and the general practice of the Weave together.~
== %DORN_BANTER% @5 // ~You are also very good at killing.~
== X3VienB @6 // ~Of course I am. I know every way to eviscerate my foes. I could even teach you some new ones.~
== %DORN_BANTER% @7 // ~Ha. Arrogant.~
== X3VienB @8 // ~It is deserved. I am simply superior.~
EXIT

// Neera
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienNeera1","GLOBAL",0)~ THEN %NEERA_BANTER% X3VienNeera1
@9 // ~Vienxay, if you mutter something about mutt one more time...~
DO ~SetGlobal("X3VienNeera1","GLOBAL",1)~
== X3VienB @10 // ~I am entirely content with not talking to you...and instead talking about you.~
== %NEERA_BANTER% @11 // ~How do you make any friends at all?~
== X3VienB @12 // ~By having predictable, useful magic that doesn't get them killed.~
EXIT

// Rasaad

CHAIN IF ~InParty("Rasaad")
See("Rasaad")
!StateCheck("Rasaad",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienRasaad1","GLOBAL",0)~ THEN X3VienB X3VienRasaad1
@13 // ~Punching your foes. It's rather primitive. Can't you be a soldier like every other human?~
DO ~SetGlobal("X3VienRasaad1","GLOBAL",1)~
== %RASAAD_BANTER% @14 // ~I will forgive your lack of understanding of the principles of the monastic way, Vienxay. The body is a weapon of its own.~
== X3VienB @15 // ~We are far beyond the necessity of such. Weapons, magic. Get with the times.~
== %RASAAD_BANTER% @16 // ~Perhaps you would like a lesson to learn more of what you scold of so ignorantly?~
== X3VienB @17 // ~Of course not. I'm content to scold without any information.~
EXIT

// DORN 2 
CHAIN IF ~InParty("Dorn")
See("Dorn")
!StateCheck("Dorn",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienDorn1","GLOBAL",1)~ THEN X3VienB X3VienDorn2
@18 // ~I will admit, Dorn. You are an equal to my own ability. Not bad, for an orc.~
DO ~SetGlobal("X3VienDorn1","GLOBAL",2)~
== %DORN_BANTER% @19 // ~That seems a half compliment, elf.~
== X3VienB @20 // ~Take it as it is. Most orcs I find displeasing. You're more pleasant than the humans.~
== X3VienB @21 // ~Though given how annoying they are, perhaps it is not a difficult feat.~
EXIT 

// Neera 2
CHAIN IF ~InParty("Neera")
See("Neera")
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienNeera1","GLOBAL",1)~ THEN X3VienB X3VienNeera2
@22 // ~Mutt, you have piqued my curiosity with your display of power, how does one learn wild magic?~
DO ~SetGlobal("X3VienNeera1","GLOBAL",2)~
== %NEERA_BANTER% @23 // ~It's a commitment to a practice. One that is very difficult to exit once you've started.~ 
== X3VienB @24 // ~So I suppose anyone can do it?~
== %NEERA_BANTER% @25 // ~Not anyone. Nor should anyone. I would be very worried if you started casting wild magic.~
== X3VienB @26 // ~Jealousy doesn't look good on you, mutt.~
== %NEERA_BANTER% @27 // ~Actually, I'd have a laugh if you transformed yourself into a cow. If you want to learn, I'm not stopping you.~
EXIT 

// DORN 3 
CHAIN IF ~InParty("X3vien")
See("X3vien")
!StateCheck("Dorn",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienDorn1","GLOBAL",2)~ THEN %DORN_BANTER% X3VienDorn3
@28 // ~You had the opportunity to learn the shadow weave. Why did you not take it?~
DO ~SetGlobal("X3VienDorn1","GLOBAL",3)~
== X3VienB @29 // ~Shar's weave is not to be undertaken lightly. Some power is not worth the price.~
== %DORN_BANTER% @30 // ~Price often can be mitigated.~
== X3VienB @31 // ~Only if the consequences are of no hindrance. That is not the case here.~ 
EXIT 

// Neera 3
CHAIN IF ~InParty("Neera")
See("Neera")
!StateCheck("Neera",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienNeera1","GLOBAL",2)~ THEN X3VienB X3VienNeera3
@32 // ~Mutt, if you are not more careful with your surging around me...~
DO ~SetGlobal("X3VienNeera1","GLOBAL",3)~
== %NEERA_BANTER% @33 // ~Vienxay, how many times do I have to say it...I am not a mutt.~ 
== X3VienB @34 // ~Shut up. I'm trying to protect the group's most prized asset. Myself.~
== %NEERA_BANTER% @35 // ~Oh wow. My eyes are rolling. Let me get a vote on that.~
EXIT 

//Rasaad 2 
CHAIN IF ~InParty("Rasaad")
See("Rasaad")
!StateCheck("Rasaad",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienRasaad1","GLOBAL",1)~ THEN X3VienB X3VienRasaad2
@36 // ~I've used Shar's weave, Rasaad. Does this disturb you?~
DO ~SetGlobal("X3VienRasaad1","GLOBAL",2)~
== %RASAAD_BANTER% @37 // ~You aim to make me react. But I see your light, Vienxay. You do not continue this practice. You have learned.~
== X3VienB @38 // ~Yes, well that is beside the point. The point is that I have used it. And it is superior, if far more dangerous than the normal weave.~
== %RASAAD_BANTER% @39 // ~And yet you have been enlightened that the darkness's seduction is not to be embraced. It is commendable.~
== X3VienB @40 // ~Ugh, you are impossible. I only want to aggravate you!~
EXIT 
 
