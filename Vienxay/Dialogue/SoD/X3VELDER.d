BEGIN X3VELDER 

CHAIN IF ~Global("X32VQuestTalk","GLOBAL",4)Global("Talk","LOCALS",0)~ THEN X3VELDER first_talk 
~The only people who have passed this way are cultists, fools, or crusaders. Which are you?~
DO ~SetGlobal("Talk","LOCALS",1)~
END 
++ ~None of those. Who are you and what are you doing here?~ + doing_here
++ ~We are with the Dragonspear Expedition.~ + expedition
++ ~That isn't any of your business.~ + no_business

CHAIN X3VELDER no_business 
~Then leave me be and I will leave you be.~
EXIT 

CHAIN X3VELDER expedition 
~Are you now? I have run into some of them patrolling. "Elder Mage" or "Elder Witch" they call me. Ignorance is bliss.~ 
END 
IF ~IsValidForPartyDialogue("X3Vien")~ EXTERN X32VienJ quest_interject 
++ ~You are the Elder Mage, then? Rumor has it that you are learned in Shadow Magic, which a companion of mine is interested in getting more knowledge from.~ + teach 
++ ~Elder Mage? What does that even mean?~ + elder_mage 
++ ~Well, I better get moving.~ + no_business 

CHAIN X3VELDER doing_here 
~I live out here, the solace and isolation beyond the cult up the mountain suits me. Names however, have power, so you can call me what everyone else does, "Elder Mage", or "Elder Witch."~
END
IF ~IsValidForPartyDialogue("X3Vien")~ EXTERN X32VienJ quest_interject 
++ ~You are the Elder Mage, then? Rumor has it that you are learned in Shadow Magic, which a companion of mine is interested in getting more knowledge from.~ + teach 
++ ~Elder Mage? What does that even mean?~ + elder_mage 
++ ~Well, I better get moving.~ + no_business 

CHAIN X3VELDER elder_mage 
~It means I am old, even for an elf, and that I am feared for my long experience with the weave. I know all sorts of magic, even those that others are uncomfortable delving into.~
END 
++ ~And is Shadow Magic one of those elements?~ + shadow 
++ ~Could you offer our friend some knowledge? She is a Shadowmage that seeks to further her grasp of her skill.~ + teach 
++ ~Well, I better get moving.~ + no_business 

CHAIN X3VELDER shadow 
~Yes it is. What is misunderstood and feared often holds the greatest power and secrets.~
END 
++ ~Could you offer our friend some knowledge? She is a Shadowmage that seeks to further her grasp of her skill.~ + teach 
++ ~Well, I better get moving.~ + no_business 

CHAIN IF ~Global("Talk","LOCALS",1)Global("X32VQuestTalk","GLOBAL",4)~ THEN X3VELDER second_talk 
~You still live. Perhaps there are others beyond the Elder Mage who can survive this place well.~
END 
IF ~IsValidForPartyDialogue("X3Vien")~ EXTERN X32VienJ quest_interject 
++ ~Could you offer our friend some knowledge? She is a Shadowmage that seeks to further her grasp of her skill.~ + teach 
++ ~Well, I better get moving.~ + no_business 

CHAIN X3VELDER teach 
~The secrets of shadow magic cannot be taught in an hour or a session. It takes a lifetime of learning, and I have exhausted centuries in my own understanding.~
== X3VELDER ~I have documented much of it in my tome Secrets of Shadows. Perhaps...Perhaps I could give you this tome to give to her, if you do me a favor.~
END 
++ ~And what would you have me do?~ + quest_fetch 
++ ~What stops me from killing you for it right now?~ + quest_power
++ ~I'm not interested in doing a deed for you. We have enough tasks as it is.~ + quest_early_rejected

CHAIN X3VELDER quest_fetch 
~I require an emerald for a particular shadow spell that I need for a personal ritual. I happen to know that a sleeping wyrm nearby may very well have some in its lair. Find some from there or elsewhere and bring them to me. Then we may trade.~
DO ~SetGlobal("X32VQuestTalk","GLOBAL",5)~
END 
++ ~Very well then, we'll return with your emerald.~ + quest_accepted 
+~PartyHasItem("misc43")~+ ~No need, I have the gem you seek right now.~ DO ~TakePartyItemNum("misc43",1)~ + quest_already_done 
++ ~I'd rather not go through all of that when I can kill you right now!~ + quest_attack 
+~!IsValidForPartyDialogue("X3Vien")~+ ~Forget it. I've no interest in helping you with this.~ + quest_rejected
+~IsValidForPartyDialogue("X3Vien")~+ ~Forget it. I've no interest in helping you with this.~ EXTERN X32VIENJ quest_rejected_V

