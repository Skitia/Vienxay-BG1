
// Drake 
CHAIN IF ~InParty("X3Vien")
InParty("C0Drake")
See("C0Drake")
!StateCheck("X3Vien",CD_STATE_NOTVALID)
!StateCheck("C0Drake",CD_STATE_NOTVALID)
Global("CrossDraVien","LOCALS",0)~ THEN X3VienB VienDrake1
~So I am to believe you are a human *noble*, as it were, Drake? I'm unconvinced.~
DO ~SetGlobal("CrossDraVien","LOCALS",1)~
== BC0Drake ~You are hardly the first, lady pointy-ears. My family was once of common birth. For my part, I find the whole 'nobility' concept to be pretentious.~
== X3VienB ~It is Lady Vienxay Starlight, not "pointy-ears", human. Unlike you, I demand respect and hold myself with dignity.~
== BC0Drake ~Dignity, eh? What's this about exile I hear, then?~
== X3VienB ~Over a misunderstanding. An error that will be corrected.~
== BC0Drake ~Is that so? I suppose it is your right to seek justice against this murderer that made you their scapegoat, then... *If* you truly are innocent, that is.~
== X3VienB ~Hrmph. Of course I am innocent. Still, I suppose you are more tolerable than most humans.~
== BC0Drake ~Ha! I've heard that one more than a few times as well. We'll see if it comes to last.~
EXIT
