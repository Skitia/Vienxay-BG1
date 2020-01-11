

BEGIN X3VienB 
// Jaheria 1

CHAIN IF ~InParty("Jaheira")
See("Jaheira")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienJaheira","GLOBAL",0)~ THEN X3VienB X3VienJaheira1
@0 // Why do you keep glowering at me, mutt?
DO ~SetGlobal("X3VienJaheira","GLOBAL",1)~
== BJAHEI @1 // ~Your air of superiority falls flat, exile. I am not convinced you are entirely innocent in your banishment.~
== X3VienB @2 // ~Of course I am innocent. I was the victim.~
== BJAHEI @3 // ~Proclaiming and being are not the same, child.~
== X3VienB @4 // ~Child?! You weren't there! Nor would a mutt be welcome in Evermeet~
== BJAHEI @5 // ~Seems being unwelcome in Evermeet is the only thing we have in common.~
== X3VienB @6 // ~Ugh!~
EXIT

// Ajantis
CHAIN IF ~InParty("Ajantis")
See("Ajantis")
!StateCheck("Ajantis",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienAjantis1","GLOBAL",0)~ THEN X3Vien X3VienAjantis1
@7 // ~I see you giving me that look, paladin. Just get it out already.~
DO ~SetGlobal("X3VienAjantis","GLOBAL",1)~
== BAJANT @8 // ~Your magic is of the darkness. Our paths would conflict were it not for <CHARNAME>.
== X3VienB @9 // ~I am not actually drawing from the shadow weave. Shadow magic is not the same as Shadow weave magic, though many use both.~
== X3VienB @10 // ~Besides, it is only to aid my thieving, with nothing more but innate ability. This is far above your understanding, of course.~
== BAJANT @11 // ~If you lie, Vienxay, not even <CHARNAME> will stay my blade.~
== X3VienB @12 // ~Save your sword for those like my mentor, human. They are the shadow weavers you would want to slaughter.~
EXIT

// Alora
CHAIN IF ~InParty("Alora")
See("Alora")
!StateCheck("Alora",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienAlora1","GLOBAL",0)~ THEN X3VienB X3VienAlora1
@13 // ~Keep away from me, halfling. I'll not have you swipe at my things.~
DO ~SetGlobal("X3VienAlora","GLOBAL",1)~
== BALORA @14 // ~You're not very nice and always scowling! And I've seen you take things too!~
== X3VienB @15 // ~What?! Nevermind. They deserved it. I'm taxing the peasants for their insolence towards me, it's deserved.~
== BALORA @16 // ~Isn't that why you're not in the elven cloud lands?~
== X3VienB @17 // ~No, it was because my mentor sold me out to cover her tracks, clearly. I'd still be there if it weren't for her.~
== BALORA @18 // ~But now you're with us. That's something to smile about.~
== X3VienB @19 // ~I hardly t- hey! Give that back, you scoundrel! Ugh! Halflings.~
EXIT

// BRANWEN
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Branwen",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienBranwen1","GLOBAL",0)~ THEN BBRANW X3VienBranwen1
@20 // ~There is no honor with you, Vienxay. You act only for yourself.~
DO ~SetGlobal("X3VienBranwen1","GLOBAL",1)~
== X3VienB @21 // ~As I should. I am elf, I am nobility, and better than everyone else. People should serve me.~
== BBRANW @22 // ~With an attitude like that, you will have many enemies on the battlefield and few friends.~
== X3VienB @23 // ~Please. With my talents over Mystra's weave, I fear no one, and need no one.~
== BBRANW @24 // ~An error that will be your undoing.~
EXIT

// Coran
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Coran",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienCoran1","GLOBAL",0)~ THEN BCORAN X3VienCoran1
@25 // ~Your tongue is like a venemous snake, Vienxay, though I still find myself attracted to you.~
DO ~SetGlobal("X3VienCoran1","GLOBAL",1)~
== X3VienB @26 // ~You state the obvious, but I do enjoy a compliment.~
== BCORAN @27 // ~As I enjoy your presence, your figure enticing.~
== X3VienB @28 // ~If your words weren't thrown at every walking woman, I'd entertain your compliments with physical reward.~
== X3VienB @29 // ~A pity too. You'd find no lover as skilled as I.~
EXIT