CHAIN X3VELDER quest_early_rejected 
~Suit yourself.~
EXIT 

CHAIN X3VELDER quest_power 
~I am an elder mage, not a young apprentice learning her first cantrip. Your very attempt would be laughable. Have wisdom and listen to my much better alternative idea instead.~
EXTERN X3VELDER quest_fetch 

CHAIN X3VELDER quest_rejected 
~An offer was made. You know what needs to be done if you wish to further your friend's knowledge.~
DO ~AddJournalEntry(@154,QUEST)~
EXIT 

CHAIN X3VELDER quest_accepted 
~Excellent. I await your return with anticipation.~
DO ~AddJournalEntry(@154,QUEST)~
EXIT 

CHAIN X3VELDER quest_attack 
~Ha. You will soon know my power then, fool.~
DO ~AddJournalEntry(@149,QUEST)Enemy()~
EXIT 

CHAIN X3VELDER quest_already_done 
~Excellent. I can now progress further with my research on a perfect clone formed of shadow. The emerald's believed magic regarding health is not all myth, not that you would understand.~
== X3VELDER ~Allow me to give you Secrets of Shadow. May it further your understanding of the art.~
END 
IF ~IsValidForPartyDialogue("X3Vien")~ DO ~GiveItem("X3VBook","X3Vien")~ EXTERN X32VienJ final_interject 
IF ~!IsValidForPartyDialogue("X3Vien")~ DO ~GiveItem("X3VBook",Player1)~ EXTERN X3VELDER farewell 

CHAIN X3VELDER farewell 
~Farewell then. Knowledge keep you alive.~
END 
IF ~InPartyAllowDead("X3Vien")~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",7)EscapeArea()~ EXIT 
IF ~!InPartyAllowDead("X3Vien")~ DO ~SetGlobal("X32VQuestTalk","GLOBAL",6)EscapeArea()~ EXIT 

CHAIN IF ~Global("X32VQuestTalk","GLOBAL",5)~ THEN X3VELDER third_talk 
~Have you returned with the emerald? If not, why are you bothering me?~
END 
+~PartyHasItem("misc43")~+ ~I have the emerald here.~ DO ~TakePartyItemNum("misc43",1)~ + quest_already_done 
++ ~I don't have the emerald yet. I'll return later.~ EXIT 
++ ~No reason.~ EXIT 

// Vienxay lines start here 

CHAIN X32VIENJ quest_interject 
~Excuse me, "Elder Mage". I am Vienxay of the House of Starlight in Evermeet. As a fellow Shadowmage, I wish to comprehend more of the art you allegedly have mastery in.~
== X3VELDER ~"Allegedly". Ha. Mastery is a lifetime's work, and I have expelled centuries. Perhaps it is a fitting word.~
== X32VIENJ ~Now surely, we can begin some instruction, or perhaps you have a scroll...~
== X3VELDER ~I am teaching you nothing, novice. But perhaps...perhaps if you do a favor first, then I will consider giving you my Secrets of Shadow, a tome I write myself that contains desirable knowledge of what you seek.~
END 
++ ~And what would you have us do?~ EXTERN X3VELDER quest_fetch 
++ ~What stops us from killing you for it right now?~ EXTERN X3VELDER quest_power
++ ~We're not interested in doing a deed for you. We have enough tasks as it is.~ EXTERN X32VIENJ excuse_me

CHAIN X32VIENJ excuse_me
~Excuse me, <CHARNAME>? Let us at least hear her out. Perhaps it is just helping her with her old age for a day.~
== X3VELDER ~Watch your own tongue, lest I offer nothing at all.~
EXTERN X3VELDER quest_power 

CHAIN X32VIENJ quest_rejected_V
~Hrmph. What is but one emerald...ugh. I do hope you reconsider, <CHARNAME>.~
EXTERN X3VELDER quest_rejected

CHAIN X32VIENJ final_interject 
~At last! In time I will be as powerful as yourself, Elder Mage.~
== X3VELDER ~Not if you are arrogant as you are. Power requires patience, as does the pursuit of knowledge.~
== X3VELDER ~Rush yourself, disregard care or those around you...and you will end up like me.~
== X32VIENJ ~What is that supposed to mean?~
== X3VELDER ~You are not listening. Perhaps it is inevitable and words are wasted. But I hope you keep alive.~
DO ~AddJournalEntry(@148,QUEST_DONE)SetGlobal("X32VQuestTalk","GLOBAL",7)~
EXIT 