BEGIN X3VMAS 

CHAIN IF ~!IsValidForPartyDialog("X3Vien")~ THEN X3VMAS NoVienxay 
@40 
EXIT 

CHAIN IF ~IsValidForPartyDialog("X3Vien")~ THEN X3VMAS Meet 
@0 // ~Well, if it isn't Vienxay. How long has it been now? Three months, six months, a year? You look so much worse for wear.~
== X3VienJ @1 // ~Shut up, Luna. You know why I'm here. I've been waiting for this moment ever since my exile, and I *will* have retribution.~
== X3VMAS @2 // ~No, you won't. I see you brought friends with you. Did you tell them the truth?~
== X3VienJ @3 // ~You are not going to sway them, Sharran.~
== X3VMAS @4 // ~I would have you hear me. Did she tell you why she was *really* exiled?~
END 
++ @5 EXTERN X3VMAS Truth  // ~You believe she would be dishonest?~
++ @6 EXTERN X3VMAS Truth // ~We were told it was because you set her up.~
++ @7 EXTERN X3VMAS BATTLE // ~You aren't going to talk your way out of this.~

CHAIN X3VMAS Truth 
@8 // ~She killed another elf with the magic I taught her. A lover that caught her spending too much time with Lacius.~
== X3VMAS @9 // ~She begged for protection, and I simply led the authorities straight to her.~
END 
++ @10 EXTERN X3VienJ Truth2 // ~Is this true, Vienxay?~
++ @11 EXTERN X3VMAS Lie // ~I don't believe you.~
++ @7 EXTERN X3VMAS BATTLE // ~You aren't going to talk your way out of this.~

CHAIN X3VMAS Lie 
@12 // ~Believe me or not, but I think you know she cannot be entirely innocent. Now, she brings you to try to take out a very powerful Sharran. A terrible idea if you ask me.~
== X3VMAS @25 // ~Let me instead give you an opportunity to live while appeasing my old student, a deal to continue breathing that is towards your advantage.~
== X3VienJ @26 // ~Do NOT hear her out, <CHARNAME>. She is manipulating you!
== X3VMAS @27 // ~I'm sure they are able to decide for themselves, former apprentice.~
END 
++ @13 EXTERN X3VMAS OFFER // ~What does this deal entail?~
++ @14 EXTERN X3VMAS FOOL // ~I'll not ignore Vienxay. Your offer is declined.~ 
++ @7 EXTERN X3VMAS BATTLE // ~You aren't going to talk your way out of this.~

CHAIN X3VMAS FOOL
@15 // ~Not even hearing a deal. She must have you wrapped around her finger. Such fools.~
EXTERN X3VMAS BATTLE 

CHAIN X3VienJ Truth2
@16 // ~...It is true. I did not know the full effects of the spell taught. I have never wielded the shadow weave since.~
== X3VienJ @17 // ~I confess I was weak, and selfish, and did not stop what I knew was terrible until that moment.
== X3VienJ @18 // ~She has killed elves purposefully, for her experiments, for Shar's gain. That is the difference between us.~
== X3VienJ @19 // ~I took a life...because I was unknowing of the power I was using, and afraid.~
END 
++ @20 EXTERN X3VienJ Defend // ~I understand, Vienxay. You don't have to defend yourself to me.~
++ @21 EXTERN X3VMAS OFFER2 // ~After hearing that, it is hard to want to help you.~
++ @22 EXTERN X3VMAS OFFER2 // ~You were a fool.~

CHAIN X3VienJ Defend 
@23 // ~Pleasantly suprising, and soothing to hear from you.~
== X3VMAS @24 // ~I would disagree, but let's get back to our business. 
== X3VMAS @25 // ~Let me instead give you an opportunity to live while appeasing my old student, a deal to continue breathing that is towards your advantage.~
== X3VienJ @26 // ~Do NOT hear her out, <CHARNAME>. She is manipulating you!
== X3VMAS @27 // ~I'm sure they are able to decide for themselves, former apprentice.~
END 
++ @13 EXTERN X3VMAS OFFER // ~What does this deal entail?~
++ @14 EXTERN X3VMAS FOOL // ~I'll not ignore Vienxay. Your offer is declined.~ 
++ @7 EXTERN X3VMAS BATTLE // ~You aren't going to talk your way out of this.~