// Dynaheir
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Dynaheir",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienDynaheir1","GLOBAL",0)~ THEN BDYNAH X3VienDynaheir1
@30 // ~Thou'rt a skilled mage, Vienxay, but a terrible elf.~
DO ~SetGlobal("X3VienDynaheir1","GLOBAL",1)~
== X3VienB @31 // ~Please. I am more than a skilled mage, I am the best mage.~
== BDYNAH @32 // ~Thy nose reaches to the clouds, Vienxay. A leader is on level with her people.~
== X3VienB @33 // ~My people abandoned me. I am on my own, human.
EXIT

// Edwin
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Edwin",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienEdwin1","GLOBAL",0)~ THEN BEDWIN X3VienEdwin1
@34 // ~You are a power that almost rivals my own, Vienxay. A relief from the typical monkeys I travel with.~
DO ~SetGlobal("X3VienEdwin1","GLOBAL",1)~
== X3VienB @35 // ~Almost? It exceeds. The elves of Evermeet are second to no one in magic.~
== BEDWIN @36 // ~When our business is over, I'd duel you to prove your words. (The fool. She thinks she would win.)~
== X3VienB @37 // ~The outcome is certain, but I still look forward to seeing it unfold, Edwin.~
EXIT

// Eldoth
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Eldoth",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienEldoth1","GLOBAL",0)~ THEN BELDOT X3VienEldoth1
@38 // ~You are a very interesting lady, Vienxay. You should spend time with me when we rest, and we can talk over wine.~
DO ~SetGlobal("X3VienEldoth1","GLOBAL",1)~
== X3VienB @39 // ~Before you get any ideas, I don't sleep with humans. I'd hate to make a mutt.~
== BELDOT @40 // ~Beauty, we need not jump to conclusions. One wine at a time.~
== X3VienB @41 // ~Make it quality wine, and I'll consider it, but keep your hands to yourself.~
EXIT

