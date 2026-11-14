
// Drake 
CHAIN IF ~InParty("X3Vien")
InParty("C0Drake")
See("C0Drake")
!StateCheck("X3Vien",CD_STATE_NOTVALID)
!StateCheck("C0Drake",CD_STATE_NOTVALID)
Global("CrossDraVien","LOCALS",0)~ THEN X3VienB VienDrake1
@0
DO ~SetGlobal("CrossDraVien","LOCALS",1)~
== BC0Drake @1
== X3VienB @2
== BC0Drake @3
== X3VienB @4
== BC0Drake @5
== X3VienB @6
== BC0Drake @7
EXIT