CHAIN X3VMAS OFFER2 
@28 // ~I agree with that very acute observation. Allow me to make you an offer.~
== X3VienJ @26 // ~Do NOT hear her out, <CHARNAME>. She is manipulating you!
== X3VMAS @27 // ~I'm sure they are able to decide for themselves, former apprentice.~
END 
++ @13 EXTERN X3VMAS OFFER // ~What does this deal entail?~
++ @14 EXTERN X3VMAS FOOL // ~I'll not ignore Vienxay. Your offer is declined.~ 
++ @7 EXTERN X3VMAS BATTLE // ~You aren't going to talk your way out of this.~

CHAIN X3VMAS OFFER 
@28 // ~I offer a powerful scroll to summon an elemental from the outer realms. Air, Earth, Fire. Your choice.~
== X3VMAS @29 // ~On top of that, a thousand gold coins, to sate your thirst and greed.~
== X3VMAS @30 // ~In exchange, we go our separate ways, and you live.~
== X3VienJ @31 // ~We do not *need* your hand out, Luna.~
== X3VMAS @32 // ~I consider this generous. You are certain to live and live rewarded, rather than die for nothing. Evermeet will never take you back.~
END 
++ @14 EXTERN X3VMAS FOOL // ~I'll not ignore Vienxay. Your offer is declined.~ 
++ @33 EXTERN X3VMAS AIR // ~I accept your offer, and will take the scroll of air.~
++ @34 EXTERN X3VMAS Earth // ~I accept your offer, and will take the scroll of earth.~
++ @35 EXTERN X3VMAS Fire // ~I accept, your offer and will take the scroll of fire.~

CHAIN X3VMAS AIR 
@36 // ~Wise choice. Here you are, use my little gift well.~
== X3VienJ @37 // ~What?! You are an idiot.~
== X3VMAS @38 // ~The only idiot is you, your flaring emotions make you so weak. You were never worth my teaching. Goodbye.~
DO ~ActionOverride("X3VAPR3",EscapeArea())ActionOverride("X3VAPR4",EscapeArea())ActionOverride("X3VAPR5",EscapeArea())EscapeArea()AddexperienceParty(6000)GiveGoldForce(1000)GiveItemCreate("SCRL7B",Player1,0,0,0)AddJournalEntry(@10025,QUEST_DONE)SetGlobal("X3VienQuestDone","GLOBAL",1)SetGlobal("X3VienBribed","GLOBAL",1)~
EXIT 

CHAIN X3VMAS Earth
@36 // ~Wise choice. Here you are, use my little gift well.~
== X3VienJ @37 // ~What?! You are an idiot.~
== X3VMAS @38 // ~The only idiot is you, your flaring emotions make you so weak. You were never worth my teaching. Goodbye.~
DO ~ActionOverride("X3VAPR3",EscapeArea())ActionOverride("X3VAPR4",EscapeArea())ActionOverride("X3VAPR5",EscapeArea())EscapeArea()AddexperienceParty(6000)GiveGoldForce(1000)GiveItemCreate("SCRL7C",Player1,0,0,0)AddJournalEntry(@10025,QUEST_DONE)SetGlobal("X3VienQuestDone","GLOBAL",1)SetGlobal("X3VienBribed","GLOBAL",1)~
EXIT 

CHAIN X3VMAS Fire
@36 // ~Wise choice. Here you are, use my little gift well.~
== X3VienJ @37 // ~What?! You are an idiot.~
== X3VMAS @38 // ~The only idiot is you, your flaring emotions make you so weak. You were never worth my teaching. Goodbye.~
DO ~ActionOverride("X3VAPR3",EscapeArea())ActionOverride("X3VAPR4",EscapeArea())ActionOverride("X3VAPR5",EscapeArea())EscapeArea()AddexperienceParty(6000)GiveGoldForce(1000)GiveItemCreate("SCRL6X",Player1,0,0,0)AddJournalEntry(@10025,QUEST_DONE)SetGlobal("X3VienQuestDone","GLOBAL",1)SetGlobal("X3VienBribed","GLOBAL",1)~
EXIT 

CHAIN X3VMAS BATTLE 
@39 // ~Let me give you one final lesson, Vienxay, on the true power of Shar's weave.~ 
DO ~ActionOverride("X3VAPR3",Enemy())ActionOverride("X3VAPR4",Enemy())ActionOverride("X3VAPR5",Enemy())Enemy()~
EXIT 