// FALDORN
CHAIN IF ~InParty("Faldorn")
See("Faldorn")
!StateCheck("Faldorn",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienFaldorn1","GLOBAL",0)~ THEN X3VienB X3VienFaldorn1
@42 // ~Your mission of vengeance against human pillaging of land is a losing battle, though one I approve of.~
DO ~SetGlobal("X3VienFaldorn1","GLOBAL",1)~
== BFALDO @43 // ~Nature outlives all men, Vienxay. They will learn or they will die quicker.~
== X3VienB @44 // ~You make a good point. You're one of the few humans I can stand. Your Shadow Druids have the right of it.~
== X3VienB @45 // ~Evermeet would not approve of you, though Evermeet would not have need of you. We respect nature.~
== BFALDO @46 // ~And your reverent respect of the land is why my wrath will never turn to you, Vienxay.~
EXIT

// GARRICK 
CHAIN IF ~InParty("Garrick")
See("Garrick")
!StateCheck("Garrick",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienGarrick1","GLOBAL",0)~ THEN X3VienB X3VienGarrick1
@47 // ~Your music is useless, and your magic pitiful. Why are you even with us?~
DO ~SetGlobal("X3VienGarrick1","GLOBAL",1)~
== BGARRI @48 // ~Your tongue is so thrashing, Vienxay, what did I do to deserve that?~
== X3VienB @49 // ~Nothing, that's what. I will have to cover for your ineptitude.~
== BGARRI @50 // ~You are beautiful but not above others, Vienxay. You need to learn manners.~
== X3VienB @51 // ~Whatever, peasant. Just don't get in our way.~
EXIT 

// Kagain 1
CHAIN IF ~InParty("Kagain")
See("Kagain")
InParty("X3Vien")
See("X3Vien")
!StateCheck("Kagain",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienKagain1","GLOBAL",0)~ THEN BKAGAI X3VienKagain1
@60 // ~Pansy elf.~
DO ~SetGlobal("X3VienKagain1","GLOBAL",1)~
== X3VienB @61 // ~Idiot Dwarf.~
== BKAGAI @62 // ~Frolicker.~
== X3VienB @63 // ~Pig.~
== BKAGAI @64 // ~Snob.~
== X3VienB @65 // ~Whatever!~
EXIT 

// Khalid 1
CHAIN IF ~InParty("Khalid")
See("Khalid")
!StateCheck("Khalid",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienKhalid1","GLOBAL",0)~ THEN X3VienB X3VienKhalid1
@66 // ~If you are going to scream "Better part of Valor, better part of Valor" one more time...~
DO ~SetGlobal("X3VienKhalid1","GLOBAL",1)~
== BKHALI @67 // ~I'm t-trying my b-best.
== X3VienB @68 // ~Your best is insufficient. You are a mutt, but you are half of us, and you should be better than a coward.~
== BKHALI @69 // ~You are cruel and cold.~
== X3VienB @70 // ~If it gets you to be useful, I'll be a lot worse.~
EXIT

// KIVAN 1
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Kivan",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienKivan1","GLOBAL",0)~ THEN BKIVAN X3VienKivan1
@71 // ~You are from the elven homeland, Vienxay?~
DO ~SetGlobal("X3VienKivan1","GLOBAL",1)~
== X3VienB @72 // ~I was. I miss it dearly. The human lands don't compare to the glory of Evermeet.~
== BKIVAN @73 // ~Shilmista was where I called home. It is not far from here, to the West.~
== BKIVAN @74 // ~I could not return without my dear love, not until retribution is fully had.~
== X3VienB @75 // ~We both have scores to settle then. Wrongs will be set right.~
EXIT

// MINSC 1
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienMinsc1","GLOBAL",0)~ THEN BMINSC X3VienMinsc1
@75 // ~Boo thinks you should be nicer!~
DO ~SetGlobal("X3VienMinsc1","GLOBAL",1)~
== X3VienB @76 // ~Get that rodent away from me! It's probably diseased.~
== BMINSC @77 // ~Boo is insulted! He bathes and licks himself regularly.~
== X3VienB @78 // ~Boo doesn't even talk. Ugh. Why am I arguing with an idiot?~
== BMINSC @79 // ~Just give him a stroke! Then you'll want your own!~
== X3VienB @80 // ~Never, never!~
EXIT

// Montaron 1
CHAIN IF ~InParty("Montaron")
See("Montaron")
!StateCheck("Montaron",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienMontaron1","GLOBAL",0)~ THEN X3VienB X3VienMontaron1
@81 // ~You are different than other halflings, Montaron. Slightly less annoying.~
DO ~SetGlobal("X3VienMontaron1","GLOBAL",1)~
== BMONTA @82 // ~And you are effective enough for me to not want to kill you for the moment.~
== X3VienB @83 // ~Yes, whatever. Why-ever though do you travel with that worthless wizard?~
== BMONTA @84 // ~He's a mad wizard, but he has his uses, as do all henchmen.~
EXIT

//Imoen 1
CHAIN IF ~InParty("X3Vien")
InParty("Imoen")
See("X3Vien")
!StateCheck("Imoen",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienImoen1","GLOBAL",0)~ THEN X3VienB X3VienImoen1
@85 // ~You hardly seem like you belong out here, human.~
DO ~SetGlobal("X3VienImoen1","GLOBAL",1)~
== BIMOEN @86 // ~What's got your nose?~
== X3VienB @87 // ~I would never permit someone to follow me around like a dog unless they were serving my every need. I suppose that is  your purpose.~
== BIMOEN @88 // ~I've done had enough of this. You're not getting a rise out of me.~
EXIT

// Quayle 
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Quayle",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienQuayle1","GLOBAL",0)~ THEN BQUAYL X3VienQuayle1
@89 // ~Vienxay. Show me that trick, the one where you dissapear in plain sight.~
DO ~SetGlobal("X3VienQuayle1","GLOBAL",1)~
== X3VienB @90 // ~I'm not some circus freak. What is this about?~
== BQUAYL @91 // ~Your mind comes close to my own, and you know a trick that I wish to see so I can master with even greater expertise.~
== X3VienB @92 // ~This is innate shadow magic. Even if I were interested in teaching a gnome, you have not the ability. Even with your mega-brain.~
EXIT

// SAFANA
CHAIN IF ~InParty("Safana")
See("Safana")
!StateCheck("Safana",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienSafana1","GLOBAL",0)~ THEN X3VienB X3VienSafana1
@93 // ~I'd like you more if you weren't flawed by being human. You understand the natural power of getting people around your finger.~
DO ~SetGlobal("X3VienSafana1","GLOBAL",1)~
== BSAFAN @94 // ~I'm flattered, a compliment by the grand Vienxay.~
== X3VienB @95 // ~Yes, you should be. And don't expect another compliment after that comment.~
EXIT

// Shar-Teel
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Sharteel",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienSharTeel1","GLOBAL",0)~ THEN BSHART X3VienSharteel1
@92 // ~Your ruthlessness in battle is a delight, Vienxay.~
DO ~SetGlobal("X3VienSharTeel1","GLOBAL",1)~
== X3VIENB @93 // ~Of course it is. You don't rise in life by playing clean.~
== BSHART @94 // ~I respect a woman who exceeds her male peers around here.~
== X3VIENB @95 // ~Have you seen our male peers? It's an effortless task.~
== BSHART @96 // ~Ha! Stay second to no man, Vienxay.~
EXIT

// Skie
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Skie",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienSkie1","GLOBAL",0)~ THEN BSKIE X3VienSkie1
@96 // ~I need to get my nails looked at, they're chipped and no longer dainty.~
DO ~SetGlobal("X3VienSkie1","GLOBAL",1)~
== X3VienB @97 // ~Ugh, please. You are like weak glass. Are all humans so concerned over petty things?~
== BSKIE @98 // ~You're so mean, Vienxay.
== X3VienB @99 // ~As I should be, human. I am superior to you.~
== BSKIE @100 // ~Eldoth thinks well of me.~
== X3VienB @101 // ~If you need others to validate your worth, you are pathetic indeed.~
== X3VienB @102 // ~Besides, if he wasn't human, it'd be quite easy to put my name in his mouth.~
== BSKIE @103 // ~I'm not going to talk to you anymore!~
== X3VienB @104 // ~As if I care.~
EXIT


// Tiax
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Tiax",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienTiax1","GLOBAL",0)~ THEN BTIAX X3VienTiax1
@105 // ~Tiax's grand plan is going well. Soon Tiax will command all!~
DO ~SetGlobal("X3VienTiax1","GLOBAL",1)~
== X3VienB @106 // ~Do you ever SHUT UP?!~
== BTIAX @107 // ~Tiax stops talking only when Tiax wishes. It is you who is silent at Tiax's will.~
== X3VienB @108 // ~And I thought humans were primitive.~
EXIT

// VICONIA
CHAIN IF ~InParty("Viconia")
See("Viconia")
!StateCheck("Viconia",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienViconia1","GLOBAL",0)~ THEN X3VienB X3VienViconia1
@109 // ~We are taught to hate you, drow. I did not think I would fall so low that I would be stuck traveling with you.~
DO ~SetGlobal("X3VienViconia1","GLOBAL",1)~
== BVICON @110 // ~What happened, surfacer? Cast out into the big bad world like the rest of us?~
== X3VienB @111 // ~Please. I am more than ready for the challenge. Still for a drow you are not...as unpleasant as I thought.~
== BVICON @112 // ~And what were you expecting?~
== X3VienB @113 // ~Several attempts of assassination, the typical cries of Lolth's glory, and other rubbish..~
== BVICON @114 // ~That hasn't even crossed my mind. And it is Shar who I serve.~
== X3VienB @115 // ~Shar, is it? You should tell your disciples to stop ruining my life.~
== BVICON @116 // ~And there it is, the source of your plight.~
== X3VienB @117 // ~Yes, yes, whatever, I was tricked, so on, so forth, and other meaningless details. I will not hurt you for now, drow...~
== X3VienB @118 // ~But if we run into any Shadow Mages, they will have no mercy.~
EXIT

// XAN 
CHAIN IF ~InParty("Xan")
See("Xan")
!StateCheck("Xan",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienXan1","GLOBAL",0)~ THEN X3VienB X3VienXan1
@119 // ~You are easily the most serious elf I have met. It is almost refreshing.~
DO ~SetGlobal("X3VienXan1","GLOBAL",1)~
== BXANNN @120 // ~Our work is a serious affair. So much could be swayed to poor ends with the smallest of errors.~
== X3VienB @121 // ~Yes. It is why we elves should be in charge of things. Every other race seems to screw things up.~
== BXANNN @122 // ~We may not make it through the ages.~
== X3VienB @123 // ~Please. Given by how the other kinds behave, I think we will be the most likely last standing if this world goes to the hells.~
EXIT 

// Xzar
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Xzar",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienXzar1","GLOBAL",0)~ THEN BXZAR X3VienXzar1
@124 // ~Vienxay, I find you almost palatable.~
DO ~SetGlobal("X3VienXzar1","GLOBAL",1)~
== X3VienB @125 // ~Of course you do. The feeling is not mutual.~
== BXZAR @126 // ~Lighten up! Why must you be so moody?~
== X3VienB @127 // ~Because every human is aggravating. 'Tis the curse of being an elf.~
EXIT 

// Yeslick
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Yeslick",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienYeslick1","GLOBAL",0)~ THEN BYESLI X3VienYeslick1
@128 // ~I will warn you lass, the way you treat others will have a great impact on your life's future.~
DO ~SetGlobal("X3VienYeslick1","GLOBAL",1)~
== X3VienB @129 // ~What are you talking about dwarf? Why are you even talking to me?~
== BYESLI @130 // ~Dark horizons will be your future if ye nay change your ways.~
== X3VienB @131 // ~I've already been through those dark horizons. Your warning is too late, and uncared for.~
EXIT 

// 2nd Set, for those who have them. 


// Jaheria 2

CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Jaheira",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienJaheira","GLOBAL",1)~ THEN BJAHEI X3VienJaheira2
@132 // You've not learned anything from your forced departure, Vienxay. 
DO ~SetGlobal("X3VienJaheira","GLOBAL",2)~
== BJAHEI @133 // ~You should take the time to understand your errors.~
== X3VienB @134 // ~I already said I did nothing. I was betrayed!~
== BJAHEI @135 // ~It does not excuse the evil that you did.~
== X3VienB @136 // ~You speak as if you understand and know everything, but you are ignorant.~
== BJAHEI @137 // ~Your anger and self-defense gives me enough information.~
== X3VienB @138 // ~Pretentious mutt! Leave me alone.~
EXIT

// Dynaheir 2
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Dynaheir",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienDynaheir1","GLOBAL",1)~ THEN BDYNAH X3VienDynaheir2
@139 // ~Does thou have no chance to return home?~
DO ~SetGlobal("X3VienDynaheir1","GLOBAL",2)~
== X3VienB @140 // ~I don't know. Judgement seemed final.~
== BDYNAH @141 // ~A pity the rest of the world must suffer thy.~
== X3VienB @142 // ~Please. That is the only benefit of this whole forced arrangement.~
EXIT

/*Imoen's 2nd banter splits, one for mage and one for non-mage.*/ 
//Imoen 2
CHAIN IF ~InParty("X3Vien")
InParty("Imoen")
See("X3Vien")
!StateCheck("Imoen",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienImoen1","GLOBAL",1)~ THEN BIMOEN X3VienImoen2
@143 // ~What do you want now, Vienxay? You've been giving me that eye again.~
DO ~SetGlobal("X3VienImoen1","GLOBAL",2)~
== X3VienB IF ~Class("Imoen",MAGE_ALL)~ THEN  @144 // ~I've been waiting for you to say thank you for inspiring you to your path of usefulness.~
== X3VienB IF ~!Class("Imoen",MAGE_ALL)~ THEN @145 // ~Please. Stop imagining things and start trying to make yourself more useful.~ 
== BIMOEN IF ~Class("Imoen",MAGE_ALL)~ THEN  @146 // ~Nah. It was all <CHARNAME's> idea.
== BIMOEN IF ~!Class("Imoen",MAGE_ALL)~ THEN @147 // ~Okay, snobby pants.~ 
== X3VienB IF ~Class("Imoen",MAGE_ALL)~ THEN  @148 // ~Whatever. Lie as you wish..~
== X3VienB IF ~!Class("Imoen",MAGE_ALL)~ THEN @149 // ~Hrmph..~ 
EXIT

// Kagain 2
CHAIN IF ~InParty("Kagain")
See("Kagain")
InParty("X3Vien")
!StateCheck("Kagain",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienKagain1","GLOBAL",1)~ THEN X3VienB X3VienKagain2
@150 // ~Gods, you smell like a dwarf. Do you ever bathe? Keep your distance.~
DO ~SetGlobal("X3VienKagain1","GLOBAL",2)~
== BKAGAI @151 // ~What else am I supposed to smell like, moron?~
== X3VienB @152 // ~What's the point of all that gold if you can't even use it to bathe yourself.~
== BKAGAI @153 // ~Go bother somebody else.~
EXIT

// Khalid 2
CHAIN IF ~InParty("Khalid")
See("Khalid")
!StateCheck("Khalid",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienKhalid1","GLOBAL",1)~ THEN X3VienB X3VienKhalid2
@154 // ~Khalid!~
DO ~SetGlobal("X3VienKhalid1","GLOBAL",2)~
== BKHALI @155 // WHA...? Y-yes?
== X3VienB @156 // ~Seriously? Must you be so easily startled?~
== BKHALI @157 // ~I...~
== X3VienB @158 // ~I *was* going to admit that perhaps you have some use...as a meat shield...but now I change my mind!~
EXIT

/*This only fires after talking to the apprentice.*/ 
// KIVAN 2
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Kivan",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
GlobalGT("X3VienQuest","GLOBAL",1)
Global("X3VienKivan1","GLOBAL",1)~ THEN BKIVAN X3VienKivan2
@159 // ~Your mood has been poor since we left the inn in Nashkel.~
DO ~SetGlobal("X3VienKivan1","GLOBAL",2)~
== X3VienB @160 // ~Should I be chipper? He was my lover, but he let me fall alone.~
== BKIVAN IF ~!Dead("X3VAPR")~ THEN @161 // ~He seemed a victim as well. Do not forget the true target.~
== BKIVAN IF ~Dead("X3VAPR")~ THEN @162 // ~He did not have a hand in the machinations you spoke of. Killing him was only out of anger, not justice, Vienxay. Do not forget the true target.~
== X3VienB @163 // ~I...you are right, Kivan. Thank you for your support.~
== BKIVAN @164 // ~As we should for one another.~
EXIT

// MINSC 2
CHAIN IF ~InParty("Minsc")
See("Minsc")
!StateCheck("Minsc",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienMinsc1","GLOBAL",1)~ THEN X3VienB X3VienMinsc2
@165 // ~Minsc, you're beginning to smell like that hamster.~
DO ~SetGlobal("X3VienMinsc1","GLOBAL",2)~
== BMINSC @166 // ~Yes, this is good! We are beginning to be one!~
== X3VienB @167 // ~No, it's not not, it's a nightmare. Please bathe as soon as possible.~
== BMINSC @168 // ~Boo is not fond of water, are you Boo?~
== X3VienB @169 // ~Ugh. Primitive humans.~
EXIT 

// Quayle 2
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Quayle",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienQuayle1","GLOBAL",1)~ THEN BQUAYL X3VienQuayle2
@170 // ~I have comprehended your power at last. Now I can also dissapear at will.~
DO ~SetGlobal("X3VienQuayle1","GLOBAL",2)~
== X3VienB @171 // ~Quayle, that is a basic invisibility spell. How dumb are you?~
== BQUAYL @172 // ~Excuse me? Your dissapearing trick is clearly the same, a non-verbal invisibility spell. You are a fraud!~
== X3VienB @173 // ~Of course you would come up with that inconceivable conclusion, just because you are't as powerful as me.~
== X3VienB @174 // ~Watch *carefully*~. 
== BQUAYL @175 // ~Incredible! How did you get behind me?~
== X3VienB @176 // ~Innate power you still aren't able to comprehend.~
== BQUAYL @177 // ~A fraud! No one's brain power exceeds mine.~
== X3VienB @178 // ~Ugh, think what you want.~
EXIT

// Tiax 2 
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Tiax",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienTiax1","GLOBAL",1)~ THEN BTIAX X3VienTiax2
@179 // ~Tiax asks his servant Vienxay to teach him her skill with shadows.~
DO ~SetGlobal("X3VienTiax1","GLOBAL",2)~
== X3VienB @180 // ~Gods. No. Never.~
== BTIAX @181 // ~Cyric would be most pleased with such development for Tiax, and you say no?! See if  you serve but the lowest spots when I rule.~
== X3VienB @182 // ~You are delusional. Stop bothering me, ugh.~
== BTIAX @183 // ~Tiax shall not forget this.~
EXIT

// XAN 2
CHAIN IF ~InParty("Xan")
See("Xan")
!StateCheck("Xan",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienXan1","GLOBAL",1)~ THEN X3VienB X3VienXan1
@184 // ~Have you been to Evermeet, Xan?~
DO ~SetGlobal("X3VienXan1","GLOBAL",2)~
== BXANNN @185 // ~I have never been to the elven homeland. I doubt the chance will ever come.~
== X3VienB @186 // ~Yet you clearly grew up around elves.~
== BXANNN @187 // ~Yes I did, amongst the stronghold of Evereska.~
== X3VienB @188 // ~You will have to tell me of this place. Perhaps when this...ordeal is over, I can look to this place for residence.~
== BXANNN @189 // ~Good choice. To return to your homeland is a doomed ordeal.~
== X3VienB @190 // ~Yes. What? No! Maybe. Ugh. Evermeet is still my first option...should it become possible to return.~
== BXANNN @191 // ~I remain doubtful.~
EXIT 

//Imoen 3
CHAIN IF ~InParty("X3Vien")
InParty("Imoen")
See("X3Vien")
!StateCheck("Imoen",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
Class("Imoen",MAGE_ALL)
CombatCounter(0)
!See([ENEMY])
Global("X3VienImoen1","GLOBAL",2)~ THEN X3VienB X3VienImoen3
@192 // ~I am still waiting for my due credit.~
DO ~SetGlobal("X3VienImoen1","GLOBAL",3)~
== BIMOEN @193 // ~Aww, lighten up. You know, you did actually inspire me by one thing you did.~
== X3VienB @194 // ~Do go on.~
== BIMOEN @195 // ~Your ability to make things dissapear into thin air.~
== X3VienB @196 // ~Yes, I am very skilled at illus- hey! Give that back! This is not funny.~
EXIT 

// Kagain 3
CHAIN IF ~InParty("Kagain")
See("Kagain")
InParty("X3Vien")
!StateCheck("Kagain",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienKagain1","GLOBAL",2)~ THEN X3VienB X3VienKagain3
@197 // ~Despite your awful smell, I will admit, you are more bearable than most people I've met.~
DO ~SetGlobal("X3VienKagain1","GLOBAL",3)~
== BKAGAI @198 // ~You're complimenting me, pansy elf? Bit odd for us.~
== X3VienB @199 // ~Would you rather we go back to spewing insults?~
== BKAGAI @200 // ~Yes, I would.~
== X3VienB @201 // ~Fine. Idiot Dwarf.~
== BKAGAI @62 // ~Frolicker.~
== X3VienB @63 // ~Pig.~
== BKAGAI @64 // ~Snob.~
EXIT

// KIVAN 3
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Kivan",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
Dead("X3VMAS")
!See([ENEMY])
GlobalGT("X3VienQuest","GLOBAL",1)
Global("X3VienKivan1","GLOBAL",2)~ THEN BKIVAN X3VienKivan3
@202 // ~Your revenge is complete, Vienxay. Do you feel as you expected?~
DO ~SetGlobal("X3VienKivan1","GLOBAL",3)~
== X3VienB @203 // ~The joy of her death has dissipated. Now it is to the future.~
== BKIVAN @204 // ~And what do you see in this future?~
== X3VienB @203 // ~Nothing. I see nothing. But I'm sure it will come to me, naturally.~
EXIT
 
// KIVAN 4
CHAIN IF ~InParty("X3Vien")
See("X3Vien")
!StateCheck("Kivan",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
Dead("X3VMAS")
!See([ENEMY])
GlobalGT("X3VienQuest","GLOBAL",1)
Global("X3VienKivan1","GLOBAL",3)~ THEN BKIVAN X3VienKivan4
@204 // ~Have you reflected on your future, Vienxay?~
DO ~SetGlobal("X3VienKivan1","GLOBAL",4)~
== X3VienB @205 // ~All I know is Evermeet. When this is over...I can only think of going home to a place that no longer welcomes me.~
== BKIVAN @206 // ~You may walk the roads and forests with myself, if it will bring you some peace for a while.~
== X3VienB @207 // ~Nothing will rival Evermeet's trees and cities, or people, nothing can replace the family that is away, Kivan.~
== X3VienB @208 // ~Your offer is...heard, however. But nothing but the idea of home will move me to joy right now.~
== BKIVAN @209 // ~If I may be of aid, call.~
EXIT

// Xzar 2
CHAIN IF ~InParty("X3Vien")
InParty("Xzar")
See("Xzar")
!StateCheck("Xzar",CD_STATE_NOTVALID)
!StateCheck("X3Vien",CD_STATE_NOTVALID)
CombatCounter(0)
!See([ENEMY])
Global("X3VienXzar1","GLOBAL",1)~ THEN X3VienB X3VienXzar2
@210 // ~I've changed my mind about you, human.~
DO ~SetGlobal("X3VienXzar1","GLOBAL",2)~
== BXZAR @211 // ~The pretty elf speaks to me?~
== X3VienB @212 // ~You are...interesting for a necromancer. Not as disgusting as most.~
== BXZAR @213 // ~Ahh, yes. Friends we are then, or...something more?~
== X3VienB @214 // ~Don't push it.~
EXIT 
