

	.FUNCT	RT-LIBRARIAN-SAYS-MSG
	FSET?	CH-LIBRARIAN,FL-OPENED /?CCL3
	PRINTC	34
	CALL2	RT-PICK-NEXT,GL-LIBRARIAN-TXT1
	PRINT	STACK
	PRINTR	"."""
?CCL3:	PRINTC	34
	CALL2	RT-PICK-NEXT,GL-LIBRARIAN-TXT2
	PRINT	STACK
	PRINTR	""""


	.FUNCT	RT-TELL-ABOUT?,PERSON
	EQUAL?	GL-PRSA,V?ASK-ABOUT \?PRD3
	EQUAL?	GL-PRSO,PERSON /TRUE
?PRD3:	EQUAL?	GL-PRSA,V?TELL-ABOUT \?PRD6
	EQUAL?	GL-PRSO,CH-ME,CH-PLAYER \?PRD6
	EQUAL?	GL-WINNER,PERSON /TRUE
?PRD6:	EQUAL?	GL-PRSA,V?WHO \?PRD10
	FSET?	GL-PRSO,FL-PERSON \?PRD10
	EQUAL?	GL-WINNER,PERSON /TRUE
?PRD10:	EQUAL?	GL-PRSA,V?WHAT \FALSE
	EQUAL?	GL-WINNER,PERSON /TRUE
	RFALSE	


	.FUNCT	RT-WHO-WHAT-FAIL?
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \FALSE
	PRINTR	"""Sorry. I don't know what you're talking about."""


	.FUNCT	RT-NO-CONDITION-MSG,PERSON,STR
	ICALL2	RT-CTHEO-PRINT,PERSON
	ICALL2	RT-IS-ARE-MSG,PERSON
	PRINTI	"in no condition to "
	ZERO?	STR /?CCL3
	PRINT	STR
	JUMP	?CND1
?CCL3:	PRINTI	"respond"
?CND1:	PRINTR	"."


	.FUNCT	RT-AC-CH-HOLMES,CONTEXT,OBJ
	ICALL2	RT-THIS-IS-IT,CH-HOLMES
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	ICALL2	RT-THIS-IS-IT,CH-HOLMES
	FSET?	CH-HOLMES,FL-ASLEEP \?CCL6
	CALL2	RT-PICK-NEXT,GL-HOLMES-DESC-TXT
	PRINT	STACK
	PRINTR	" is slouched on the sofa, lost in a black mood of despair. He is pale and emaciated, and his sharp eyes burn with fever. He is staring at a phial that he holds in one hand. His free hand rests near a hypodermic syringe in a neat morocco case at his side. You realize that he is fighting a depression brought on by what he calls ""the dull routine of existence."""
?CCL6:	FSET?	CH-HOLMES,FL-LOCKED \?CCL8
	CALL2	RT-PICK-NEXT,GL-HOLMES-DESC-TXT
	PRINT	STACK
	PRINT	K-SECURELY-BOUND-MSG
	JUMP	?CND4
?CCL8:	FSET?	CH-MORIARTY,FL-LOCKED \?CCL10
	PRINTI	"Despite his cool exterior, you can tell that Holmes is excited about nearing the end of the chase"
	JUMP	?CND4
?CCL10:	IN?	CH-HOLMES,TH-BOAT \?CCL12
	CALL2	RT-PICK-NEXT,GL-HOLMES-DESC-TXT
	PRINT	STACK
	PRINT	K-SEASICK-MSG
	JUMP	?CND4
?CCL12:	IN?	CH-HOLMES,TH-HANSOM-CAB /?CTR13
	IN?	CH-HOLMES,TH-GROWLER-CAB \?CCL14
?CTR13:	CALL2	RT-PICK-NEXT,GL-HOLMES-DESC-TXT
	PRINT	STACK
	PRINT	K-SITTING-QUIETLY-MSG
	JUMP	?CND4
?CCL14:	IN?	CH-HOLMES,TH-SOFA \?CCL18
	CALL2	RT-PICK-NEXT,GL-HOLMES-DESC-TXT
	PRINT	STACK
	PRINTI	" is sitting on the sofa, gazing intently at you"
	JUMP	?CND4
?CCL18:	EQUAL?	GL-PLACE-CUR,RM-ENTRY-HALL,RM-PARLOUR,RM-VESTIBULE /?CTR19
	EQUAL?	GL-PLACE-CUR,RM-HOLMES-STUDY,RM-HOLMES-BEDROOM \?CCL20
?CTR19:	CALL2	RT-PICK-NEXT,GL-HOLMES-DESC-TXT
	PRINT	STACK
	CALL2	RT-PICK-NEXT,GL-HOLMES-HOUSE-LOOK-TXT
	PRINT	STACK
	JUMP	?CND4
?CCL20:	FSET?	GL-PLACE-CUR,FL-INDOORS \?CCL24
	CALL2	RT-PICK-NEXT,GL-HOLMES-DESC-TXT
	PRINT	STACK
	CALL2	RT-PICK-NEXT,GL-HOLMES-INDOORS-LOOK-TXT
	PRINT	STACK
	JUMP	?CND4
?CCL24:	CALL2	RT-PICK-NEXT,GL-HOLMES-DESC-TXT
	PRINT	STACK
	CALL2	RT-PICK-NEXT,GL-HOLMES-OUTDOORS-LOOK-TXT
	PRINT	STACK
?CND4:	PRINTC	46
	CRLF	
	RETURN	2
?CCL3:	CALL2	RT-TELL-ABOUT?,CH-HOLMES
	ZERO?	STACK /?CCL26
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL29
	SET	'OBJ,GL-PRSO
	JUMP	?CND27
?CCL29:	SET	'OBJ,GL-PRSI
?CND27:	CALL2	RT-HOLMES-DESCRIBE-MSG?,OBJ
	ZERO?	STACK \TRUE
	PRINTR	"""You must draw your own inferences, Watson."""
?CCL26:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL34
	RETURN	2
?CCL34:	EQUAL?	CONTEXT,K-M-WINNER \?CCL36
	FSET?	CH-HOLMES,FL-ASLEEP \?CCL39
	ICALL2	RT-CTHEO-PRINT,CH-HOLMES
	PRINT	K-SEEMS-TO-HEAR-MSG
	CRLF	
	RTRUE	
?CCL39:	EQUAL?	GL-PRSA,V?HELLO \?CCL41
	PRINTR	"Holmes returns your greeting."
?CCL41:	EQUAL?	GL-PRSA,V?GOODBYE \?CCL43
	PRINTR	"""Farewell for now, Watson."""
?CCL43:	EQUAL?	GL-PRSA,V?THANK \?CCL45
	PRINTR	"""No need for thanks, Watson. The work itself is my reward."""
?CCL45:	EQUAL?	GL-PRSA,V?WHERE \?CCL47
	EQUAL?	GL-PRSO,TH-STETHOSCOPE \?CCL50
	FSET?	TH-STETHOSCOPE,FL-TOUCHED /?CCL50
	PRINT	K-CUSTOMARILY-KEEP-MSG
	CRLF	
	RTRUE	
?CCL50:	CALL2	RT-VISIBLE?,GL-PRSO
	ZERO?	STACK /?CCL54
	PRINTI	"""There's your problem in a nutshell, Watson. You see, but you do not observe. "
	EQUAL?	GL-PRSO,CH-HOLMES \?CCL57
	PRINTI	"I am "
	JUMP	?CND55
?CCL57:	EQUAL?	GL-PRSO,CH-ME,CH-PLAYER \?CCL59
	PRINTI	"You are "
	JUMP	?CND55
?CCL59:	ICALL1	RT-CTHEO-PRINT
	ICALL1	RT-IS-ARE-MSG
?CND55:	PRINTR	"right here!"""
?CCL54:	PRINT	K-WORK-OUT-YOURSELF-MSG
	CRLF	
	RTRUE	
?CCL47:	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL61
	PRINT	K-WORK-OUT-YOURSELF-MSG
	CRLF	
	RTRUE	
?CCL61:	EQUAL?	GL-PRSA,V?YES \?CCL63
	PRINT	K-GOOD-SHOW-MSG
	CRLF	
	RTRUE	
?CCL63:	EQUAL?	GL-PRSA,V?NO \?CCL65
	PRINT	K-PITY-MSG
	CRLF	
	RTRUE	
?CCL65:	EQUAL?	GL-PRSA,V?MAYBE \?CCL67
	PRINT	K-MAYBE-MSG
	CRLF	
	RTRUE	
?CCL67:	EQUAL?	GL-PRSA,V?TAKE \?PRD71
	EQUAL?	GL-PRSO,TH-BREATH /?CTR68
?PRD71:	EQUAL?	GL-PRSA,V?INHALE \?CCL69
?CTR68:	FSET?	TH-BREATH,FL-LOCKED \?CND74
	PRINTR	"Holmes seems to be holding his breath already."
?CND74:	PRINTI	"Holmes hears your whispered instruction, and as you draw a deep breath, he surreptitiously does the same."
	CRLF	
	CALL	RT-DO-CLOCK-SET,GL-TIME-PARM,0,2,0
	ICALL	RT-ALARM-SET-REL,RT-I-EXHALE,STACK
	FSET	TH-BREATH,FL-LOCKED
	SET	'GL-CLOCK-WAIT,TRUE-VALUE
	RTRUE	
?CCL69:	CALL1	RT-TOUCH-VERB?
	ZERO?	STACK /?CCL77
	FSET?	CH-HOLMES,FL-LOCKED \?CCL77
	PRINTR	"Holmes can't do that. He is tied up."
?CCL77:	EQUAL?	GL-PRSA,V?TAKE,V?WEAR \?CCL81
	EQUAL?	GL-PRSO,TH-RING /?CTR80
	EQUAL?	GL-PRSO,TH-ETHERIUM-AMPOULE \?CCL81
	FSET?	TH-ETHERIUM-AMPOULE,FL-BROKEN /?CCL81
?CTR80:	PRINT	K-PLEASE-KEEP-IT-MSG
	CRLF	
	RTRUE	
?CCL81:	EQUAL?	GL-PRSA,V?RAISE,V?TAKE \?CCL89
	EQUAL?	GL-PRSO,CH-PLAYER,CH-ME \?CCL89
	PRINTI	"Holmes struggles to lift you"
	IN?	CH-PLAYER,TH-BOAT \?CND92
	PRINTI	", the boat starts to rock violently"
?CND92:	PRINTR	", then he thinks better of it and abandons the attempt."
?CCL89:	EQUAL?	GL-PRSA,V?TAKE,V?GUESS,V?DROP /FALSE
	EQUAL?	GL-PRSA,V?GIVE-SWP /FALSE
	EQUAL?	GL-PRSA,V?READ,V?EXAMINE,V?LOOK-ON /?PRD101
	EQUAL?	GL-PRSA,V?LOOK-INSIDE,V?OPEN,V?SEARCH \?CCL99
?PRD101:	EQUAL?	GL-PRSO,TH-MAIL \?CCL99
	PRINTR	"Holmes glances at the envelopes and shrugs. ""They are of no consequence, Watson."""
?CCL99:	EQUAL?	GL-PRSA,V?PLAY \?CCL105
	EQUAL?	GL-PRSO,TH-VIOLIN \?CCL105
	IN?	TH-VIOLIN,CH-HOLMES /?CCL110
	PRINTI	"Holmes is not holding "
	ICALL1	RT-THEO-PRINT
	PRINTR	"."
?CCL110:	ICALL2	SOUNDS,S-VIOLIN
	PRINTR	"Holmes pauses for a moment in meditation, then lifts the violin to his chin and plays a brief, haunting melody whose melancholy notes fill the air with beauty. Then, just as quickly, he is finished."
?CCL105:	EQUAL?	GL-PRSA,V?GIVE \?CCL112
	EQUAL?	GL-PRSI,CH-ME,CH-PLAYER \?CCL112
	IN?	GL-PRSO,CH-HOLMES \?CCL117
	MOVE	GL-PRSO,CH-PLAYER
	PRINTI	"Holmes gives you "
	ICALL1	RT-THEO-PRINT
	PRINTR	"."
?CCL117:	EQUAL?	GL-PRSO,TH-RING \?CCL119
	IN?	TH-RING,LOCAL-GLOBALS \?CCL119
	PRINTR	"Holmes says, ""I haven't mentioned any ring, Watson."""
?CCL119:	PRINTI	"Holmes says, ""I do not have "
	ICALL1	RT-THEO-PRINT
	PRINTR	"."""
?CCL112:	EQUAL?	GL-PRSA,V?FOLLOW \?CCL123
	IN?	CH-HOLMES,TH-SOFA \?CCL126
	PRINTR	"Holmes says, ""We shouldn't leave until we have spoken with our visitor."""
?CCL126:	EQUAL?	GL-PRSO,CH-ME,CH-PLAYER \?CCL128
	PRINTI	"Holmes says, ""Lead the way, Watson."""
	CRLF	
	SET	'GL-PUPPY,CH-HOLMES
	RETURN	GL-PUPPY
?CCL128:	PRINTR	"Holmes says, ""We should remain together, Watson."""
?CCL123:	PRINTR	"""Come now, Watson. You must try it yourself."""
?CCL36:	ZERO?	GL-NOW-PRSI? /?CCL130
	EQUAL?	GL-PRSA,V?GIVE \?CCL133
	EQUAL?	GL-PRSO,TH-NEWSPAPER \?CCL136
	FSET?	CH-HOLMES,FL-ASLEEP /FALSE
?CCL136:	FSET?	CH-HOLMES,FL-ASLEEP \?CCL140
	PRINTI	"Holmes glances at "
	ICALL1	RT-THEO-PRINT
	PRINTR	", but it doesn't seem to arouse his interest."
?CCL140:	FSET?	CH-HOLMES,FL-LOCKED \?CCL142
	PRINTR	"Holmes's hands aren't free. You can't give him anything."
?CCL142:	EQUAL?	GL-PRSO,TH-RING /?CTR143
	EQUAL?	GL-PRSO,TH-ETHERIUM-AMPOULE \?CCL144
	FSET?	TH-ETHERIUM-AMPOULE,FL-BROKEN /?CCL144
?CTR143:	PRINT	K-PLEASE-KEEP-IT-MSG
	CRLF	
	RTRUE	
?CCL144:	MOVE	GL-PRSO,CH-HOLMES
	ICALL	RT-CYOU-MSG,STR?711,STR?712
	ICALL1	RT-THEO-PRINT
	PRINTI	" to him. He examines it briefly and says, "
	CALL2	RT-HOLMES-DESCRIBE-MSG?,GL-PRSO
	ZERO?	STACK \TRUE
	PRINTR	"""Hmmph."""
?CCL133:	EQUAL?	GL-PRSA,V?SHOW \FALSE
	EQUAL?	GL-PRSO,TH-NEWSPAPER \?CCL156
	FSET?	CH-HOLMES,FL-ASLEEP /FALSE
?CCL156:	CALL2	RT-HOLMES-DESCRIBE-MSG?,GL-PRSO
	ZERO?	STACK \TRUE
	PRINTI	"Holmes glances at "
	ICALL1	RT-THEO-PRINT
	PRINTR	", but makes no comment."
?CCL130:	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?DIAGNOSE \?CCL165
	FSET?	CH-HOLMES,FL-ASLEEP \FALSE
	PRINTR	"He is in a trance-like state as he stares at the phial. You quickly realize that unless he hears something of interest, he will turn to the deadly drug to relieve his boredom."
?CCL165:	EQUAL?	GL-PRSA,V?HIT,V?ALARM \?CCL170
	FSET?	CH-HOLMES,FL-ASLEEP \FALSE
	PRINT	K-HOLMES-DISTRACTION-MSG
	CRLF	
	RTRUE	
?CCL170:	EQUAL?	GL-PRSA,V?ASK-FOR \?CCL175
	FSET?	CH-HOLMES,FL-ASLEEP \?CCL178
	PRINTR	"Holmes does not respond."
?CCL178:	FSET?	CH-HOLMES,FL-LOCKED \?CCL180
	PRINTR	"Holmes can't give you anything. He is tied up."
?CCL180:	EQUAL?	GL-PRSI,TH-RING \?CCL182
	IN?	TH-RING,LOCAL-GLOBALS \?CCL182
	PRINTR	"Holmes says, ""I haven't mentioned any ring, Watson."""
?CCL182:	IN?	GL-PRSI,CH-HOLMES \?CCL186
	MOVE	GL-PRSI,CH-PLAYER
	PRINTI	"Holmes gives you "
	ICALL1	RT-THEI-PRINT
	PRINTR	"."
?CCL186:	PRINTI	"Holmes says, ""I do not have "
	ICALL1	RT-THEI-PRINT
	PRINTR	"."""
?CCL175:	EQUAL?	GL-PRSA,V?TELL-ABOUT \FALSE
	EQUAL?	GL-PRSI,LG-TOWER,TH-NEWSPAPER,CH-PRIME-MINISTER \?CCL191
	FSET?	CH-HOLMES,FL-ASLEEP \?CCL191
	FSET	GL-PRSI,FL-HOLMES-TOLD
	CALL1	RT-WAKE-UP-HOLMES
	RSTACK	
?CCL191:	FSET?	CH-HOLMES,FL-ASLEEP \?CCL195
	ICALL2	RT-CTHEO-PRINT,CH-HOLMES
	PRINT	K-SEEMS-TO-HEAR-MSG
	CRLF	
	RTRUE	
?CCL195:	FSET?	GL-PRSI,FL-HOLMES-TOLD /?CCL197
	FSET	GL-PRSI,FL-HOLMES-TOLD
	PRINTR	"Holmes nods thoughtfully and says, ""Most interesting, old fellow."""
?CCL197:	PRINTI	"""Don't be tedious, Watson. You have mentioned "
	ICALL2	RT-SAY-HIM-HER-THEM-IT-MSG,GL-PRSI
	PRINTR	" to me already."""


	.FUNCT	RT-HOLMES-SAYS-AGRA-MSG
	PRINTI	" says, ""It's obviously not one of the Crown Jewels, Watson. In fact, this gem belongs to the Agra treasure, which was stolen in India many years ago and has never been recovered."""
	CRLF	
	CRLF	
	PRINTR	"""The case grows more complex, Watson. We are in more danger than I had at first suspected."" He removes a ring from one of his long, slender fingers and hands it to you. ""Here, Watson. Take this signet ring of mine. If anything should happen to me, take it to my brother Mycroft at the Diogenes Club. He'll tell you what to do."""


	.FUNCT	RT-HOLMES-DESCRIBE-MSG?,OBJ,WRD
	FSET?	CH-HOLMES,FL-ASLEEP \?CCL3
	ICALL2	RT-CTHEO-PRINT,CH-HOLMES
	PRINT	K-SEEMS-TO-HEAR-MSG
	CRLF	
	RTRUE	
?CCL3:	FSET?	CH-MORIARTY,FL-LOCKED \?CCL5
	PRINTR	"""There is no time for questions, Watson. We must get the Crown Jewels to Buckingham Palace before nine o'clock."""
?CCL5:	EQUAL?	GL-PRSA,V?WHO \?CCL7
	EQUAL?	GL-PRSO,CH-HOLMES \?CCL7
	PRINTR	"""Watson, as my biographer, you know me as well as anyone."""
?CCL7:	EQUAL?	OBJ,CH-MORIARTY \?CCL11
	FSET?	CH-HOLMES,FL-LOCKED \?CCL14
	PRINTR	"""He appears to have the upper hand, Watson."""
?CCL14:	PRINTR	"""He is the Napoleon of crime, Watson. He is the organizer of half that is evil and of nearly all that is undetected in this great city."""
?CCL11:	CALL	RT-IDENTIFY-EVENT?,W?MYCROFT,OBJ
	ZERO?	STACK /?CCL16
	PRINTR	"""Mycroft is my older brother, of whom you have heard me speak. As you know, he is a highly placed official within Her Majesty's government. Because of the confidential nature of his work, you cannot call upon him in his offices. However, he is usually to be found in his club, just off Trafalgar Square."""
?CCL16:	EQUAL?	OBJ,CH-HOLMES \?CCL18
	PRINTR	"""I'm well, Watson. Thank you for asking."""
?CCL18:	EQUAL?	OBJ,CH-PRIME-MINISTER \?CCL20
	IN?	CH-PRIME-MINISTER,RM-HOLMES-STUDY \?CCL23
	PRINTR	"""Hush, my friend. Wait until we're alone."""
?CCL23:	FSET?	CH-PRIME-MINISTER,FL-SEEN /?CCL25
	PRINTR	"""I haven't seen this visitor of whom you speak, Watson, but surely it is obvious that he has come because the Crown Jewels have been stolen from the Tower of London."""
?CCL25:	PRINTR	"""Surely you recognized him, old fellow. He is the Prime Minister of England."""
?CCL20:	EQUAL?	OBJ,CH-QUEEN \?CCL27
	PRINTR	"""She must be worried, Watson. We must get the gems back for her."""
?CCL27:	EQUAL?	OBJ,CH-WIGGINS \?CCL29
	PRINTR	"""Surely you remember him, dear fellow. He is the head of the Baker Street Irregulars."""
?CCL29:	CALL	RT-IDENTIFY-EVENT?,W?LESTRADE,OBJ
	ZERO?	STACK /?CCL31
	PRINTR	"""Be kind to him, Watson. He has delusions of adequacy."""
?CCL31:	CALL	RT-IDENTIFY-EVENT?,W?THEFT,OBJ
	ZERO?	STACK /?CCL33
	PRINTR	"""We must recover the jewels and return them to the Palace. The alternative is too horrible to consider."""
?CCL33:	EQUAL?	OBJ,TH-CROWN-JEWELS \?CCL35
	PRINTR	"""We must recover them and return them to the Palace. The alternative is too horrible to consider."""
?CCL35:	EQUAL?	OBJ,LG-TOWER /?CTR36
	CALL	RT-IDENTIFY-EVENT?,W?THEFT,OBJ
	ZERO?	STACK /?CCL37
?CTR36:	PRINTR	"""The Tower is the safest stronghold in the nation. Our adversary must be formidable indeed."""
?CCL37:	CALL	RT-IDENTIFY-EVENT?,W?JUBILEE,OBJ
	ZERO?	STACK /?CCL41
	PRINTR	"""The Coronation Day festivities begin Monday morning at 9:00. We must recover the Crown Jewels before then."""
?CCL41:	EQUAL?	OBJ,LG-TOMBS-ABBEY \?CCL43
	PRINTR	"""It is the burial place of our royalty, Watson. The spiritual centre of the empire."""
?CCL43:	CALL	RT-IDENTIFY-EVENT?,W?PASSWORD,OBJ
	ZERO?	STACK /?CCL45
	FSET?	CH-HOLMES,FL-LOCKED \?CCL48
	PRINTR	"""Obviously you were able to deduce it without my help, Watson. Good show!"""
?CCL48:	PRINTR	"""Patience, old fellow. We are not yet in possession of all the facts."""
?CCL45:	EQUAL?	OBJ,TH-WALL /?CTR49
	CALL	RT-IDENTIFY-FLOOR?,W?GROUND,OBJ
	ZERO?	STACK \?CTR49
	CALL	RT-IDENTIFY-FLOOR?,W?FLOOR,OBJ
	ZERO?	STACK /?CCL50
?CTR49:	PRINTR	"""No need to ask about that, old fellow. I'll tell you straight away if I find anything of interest."""
?CCL50:	CALL	RT-IDENTIFY-FLOOR?,W?SKY,OBJ
	ZERO?	STACK /?CCL55
	PRINTI	"Holmes glances up and says, ""It's an uncommonly fine "
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL58
	PRINTI	"night"
	JUMP	?CND56
?CCL58:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,1 \?CCL60
	PRINTI	"morning"
	JUMP	?CND56
?CCL60:	CALL1	RT-TIME-OF-DAY
	EQUAL?	STACK,2 \?CCL62
	PRINTI	"day"
	JUMP	?CND56
?CCL62:	PRINTI	"evening"
?CND56:	PRINTR	", Watson."""
?CCL55:	EQUAL?	OBJ,TH-STETHOSCOPE \?CCL64
	FSET?	TH-STETHOSCOPE,FL-TOUCHED /?CCL64
	PRINT	K-CUSTOMARILY-KEEP-MSG
	CRLF	
	RTRUE	
?CCL64:	CALL	RT-IDENTIFY-EVENT?,W?HENRY,OBJ
	ZERO?	STACK /?CCL68
	PRINTR	"""He was the son of John of Gaunt, and the father of Henry V."""
?CCL68:	CALL	RT-IDENTIFY-EVENT?,W?WELLINGTON,OBJ
	ZERO?	STACK /?CCL70
	PRINTR	"""My dear fellow, your memory is fading prematurely. Surely you remember that the Duke of Wellington was the hero of the battle of Waterloo."""
?CCL70:	CALL	RT-IDENTIFY-EVENT?,W?TOBY,OBJ
	ZERO?	STACK /?CCL72
	PRINTI	"""He is a noble hound whose olfactory prowess is unrivaled."
	FSET?	CH-SHERMAN,FL-SEEN \?CND73
	PRINTI	" It is unfortunate that he is unavailable to help us in our quest."
?CND73:	PRINTR	""""
?CCL72:	CALL	RT-IDENTIFY-EVENT?,W?AGRA,OBJ
	ZERO?	STACK /?CCL76
	PRINTR	"""The Agra treasure disappeared during the Sepoy rebellion in India. Clearly it has found its way to London."""
?CCL76:	CALL	RT-IDENTIFY-EVENT?,W?KIDNAPPING,OBJ
	ZERO?	STACK /?CCL78
	BTST	MYCROFT-STATE,4 /?CCL81
	PRINT	K-NEVER-THEORIZE-MSG
	CRLF	
	RTRUE	
?CCL81:	PRINTR	"""The professor was as surprised as we, Watson. Evidently it was a mistake on the part of one of his minions."""
?CCL78:	EQUAL?	OBJ,CH-HUDSON \?CCL83
	PRINTR	"""A splendid housekeeper, Watson, although she worries about me too much."""
?CCL83:	EQUAL?	OBJ,CH-PLAYER,CH-ME \?CCL85
	PRINTR	"""Good old Watson! You are the one fixed point in a changing age. I am honoured that you have become my biographer."""
?CCL85:	EQUAL?	OBJ,TH-PHIAL,TH-SYRINGE,TH-LIQUID \?CCL87
	PRINTR	"Holmes gives you a grateful look and says, ""We need no longer worry about that, Watson, thanks to your timely intervention."""
?CCL87:	FSET?	OBJ,FL-SEEN /?CCL89
	PRINT	K-NEVER-THEORIZE-MSG
	CRLF	
	RTRUE	
?CCL89:	EQUAL?	OBJ,CH-MATCH-SNIFFING-DOG \?CCL91
	PRINTR	"""It's not the Hound of the Baskervilles. But I certainly wouldn't care to make it angry."""
?CCL91:	EQUAL?	OBJ,CH-TUSSAUDS-GUARD \?CCL93
	PRINTR	"""Beyond the obvious facts that he is left-handed, ate kippers for breakfast, and had a poor night's sleep, I can tell you that he is a good, honest workman. Britain could use more like him."""
?CCL93:	EQUAL?	OBJ,CH-TRAINED-PIGEON \?CCL95
	PRINTI	"""A fine bird, Watson."
	CALL2	RT-VISIBLE?,CH-TRAINED-PIGEON
	ZERO?	STACK /?CND96
	PRINTI	" Note the broad band on his wing that distinguishes his breed from all others."
?CND96:	PRINTR	""""
?CCL95:	EQUAL?	OBJ,CH-SHERMAN \?CCL99
	PRINTR	"""Oh, he's an old friend of mine. He has an extraordinary bloodhound named Toby who has been of invaluable assistance to me in the past."""
?CCL99:	EQUAL?	OBJ,CH-BANK-GUARD \?CCL101
	PRINTR	"""Watch him carefully, Watson. He is a petty criminal on the lowest rung of Moriarty's organization. He's not to be trusted."""
?CCL101:	EQUAL?	OBJ,CH-AKBAR \?CCL103
	PRINTR	"""He is the gentleman from India whom we discussed earlier."""
?CCL103:	EQUAL?	OBJ,CH-DENKEEPER \?CCL105
	PRINTR	"""Be careful of him Watson. He is one of Moriarty's minions."""
?CCL105:	EQUAL?	OBJ,CH-LIBRARIAN \?CCL107
	PRINTR	"""He's just a harmless old fellow who is starved for companionship. It's a wonder he hasn't retired and joined his twin brother who lives in New Zealand."""
?CCL107:	EQUAL?	OBJ,CH-URCHINS \?CCL109
	PRINTR	"""They're all members of the Baker Street Irregulars."""
?CCL109:	EQUAL?	OBJ,CH-VENDOR \?CCL111
	PRINTR	"""He's harmless enough, although his goods are terribly overpriced."""
?CCL111:	EQUAL?	OBJ,CH-GROWLER-CABBIE \?CCL113
	PRINTR	"""He doesn't seem very bright, does he?"""
?CCL113:	EQUAL?	OBJ,CH-HANSOM-CABBIE \?CCL115
	PRINTR	"""It's clear that he has a loving wife and that he is a retired marine sergeant. Beyond that I can tell you little."""
?CCL115:	EQUAL?	OBJ,CH-BUTLER \?CCL117
	PRINTR	"""He's a supercilious old coot who ought to be stuffed."""
?CCL117:	EQUAL?	OBJ,CH-NANNIES \?CCL119
	PRINTR	"""They are the backbone of the empire, Watson."""
?CCL119:	EQUAL?	OBJ,CH-PALACE-GUARD \?CCL121
	PRINTR	"""He is obviously one of the Queen's finest - dedicated, loyal, and completely incorruptible."""
?CCL121:	EQUAL?	OBJ,CH-TOWER-GUARD \?CCL123
	PRINTR	"""I can tell you little about him, other than that he is incorruptible, he lives near Wandsworth Common, and he once worked in a tin mine."""
?CCL123:	EQUAL?	OBJ,CH-ELIZA-DOOLITTLE \?CCL125
	FSET?	CH-ELIZA-DOOLITTLE,FL-ASLEEP \?CCL128
	PRINTR	"""I bow to your medical expertise, doctor. What is your diagnosis?"""
?CCL128:	PRINTR	"""You saved her life, Watson. Professor Higgins will be most grateful."""
?CCL125:	EQUAL?	OBJ,LG-RAVENS \?CCL130
	PRINTR	"""According to the legend, when the ravens leave the Tower of London, the British Empire will fall."""
?CCL130:	EQUAL?	OBJ,TH-GUN,TH-TOBACCO,TH-PERSIAN-SLIPPER /?CTR131
	EQUAL?	OBJ,TH-MAGNIFYING-GLASS,TH-LAMP,TH-BED /?CTR131
	EQUAL?	OBJ,TH-BEDSIDE-TABLE,TH-PIPE \?CCL132
?CTR131:	PRINTR	"""Surely you remember it, Watson. Little has changed in the time since you left."""
?CCL132:	EQUAL?	OBJ,TH-WATSONS-HAT,TH-STETHOSCOPE,TH-POCKET /?CTR136
	EQUAL?	OBJ,TH-WATSONS-COAT,TH-BLACK-BAG,TH-CAB-WHISTLE \?CCL137
?CTR136:	PRINTR	"""Other than the obvious fact that it belongs to you, I can tell you nothing."""
?CCL137:	EQUAL?	OBJ,TH-BLUE-PILL-BOTTLE,TH-BROWN-PILL-BOTTLE,TH-ORANGE-PILL /?CTR140
	EQUAL?	OBJ,TH-YELLOW-PILL \?CCL141
?CTR140:	PRINTR	"""Surely you know more about it than I, Doctor."""
?CCL141:	EQUAL?	OBJ,TH-LAB-EQUIPMENT,TH-ETHERIUM-GAS,TH-ETHERIUM-AMPOULE /?CTR144
	EQUAL?	OBJ,TH-WORKBENCH \?CCL145
?CTR144:	PRINTR	"Holmes glances around quickly and then whispers, ""I know I can trust your discretion, Watson, but you must promise to keep this under your hat. I have been conducting secret experiments for the government at Mycroft's request, and I have developed a new knockout gas that I call 'etherium.' It is an extremely powerful derivative of ether, and one ampoule of it will render unconscious an entire room of people for several hours. It has no harmful side effects, but it is highly explosive and extremely dangerous to use near open flames. You may keep it if you wish, but please carry it in a secure place, safe from prying eyes."""
?CCL145:	EQUAL?	OBJ,TH-CHARLES-STATUE \?CCL149
	PRINTR	"""He is the only English king to have been beheaded."""
?CCL149:	EQUAL?	OBJ,TH-WILLIAM-STATUE \?CCL151
	PRINTR	"""They say when he first came ashore, he stumbled and fell, and his soldiers took it as a bad omen. But then he arose with two fistfuls of sand and shouted, 'See! Already I have taken my kingdom into my grasp.' His men cheered and they marched on to victory at the Battle of Hastings."""
?CCL151:	EQUAL?	OBJ,TH-WALTER-STATUE \?CCL153
	PRINTR	"""His chivalry did him no good. Although a favourite of the Queen for many years, his life ended on the executioner's block."""
?CCL153:	EQUAL?	OBJ,TH-VIOLIN \?CCL155
	PRINTR	"""It's a Stradivarius."""
?CCL155:	EQUAL?	OBJ,TH-RING \?CCL157
	PRINTR	"""It's an heirloom that's been in my family for generations."""
?CCL157:	EQUAL?	OBJ,TH-TRINKETS \?CCL159
	PRINTR	"""They've been marked up for the Jubilee. I certainly wouldn't pay full price for them."""
?CCL159:	EQUAL?	OBJ,TH-WESTMINSTER-CLUE \?CCL161
	PRINTR	"""Most curious, don't you agree Watson? All thieves unintentionaly leave behind clues that are discernable to the trained eye. But it is highly irregular for a thief to taunt the authorities with an actual message. Especially one with references as obvious as this."""
?CCL161:	EQUAL?	OBJ,TH-RUBY,TH-EMERALD,TH-SAPPHIRE /?CTR162
	EQUAL?	OBJ,TH-GARNET,TH-OPAL,TH-TOPAZ \?CCL163
?CTR162:	BAND	CH-HOLMES-AUX1,K-HOLMES-GEM?
	ZERO?	STACK /?CCL168
	PRINTR	"""We have already discussed the significance of these gems, Watson."""
?CCL168:	FSET?	OBJ,FL-TOUCHED \?CCL170
	BOR	CH-HOLMES-AUX1,K-HOLMES-GEM? >CH-HOLMES-AUX1
	MOVE	TH-RING,CH-PLAYER
	FSET	TH-RING,FL-SEEN
	FSET	TH-RING,FL-TOUCHED
	FCLEAR	TH-RING,FL-NODESC
	PRINTI	"Holmes"
	ICALL1	RT-HOLMES-SAYS-AGRA-MSG
	GETP	TH-RING,P?VALUE
	ICALL2	RT-UPDATE-SCORE,STACK
	PUTP	TH-RING,P?VALUE,0
	RTRUE	
?CCL170:	PRINTR	"""We haven't had a good enough look at it yet, old fellow."""
?CCL163:	EQUAL?	OBJ,TH-ASH \FALSE
	PRINTC	34
	CALL2	RT-VISIBLE?,TH-ASH
	ZERO?	STACK /?CND173
	PRINTI	"Note the characteristic texture, Watson. "
?CND173:	PRINTI	"It is the ash of a Trichinopoly cigar, which is made from the dark tobacco that grows only in the Madras district of India."
	CRLF	
	CRLF	
	PRINTR	"Unless I miss my guess, Watson, our mastermind friend has joined forces with an Indian accomplice who does his dirty work for him."""


	.FUNCT	RT-AC-CH-MATCH-SNIFFING-DOG,CONTEXT
	ICALL2	RT-THIS-IS-IT,CH-MATCH-SNIFFING-DOG
	EQUAL?	CONTEXT,K-M-DESCFCN \?CND1
	ICALL2	RT-CTHEO-PRINT,CH-MATCH-SNIFFING-DOG
	PRINTR	" glares back at you menacingly."
?CND1:	EQUAL?	CONTEXT,K-M-WINNER \?CCL5
	ICALL2	RT-CTHEO-PRINT,CH-MATCH-SNIFFING-DOG
	PRINT	K-GNAWS-MSG
	CRLF	
	RTRUE	
?CCL5:	ZERO?	GL-NOW-PRSI? /?CCL7
	EQUAL?	GL-PRSA,V?GIVE,V?SHOW \FALSE
	EQUAL?	GL-PRSO,TH-TOBACCO /?PRD14
	FSET?	GL-PRSO,FL-BURNABLE \?PRD14
	FSET?	GL-PRSO,FL-LIGHTED /?CTR9
?PRD14:	EQUAL?	GL-PRSO,TH-MATCH \?PRD18
	FSET?	GL-PRSO,FL-BURNABLE /?CTR9
?PRD18:	EQUAL?	GL-PRSO,TH-LAMP \FALSE
?CTR9:	ICALL	SOUNDS,S-BARK,S-START,8,4
	ICALL1	RT-CTHEI-PRINT
	PRINTI	" barks loudly at "
	ICALL1	RT-THEO-PRINT
	PRINTR	"."
?CCL7:	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?TOUCH,V?KICK \?CCL25
	PRINTR	"A quick snap and a glimpse of flashing teeth changes your mind."
?CCL25:	EQUAL?	GL-PRSA,V?LISTEN \?CCL27
	ICALL1	RT-CTHEO-PRINT
	PRINTI	" growls at you."
	CRLF	
	ICALL2	SOUNDS,S-GROWL
	RTRUE	
?CCL27:	EQUAL?	GL-PRSA,V?ASK-FOR,V?ASK-ABOUT \?CCL29
	ICALL2	RT-CTHEO-PRINT,CH-MATCH-SNIFFING-DOG
	PRINT	K-GNAWS-MSG
	CRLF	
	RTRUE	
?CCL29:	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	EQUAL?	GL-PRSO,CH-MATCH-SNIFFING-DOG \FALSE
	ICALL	RT-CYOU-MSG,STR?713,STR?714
	PRINTI	"the unfortunate dog. The guard, enraged by this callous behavior, wrestles you to the ground and calls for a policeman. Lestrade pops up out of nowhere and says, ""Tut, tut. Killing a poor defenceless dog now, is it? You should be ashamed of yourself."""
	CRLF	
	CRLF	
	PRINTI	"He hauls you away and enrolls you in a six-month course sponsored by the RSPCA which teaches you to love animals and eat vegetables. You emerge from the course a better man. Unfortunately no one cares because by then the country has gone to the dogs."
	CRLF	
	CRLF	
	ICALL1	RT-QSR
	RFALSE	


	.FUNCT	RT-AC-CH-TUSSAUDS-GUARD,CONTEXT,OBJ
	ICALL2	RT-THIS-IS-IT,CH-TUSSAUDS-GUARD
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	ICALL2	RT-CTHEO-PRINT,CH-TUSSAUDS-GUARD
	PRINTR	" has his collar turned up against the cold. He is pacing back and forth, puffing on a cigarette, and stamping his feet, all in a futile effort to keep warm."
?CCL3:	EQUAL?	GL-PRSA,V?ASK-FOR \?CCL5
	EQUAL?	GL-PRSI,TH-CIGARETTE \?CCL5
	PRINTR	"""Sorry, sir. I'm running low."""
?CCL5:	EQUAL?	GL-PRSA,V?ASK-ABOUT \?CCL9
	EQUAL?	GL-PRSI,TH-CIGARETTE \?CCL9
	PRINTR	"""I'm a chain smoker. Fortunately, the dog doesn't seem to mind."""
?CCL9:	CALL2	RT-TELL-ABOUT?,CH-TUSSAUDS-GUARD
	ZERO?	STACK /?CCL13
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL16
	SET	'OBJ,GL-PRSO
	JUMP	?CND14
?CCL16:	SET	'OBJ,GL-PRSI
?CND14:	PRINT	K-ON-DUTY-MSG
	CRLF	
	RTRUE	
?CCL13:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL18
	RETURN	2
?CCL18:	EQUAL?	CONTEXT,K-M-WINNER \?CCL20
	EQUAL?	GL-PRSA,V?WHERE \?CCL23
	CALL2	RT-VISIBLE?,GL-PRSO
	ZERO?	STACK /?CCL23
	PRINTR	"""Right here, sir."""
?CCL23:	EQUAL?	GL-PRSA,V?YES \?CCL27
	PRINT	K-GOOD-SHOW-MSG
	CRLF	
	RTRUE	
?CCL27:	EQUAL?	GL-PRSA,V?NO \?CCL29
	PRINT	K-PITY-MSG
	CRLF	
	RTRUE	
?CCL29:	EQUAL?	GL-PRSA,V?MAYBE \?CCL31
	PRINT	K-MAYBE-MSG
	CRLF	
	RTRUE	
?CCL31:	PRINT	K-ON-DUTY-MSG
	CRLF	
	RTRUE	
?CCL20:	ZERO?	GL-NOW-PRSI? /?CCL33
	EQUAL?	GL-PRSA,V?TAKE \FALSE
	CALL	RT-IMPOLITE-MSG,STR?715,STR?716
	RSTACK	
?CCL33:	ZERO?	GL-NOW-PRSI? /FALSE
	RFALSE	


	.FUNCT	RT-PIGEON-PANIC
	MOVE	CH-TRAINED-PIGEON,CH-PLAYER
	ICALL2	RT-CTHEO-PRINT,CH-TRAINED-PIGEON
	PRINTR	" flies about in a panic for a few moments and then flies right back into your hands."


	.FUNCT	RT-PIGEON-FLY
	PRINTI	" flies up into the air"
	EQUAL?	GL-PLACE-CUR,RM-TRAFALGAR-SQUARE \?CND1
	SET	'CH-TRAINED-PIGEON-AUX3,TH-RED-GLASS
	BAND	CH-TRAINED-PIGEON-AUX1,K-PIGEON-SHOWN-RUBY
	ZERO?	STACK /?CCL5
	BAND	CH-TRAINED-PIGEON-AUX1,K-PIGEON-GET-RUBY
	ZERO?	STACK /?CCL5
	PRINTI	", gets "
	ICALL2	RT-THEO-PRINT,TH-RUBY
	PRINTC	44
	SET	'CH-TRAINED-PIGEON-AUX3,TH-RUBY
	JUMP	?CND1
?CCL5:	BAND	CH-TRAINED-PIGEON-AUX1,K-PIGEON-SHOWN-RUBY
	ZERO?	STACK /?CCL9
	PRINTI	", sees "
	ICALL2	RT-THEO-PRINT,TH-RUBY
	PRINTI	" and "
	ICALL2	RT-A-PRINT,TH-RED-GLASS
	PRINTI	" that you didn't see, chooses "
	ICALL2	RT-THEO-PRINT,TH-RED-GLASS
	PRINTC	44
	JUMP	?CND1
?CCL9:	BAND	CH-TRAINED-PIGEON-AUX1,K-PIGEON-GET-RUBY
	ZERO?	STACK /?CND1
	PRINTI	", sees "
	ICALL2	RT-A-PRINT,TH-RED-GLASS
	PRINTI	" that you didn't see, gets it,"
?CND1:	ZERO?	CH-TRAINED-PIGEON-AUX3 /?CND11
	FSET	CH-TRAINED-PIGEON-AUX3,FL-TAKEABLE
	MOVE	CH-TRAINED-PIGEON-AUX3,CH-TRAINED-PIGEON
?CND11:	MOVE	CH-TRAINED-PIGEON,GL-PLACE-CUR
	FSET	CH-TRAINED-PIGEON,FL-NODESC
	SET	'CH-TRAINED-PIGEON-AUX2,1
	CALL	RT-DO-CLOCK-SET,GL-TIME-PARM,0,1,0
	ICALL	RT-ALARM-SET-REL,RT-I-PIGEON-CIRCLE,STACK
	PRINTR	" and starts to circle high over your head."


	.FUNCT	RT-AC-CH-TRAINED-PIGEON,CONTEXT,OBJ
	ICALL2	RT-THIS-IS-IT,CH-TRAINED-PIGEON
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	IN?	CH-TRAINED-PIGEON,CH-SHERMAN \?CCL6
	ICALL2	DPRINT,CH-SHERMAN
	PRINTI	" is holding "
	ICALL2	RT-THEO-PRINT,CH-TRAINED-PIGEON
	JUMP	?CND4
?CCL6:	ZERO?	CH-TRAINED-PIGEON-AUX2 \TRUE
	ICALL2	RT-CTHEO-PRINT,CH-TRAINED-PIGEON
	BAND	CH-TRAINED-PIGEON-AUX1,K-PIGEON-SHOWN-RUBY
	ZERO?	STACK /?CCL11
	BAND	CH-TRAINED-PIGEON-AUX1,K-PIGEON-GET-RUBY
	ZERO?	STACK /?CCL11
	PRINTI	" trembles with excitement"
	JUMP	?CND4
?CCL11:	ADD	K-PIGEON-SHOWN-RUBY,K-PIGEON-GET-RUBY
	BAND	CH-TRAINED-PIGEON-AUX1,STACK
	ZERO?	STACK /?CCL15
	PRINTI	" looks interested"
	JUMP	?CND4
?CCL15:	PRINTI	" doesn't seem interested in anything"
?CND4:	PRINTR	"."
?CCL3:	CALL2	RT-TELL-ABOUT?,CH-TRAINED-PIGEON
	ZERO?	STACK /?CCL17
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL20
	SET	'OBJ,GL-PRSO
	JUMP	?CND18
?CCL20:	SET	'OBJ,GL-PRSI
?CND18:	PRINT	K-CONFUSED-MSG
	CRLF	
	RTRUE	
?CCL17:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL22
	RETURN	2
?CCL22:	EQUAL?	CONTEXT,K-M-WINNER \?CCL24
	EQUAL?	GL-PRSA,V?TAKE \?CCL27
	EQUAL?	GL-PRSO,TH-RUBY \?CCL27
	ICALL2	RT-THIS-IS-IT,TH-RUBY
	ICALL2	RT-PIGEON-INTEREST,K-PIGEON-GET-RUBY
	RTRUE	
?CCL27:	PRINT	K-CONFUSED-MSG
	CRLF	
	RTRUE	
?CCL24:	EQUAL?	GL-PRSA,V?PUT \?CCL31
	ZERO?	GL-NOW-PRSI? \?CCL31
	EQUAL?	GL-PRSI,TH-SHAFT \?CCL36
	SET	'CH-TRAINED-PIGEON-AUX1,0
	ICALL1	RT-PIGEON-PANIC
	RTRUE	
?CCL36:	EQUAL?	GL-PRSI,TH-POCKET \?CTR37
	FSET?	GL-PLACE-CUR,FL-INDOORS \?CCL38
?CTR37:	ICALL1	RT-PIGEON-PANIC
	RTRUE	
?CCL38:	PRINTI	"As soon as"
	ICALL	RT-YOU-MSG,STR?717,STR?718
	PRINTI	"go of it, the pigeon"
	ICALL1	RT-PIGEON-FLY
	RTRUE	
?CCL31:	EQUAL?	GL-PRSA,V?DROP,V?RELEASE,V?THROW \?CCL42
	ZERO?	GL-NOW-PRSI? \?CCL42
	IN?	CH-TRAINED-PIGEON,CH-PLAYER \?CCL47
	ICALL2	RT-ALARM-CLR,RT-I-PIGEON-LOSE-INTEREST
	ICALL2	RT-ALARM-CLR,RT-I-PIGEON-IMPATIENT
	FSET?	GL-PLACE-CUR,FL-INDOORS \?CCL50
	ICALL1	RT-PIGEON-PANIC
	SET	'CH-TRAINED-PIGEON-AUX1,0
	RTRUE	
?CCL50:	ICALL2	RT-CTHEO-PRINT,CH-TRAINED-PIGEON
	ICALL1	RT-PIGEON-FLY
	RTRUE	
?CCL47:	ICALL1	RT-CYOU-MSG
	PRINTR	"would have to be holding the pigeon."
?CCL42:	EQUAL?	GL-PRSA,V?TAKE \?CCL52
	ZERO?	CH-TRAINED-PIGEON-AUX2 /?CCL55
	ICALL1	RT-CYOU-MSG
	PRINTI	"cannot reach "
	ICALL1	RT-THEO-PRINT
	PRINTR	"."
?CCL55:	IN?	CH-TRAINED-PIGEON,CH-SHERMAN \FALSE
	ICALL	RT-IMPOLITE-MSG,STR?715,STR?716
	RTRUE	
?CCL52:	EQUAL?	GL-PRSA,V?ASK-FOR \?CCL59
	ZERO?	GL-NOW-PRSI? /?CCL59
	ICALL1	RT-GET-PIGEON
	RTRUE	
?CCL59:	EQUAL?	GL-PRSA,V?SHOW \?CCL63
	ZERO?	GL-NOW-PRSI? /?CCL63
	EQUAL?	GL-PRSO,TH-RUBY \?CCL68
	ICALL2	RT-THIS-IS-IT,TH-RUBY
	ICALL2	RT-PIGEON-INTEREST,K-PIGEON-SHOWN-RUBY
	RTRUE	
?CCL68:	PRINTI	"The pigeon doesn't seem to be interested in "
	ICALL1	RT-THEO-PRINT
	PRINTR	"."
?CCL63:	EQUAL?	GL-PRSA,V?KILL,V?SHOOT \?CCL70
	EQUAL?	GL-PRSO,CH-TRAINED-PIGEON \?CCL70
	EQUAL?	GL-PRSI,TH-GUN /?CTR74
	EQUAL?	GL-PRSA,V?SHOOT \?CCL75
?CTR74:	CALL	RT-META-IN?,GL-PRSO,CH-PLAYER
	ZERO?	STACK /?CCL80
	PRINT	K-DROP-IT-FIRST-MSG
	CRLF	
	RTRUE	
?CCL80:	ZERO?	CH-TRAINED-PIGEON-AUX2 /?CCL83
	PRINTI	"Flap. Flap. Flap. Thud."
	CRLF	
	JUMP	?CND73
?CCL83:	PRINTI	"You shoot "
	ICALL1	RT-THEO-PRINT
	PRINTI	" and it dies."
	CRLF	
	JUMP	?CND73
?CCL75:	EQUAL?	GL-PRSI,TH-KNIFE /?CTR84
	EQUAL?	GL-P-PRSA-WORD,W?STAB \?CCL85
?CTR84:	ZERO?	CH-TRAINED-PIGEON-AUX2 /?CCL90
	PRINTI	"You throw "
	ICALL1	RT-THEI-PRINT
	PRINTI	" at "
	ICALL1	RT-THEO-PRINT
	PRINTI	". Fortunately, it misses and falls on the ground nearby."
	CRLF	
	MOVE	GL-PRSI,GL-PLACE-CUR
	RTRUE	
?CCL90:	PRINTI	"You slice "
	ICALL1	RT-THEO-PRINT
	PRINTI	" into luncheon meat and cry out, ""Squab, anyone?"""
	CRLF	
	JUMP	?CND73
?CCL85:	EQUAL?	GL-PRSI,TH-HANDS \?CCL92
	ZERO?	CH-TRAINED-PIGEON-AUX2 /?CCL95
	PRINTR	"You can't reach the pigeon."
?CCL95:	PRINTI	"You throttle the poor bird."
	CRLF	
?CND73:	ZERO?	CH-TRAINED-PIGEON-AUX2 /?CND96
	ZERO?	CH-TRAINED-PIGEON-AUX3 /?CND96
	MOVE	CH-TRAINED-PIGEON-AUX3,GL-PLACE-CUR
?CND96:	ICALL1	RT-KILL-PIGEON
	RTRUE	
?CCL92:	PRINTI	"You can't kill "
	ICALL1	RT-THEO-PRINT
	PRINTI	" with "
	ICALL1	RT-THEI-PRINT
	PRINTR	"."
?CCL70:	EQUAL?	GL-PRSA,V?TOUCH \?CCL101
	ZERO?	GL-NOW-PRSI? \?CCL101
	ICALL1	RT-CTHEO-PRINT
	PRINTR	" coos and nuzzles your hand."
?CCL101:	EQUAL?	GL-PRSA,V?CALL \FALSE
	ZERO?	GL-NOW-PRSI? \FALSE
	CALL	RT-META-IN?,CH-TRAINED-PIGEON,GL-WINNER
	ZERO?	STACK /?CCL110
	ICALL	RT-CYOU-MSG,STR?705,STR?706
	ICALL1	RT-THEO-PRINT
	PRINTR	"."
?CCL110:	ZERO?	CH-TRAINED-PIGEON-AUX2 /?CCL112
	ICALL1	RT-CTHEO-PRINT
	PRINTI	" ignores "
	EQUAL?	GL-WINNER,CH-PLAYER,CH-ME \?CCL115
	PRINTI	"you"
	JUMP	?CND113
?CCL115:	ICALL2	RT-THEO-PRINT,GL-WINNER
?CND113:	PRINTR	", intent on its task."
?CCL112:	ICALL1	RT-CTHEO-PRINT
	PRINTI	" looks at"
	ICALL1	RT-YOU-MSG
	PRINTR	"briefly, then loses interest."


	.FUNCT	RT-AC-CH-SHERMAN,CONTEXT,OBJ,OBJ1,P-OBJ,WHO
	ICALL2	RT-THIS-IS-IT,CH-SHERMAN
	EQUAL?	CONTEXT,K-M-DESCFCN \?CND1
	FSET?	CH-SHERMAN,FL-ASLEEP \FALSE
	PRINTR	"Sherman is quite unconscious."
?CND1:	SET	'P-OBJ,CH-TRAINED-PIGEON-AUX3
	EQUAL?	CONTEXT,K-M-WINNER \?CCL7
	FSET?	CH-SHERMAN,FL-ASLEEP \?CCL7
	CALL2	RT-NO-CONDITION-MSG,GL-WINNER
	RSTACK	
?CCL7:	CALL2	RT-TELL-ABOUT?,CH-SHERMAN
	ZERO?	STACK /?CCL11
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL14
	SET	'OBJ,GL-PRSO
	JUMP	?CND12
?CCL14:	SET	'OBJ,GL-PRSI
?CND12:	FSET?	CH-SHERMAN,FL-ASLEEP \?CCL17
	ICALL2	RT-NO-CONDITION-MSG,CH-SHERMAN
	RTRUE	
?CCL17:	EQUAL?	OBJ,CH-TRAINED-PIGEON \?CCL19
	BAND	CH-TRAINED-PIGEON-AUX1,K-PIGEON-TIRED
	ZERO?	STACK /?CCL22
	IN?	P-OBJ,CH-SHERMAN \?CCL25
	PRINTI	"Sherman says, ""He came back with "
	ICALL2	RT-A-PRINT,P-OBJ
	PRINTI	". I don't know where he found it."" He gives you "
	ICALL2	RT-THEO-PRINT,P-OBJ
	PRINTC	46
	CRLF	
	ICALL2	RT-PIGEON-OBJ,P-OBJ
	RTRUE	
?CCL25:	PRINTR	"""He's resting now."""
?CCL22:	PRINTR	"""He's a wonderful bird. All you have to do is show him something and tell him to get it, and away he goes. The only catch is, he only seems to like things that are red."""
?CCL19:	CALL	RT-IDENTIFY-EVENT?,W?TOBY,OBJ
	ZERO?	STACK /?CCL27
	PRINTR	"""He seems to have a cold, which in his line of work renders him completely useless."""
?CCL27:	EQUAL?	OBJ,CH-SHERMAN \?CCL29
	PRINTR	"""I'm well. Thank you for asking."""
?CCL29:	EQUAL?	OBJ,CH-HOLMES \?CCL31
	PRINTR	"""Sherlock and me? We've been mates for years."""
?CCL31:	EQUAL?	OBJ,P-OBJ \?CCL33
	IN?	P-OBJ,CH-SHERMAN \?CCL33
	PRINTI	"Sherman says, ""The pigeon came back with "
	ICALL2	RT-A-PRINT,P-OBJ
	PRINTI	". I don't know where he found it."" He gives you "
	ICALL2	RT-THEO-PRINT,P-OBJ
	PRINTC	46
	CRLF	
	ICALL2	RT-PIGEON-OBJ,P-OBJ
	RTRUE	
?CCL33:	PRINTI	"""I don't know anything about "
	ICALL2	RT-THEO-PRINT,OBJ
	PRINTR	"."""
?CCL11:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL37
	RETURN	2
?CCL37:	EQUAL?	CONTEXT,K-M-WINNER \?CCL39
	EQUAL?	GL-PRSA,V?TAKE \?CCL39
	EQUAL?	GL-PRSO,CH-TRAINED-PIGEON /?CTR38
	CALL	RT-IDENTIFY-EVENT?,W?TOBY,GL-PRSO
	ZERO?	STACK /?CCL39
?CTR38:	SET	'GL-WINNER,CH-PLAYER
	ICALL	RT-PERFORM,V?ASK-FOR,CH-SHERMAN,GL-PRSO
	RTRUE	
?CCL39:	EQUAL?	GL-PRSA,V?ASK-FOR \?PRD48
	ZERO?	GL-NOW-PRSI? \?PRD48
	SET	'OBJ1,GL-PRSI
	ZERO?	OBJ1 \?CTR45
?PRD48:	EQUAL?	GL-PRSA,V?GIVE \?CCL46
	EQUAL?	GL-PRSI,CH-ME,CH-PLAYER \?CCL46
	EQUAL?	CONTEXT,K-M-WINNER \?CCL46
	SET	'OBJ1,GL-PRSO
	ZERO?	OBJ1 /?CCL46
?CTR45:	FSET?	CH-SHERMAN,FL-ASLEEP \?CCL58
	ICALL2	RT-NO-CONDITION-MSG,CH-SHERMAN
	RTRUE	
?CCL58:	EQUAL?	OBJ1,CH-TRAINED-PIGEON \?CCL60
	ICALL1	RT-GET-PIGEON
	RTRUE	
?CCL60:	CALL	RT-IDENTIFY-EVENT?,W?TOBY,OBJ1
	ZERO?	STACK /?CCL62
	PRINTR	"""He's not well enough to work."""
?CCL62:	EQUAL?	OBJ1,P-OBJ \?CCL64
	IN?	P-OBJ,CH-SHERMAN \?CCL67
	PRINTI	"Sherman says, ""Oh, yes. The pigeon came back with "
	ICALL2	RT-A-PRINT,P-OBJ
	PRINTI	". I don't know where he found it."" He gives you "
	ICALL2	RT-THEO-PRINT,P-OBJ
	PRINTC	46
	CRLF	
	ICALL2	RT-PIGEON-OBJ,P-OBJ
	RTRUE	
?CCL67:	PRINTR	"""I already gave it to you."""
?CCL64:	IN?	GL-PRSI,CH-SHERMAN \?CCL69
	PRINTI	"He gives you "
	ICALL2	RT-THEO-PRINT,OBJ1
	PRINTC	46
	CRLF	
	MOVE	OBJ1,CH-PLAYER
	ICALL2	RT-THIS-IS-IT,OBJ1
	FSET	OBJ1,FL-SEEN
	FSET	OBJ1,FL-TOUCHED
	FCLEAR	OBJ1,FL-NODESC
	RTRUE	
?CCL69:	PRINTI	"""I don't have "
	ICALL2	RT-A-PRINT,OBJ1
	PRINTR	"."""
?CCL46:	EQUAL?	GL-PRSA,V?TAKE \?CCL71
	ZERO?	GL-NOW-PRSI? /?CCL71
	ICALL	RT-IMPOLITE-MSG,STR?715,STR?716
	RTRUE	
?CCL71:	EQUAL?	CONTEXT,K-M-WINNER \FALSE
	EQUAL?	GL-PRSA,V?HELLO \?CCL78
	PRINTR	"""Hello, Dr Watson."""
?CCL78:	EQUAL?	GL-PRSA,V?GOODBYE \?CCL80
	PRINTR	"""Goodbye, Dr Watson."""
?CCL80:	EQUAL?	GL-PRSA,V?THANK \?CCL82
	PRINTR	"""You're welcome."""
?CCL82:	EQUAL?	GL-PRSA,V?GIVE-SWP /FALSE
	EQUAL?	GL-PRSA,V?YES \?CCL86
	PRINT	K-GOOD-SHOW-MSG
	CRLF	
	RTRUE	
?CCL86:	EQUAL?	GL-PRSA,V?WHERE \?CCL88
	CALL2	RT-VISIBLE?,GL-PRSO
	ZERO?	STACK /?CCL88
	PRINTR	"""Right here, Doctor."""
?CCL88:	EQUAL?	GL-PRSA,V?NO \?CCL92
	PRINT	K-PITY-MSG
	CRLF	
	RTRUE	
?CCL92:	EQUAL?	GL-PRSA,V?MAYBE \?CCL94
	PRINT	K-MAYBE-MSG
	CRLF	
	RTRUE	
?CCL94:	ICALL2	RT-CTHEO-PRINT,CH-SHERMAN
	PRINTR	" says, ""Unfortunately, I won't be able to help you with that."""


	.FUNCT	RT-AC-CH-PRIME-MINISTER,CONTEXT,OBJ
	ICALL2	RT-THIS-IS-IT,CH-PRIME-MINISTER
	EQUAL?	CONTEXT,K-M-CONT \?CCL3
	PRINTR	"You should be ashamed of yourself."
?CCL3:	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL5
	PRINTI	"He is an elderly man with bushy eyebrows and muttonchop whiskers."
	FSET?	CH-PRIME-MINISTER,FL-ASLEEP \?CND6
	PRINTR	" He is also unconscious, thanks to you."
?CND6:	CRLF	
	RTRUE	
?CCL5:	EQUAL?	CONTEXT,K-M-WINNER \?CCL9
	FSET?	GL-WINNER,FL-ASLEEP \?CCL9
	ICALL2	RT-NO-CONDITION-MSG,GL-WINNER
	RFALSE	
?CCL9:	CALL2	RT-TELL-ABOUT?,CH-PRIME-MINISTER
	ZERO?	STACK /?CCL13
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL16
	SET	'OBJ,GL-PRSO
	JUMP	?CND14
?CCL16:	SET	'OBJ,GL-PRSI
?CND14:	EQUAL?	OBJ,CH-QUEEN \?CCL19
	PRINTR	"""It was she herself who suggested consulting Mr Holmes."""
?CCL19:	EQUAL?	OBJ,TH-WESTMINSTER-CLUE \?CCL21
	PRINTR	"""We are all baffled by it. That is why we have come to Mr Holmes."""
?CCL21:	EQUAL?	OBJ,LG-TOWER \?CCL23
	PRINTR	"""Naturally we have closed it until the investigation is terminated. No one has been allowed to leave since the theft was discovered."""
?CCL23:	EQUAL?	OBJ,CH-HOLMES \?CCL25
	PRINTR	"""We learned of his talents from his brother, Mycroft."""
?CCL25:	CALL	RT-IDENTIFY-EVENT?,W?MYCROFT,OBJ
	ZERO?	STACK /?CCL27
	PRINTR	"""As you are no doubt aware, his involvement with the government is too sensitive for me to discuss."""
?CCL27:	EQUAL?	OBJ,CH-HUDSON \?CCL29
	PRINTR	"""She was good enough to serve me tea while I waited. Splendid woman."""
?CCL29:	EQUAL?	OBJ,CH-MORIARTY \?CCL31
	PRINTR	"""I don't believe I'm familiar with that name."""
?CCL31:	EQUAL?	OBJ,TH-CROWN-JEWELS /?CTR32
	CALL	RT-IDENTIFY-EVENT?,W?THEFT,OBJ
	ZERO?	STACK /?CCL33
?CTR32:	PRINTR	"""If the theft is discovered, the public's faith in this government will be shattered. I shall be forced to resign."""
?CCL33:	PRINTR	"""Come, Doctor. Let us stick to the essentials."""
?CCL13:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL37
	RETURN	2
?CCL37:	EQUAL?	CONTEXT,K-M-WINNER \FALSE
	EQUAL?	GL-PRSA,V?YES \?CCL41
	PRINT	K-GOOD-SHOW-MSG
	CRLF	
	RFALSE	
?CCL41:	EQUAL?	GL-PRSA,V?NO \?CCL43
	PRINT	K-PITY-MSG
	CRLF	
	RFALSE	
?CCL43:	EQUAL?	GL-PRSA,V?MAYBE \?CCL45
	PRINT	K-MAYBE-MSG
	CRLF	
	RFALSE	
?CCL45:	PRINTR	"""Surely, Doctor, we should not waste our time on such trivial activities."""


	.FUNCT	RT-AC-CH-AKBAR,CONTEXT,HAT,OBJ,WRD,ADJ
	ICALL2	RT-THIS-IS-IT,CH-AKBAR
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	PRINTR	"He is a tall, dark-skinned Indian who wears a white turban."
?CCL3:	EQUAL?	CONTEXT,K-M-WINNER \?CCL5
	FSET?	GL-WINNER,FL-ASLEEP \?CCL5
	CALL2	RT-NO-CONDITION-MSG,GL-WINNER
	RSTACK	
?CCL5:	CALL2	RT-TELL-ABOUT?,CH-AKBAR
	ZERO?	STACK /?CCL9
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL12
	SET	'OBJ,GL-PRSO
	JUMP	?CND10
?CCL12:	SET	'OBJ,GL-PRSI
?CND10:	FSET?	CH-AKBAR,FL-ASLEEP \?CCL15
	CALL2	RT-NO-CONDITION-MSG,CH-AKBAR
	RSTACK	
?CCL15:	PRINTI	"""I know little"
	FSET?	TH-WATSONS-HAT,FL-WORN \?CND16
	PRINTI	", honoured sir"
?CND16:	PRINTR	". I have only been in your country a short distance."""
?CCL9:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL19
	RETURN	2
?CCL19:	EQUAL?	CONTEXT,K-M-WINNER \?CCL21
	FSET?	CH-AKBAR,FL-ASLEEP \?CCL24
	CALL2	RT-NO-CONDITION-MSG,CH-AKBAR
	RSTACK	
?CCL24:	EQUAL?	GL-PRSA,V?YES \?CCL26
	PRINT	K-GOOD-SHOW-MSG
	CRLF	
	RTRUE	
?CCL26:	EQUAL?	GL-PRSA,V?NO \?CCL28
	PRINT	K-PITY-MSG
	CRLF	
	RTRUE	
?CCL28:	EQUAL?	GL-PRSA,V?MAYBE \?CCL30
	PRINT	K-MAYBE-MSG
	CRLF	
	RTRUE	
?CCL30:	CALL	RT-NOT-LIKELY-MSG,CH-AKBAR,STR?719
	RSTACK	
?CCL21:	ZERO?	GL-NOW-PRSI? \?CCL32
	EQUAL?	GL-PRSA,V?CALL \?CCL35
	FSET?	CH-AKBAR,FL-ASLEEP \?CCL38
	CALL2	RT-NO-CONDITION-MSG,CH-AKBAR
	RSTACK	
?CCL38:	PRINTI	"""I am here"
	FSET?	TH-WATSONS-HAT,FL-WORN \?CND39
	PRINTI	", sahib"
?CND39:	PRINTR	". What is it you wish?"""
?CCL35:	EQUAL?	GL-PRSA,V?TELL-ABOUT \FALSE
	GET	GL-P-NAMW,1 >WRD
	GET	GL-P-ADJW,1 >ADJ
	FSET?	CH-AKBAR,FL-ASLEEP \?CCL45
	CALL2	RT-NO-CONDITION-MSG,CH-AKBAR
	RSTACK	
?CCL45:	EQUAL?	WRD,W?SWORDFISH,W?PASSWORD,W?HUSH \?CCL47
	PRINTR	"""Passwords are for others. I must have something tangible."""
?CCL47:	EQUAL?	WRD,W?GIN \?CCL49
	PRINTR	"""No thank you. My religion forbids alcoholic beverages."""
?CCL49:	CALL	RT-IDENTIFY-EVENT?,W?PASSWORD,GL-PRSI
	ZERO?	STACK /?CCL51
	PRINTR	"""She sounds interesting. Can she make curried mongoose?"""
?CCL51:	EQUAL?	GL-PRSI,TH-GARNET \?CCL53
	PRINTR	"""I must see it before I believe it."""
?CCL53:	EQUAL?	GL-PRSI,TH-ASH \?CCL55
	PRINTR	"Akbar hesitates, then says, ""I do not know what you are talking about."""
?CCL55:	PRINTC	34
	ICALL1	RT-CTHEI-PRINT
	ICALL2	RT-DONT-DOESNT-MSG,GL-PRSI
	PRINTR	"interest me."""
?CCL32:	ZERO?	GL-NOW-PRSI? /FALSE
	EQUAL?	GL-PRSA,V?GIVE,V?SHOW \FALSE
	EQUAL?	GL-PRSO,TH-GARNET \FALSE
	CALL	RT-DO-CLOCK-SET,GL-TIME-PARM,0,50,0
	ICALL	RT-ALARM-SET-REL,RT-I-OUT-OF-TIME,STACK
	FSET?	TH-WATSONS-HAT,FL-WORN /?PRD63
	PUSH	0
	JUMP	?PRD64
?PRD63:	PUSH	1
?PRD64:	SET	'HAT,STACK
	CALL	RT-META-IN?,TH-BOX-KEY,CH-PLAYER
	ZERO?	STACK /?CND65
	REMOVE	TH-BOX-KEY
?CND65:	ICALL	RT-MOVE-ALL,CH-PLAYER,RM-LAIR
	ICALL	RT-MOVE-ALL,TH-LAPEL,RM-LAIR
	ICALL	RT-MOVE-ALL,TH-POCKET,RM-LAIR
	ICALL	RT-MOVE-ALL,TH-WATSONS-COAT,RM-LAIR
	ICALL	RT-MOVE-ALL,TH-EARS,RM-LAIR
	MOVE	TH-LAPEL,TH-WATSONS-COAT
	MOVE	TH-POCKET,TH-WATSONS-COAT
	MOVE	TH-WATSONS-COAT,CH-PLAYER
	ZERO?	HAT /?CCL69
	MOVE	TH-WATSONS-HAT,CH-PLAYER
	JUMP	?CND67
?CCL69:	FCLEAR	TH-WATSONS-HAT,FL-WORN
?CND67:	FCLEAR	TH-CAB-WHISTLE,FL-WORN
	FCLEAR	TH-STETHOSCOPE,FL-WORN
	MOVE	CH-AKBAR,RM-LAIR
	REMOVE	CH-WIGGINS
	PRINTI	"Akbar takes "
	ICALL1	RT-THEO-PRINT
	PRINTI	" and examines it closely. Then he "
	FSET?	TH-WATSONS-HAT,FL-WORN \?CCL72
	PRINTI	"says, ""I must ask you to come with me, sir. But first, I ask that you give me all that you carry."" He takes everything you give him, and then apologizes as he places a blindfold over your eyes. He"
	JUMP	?CND70
?CCL72:	PRINTI	"grabs you by the arm and drags you into a back room. He frisks you and takes away everything you are carrying. Then he blindfolds you and"
?CND70:	PRINTI	" leads you down a series of long winding corridors. You hear a door close behind you, and when he finally removes the blindfold, you are standing in Moriarty's lair. Akbar locks the door behind you, drops the key on Moriarty's desk, and piles most of what you were carrying onto the floor."
	CRLF	
	ICALL2	RT-UPDATE-SCORE,5
	CRLF	
	CALL2	RT-GOTO,RM-LAIR
	RSTACK	


	.FUNCT	RT-AC-CH-MORIARTY,CONTEXT,OBJ,WRD,ADJ,OFF
	ICALL2	RT-THIS-IS-IT,CH-MORIARTY
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	PRINTR	"The Professor has a high domed forehead that rises above heavily lidded, almost reptilian eyes."
?CCL3:	EQUAL?	CONTEXT,K-M-WINNER \?CCL5
	FSET?	GL-WINNER,FL-ASLEEP \?CCL5
	CALL2	RT-NO-CONDITION-MSG,GL-WINNER
	RSTACK	
?CCL5:	CALL2	RT-TELL-ABOUT?,CH-MORIARTY
	ZERO?	STACK /?CCL9
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL12
	SET	'OBJ,GL-PRSO
	JUMP	?CND10
?CCL12:	SET	'OBJ,GL-PRSI
?CND10:	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL15
	SET	'OFF,0
	JUMP	?CND13
?CCL15:	SET	'OFF,1
?CND13:	GET	GL-P-NAMW,OFF >WRD
	GET	GL-P-ADJW,OFF >ADJ
	FSET?	CH-MORIARTY,FL-ASLEEP \?CCL18
	CALL2	RT-NO-CONDITION-MSG,CH-MORIARTY
	RSTACK	
?CCL18:	FSET?	CH-MORIARTY,FL-LOCKED \?CCL20
	PRINTR	"The Professor's cold, reptilian eyes glare at you in silent hatred."
?CCL20:	EQUAL?	OBJ,CH-MORIARTY \?CCL22
	PRINTR	"""I am a mathematical machine, Doctor. I think. I plan. And as you and the 'great' Sherlock Holmes have now learned, all who oppose me suffer inexorable destruction."""
?CCL22:	EQUAL?	OBJ,CH-HOLMES,CH-BANK-GUARD /?CTR23
	CALL	RT-IDENTIFY-EVENT?,W?KIDNAPPING,OBJ
	ZERO?	STACK /?CCL24
?CTR23:	PRINTR	"""Holmes is a worthy adversary, Doctor. And his kidnapping was purely accidental. It was nothing more than a blunder on the part of an overeager subordinate. The guard at the bank knew nothing of my plan. He merely saw a chance to capture and deliver to me the famous Sherlock Holmes, and he took it."""
?CCL24:	EQUAL?	OBJ,CH-AKBAR \?CCL28
	PRINTR	"""A trusted associate who was sensible enough to see the advantages of joining forces with me."""
?CCL28:	EQUAL?	OBJ,TH-CROWN-JEWELS /?CTR29
	CALL	RT-IDENTIFY-EVENT?,W?THEFT,OBJ
	ZERO?	STACK /?CCL30
?CTR29:	EQUAL?	OBJ,TH-CROWN-JEWELS \?CCL35
	PRINTI	"""Pretty, are they not? I purloined them"
	JUMP	?CND33
?CCL35:	PRINTI	"I purloined the Crown Jewels"
?CND33:	PRINTR	" at the request of a foreign government whose identity need not concern you. My clients care nothing about the Crown Jewels themselves - they wish only to undermine confidence in the British monarchy as a first step towards weakening and ultimately destroying the British Empire."""
?CCL30:	EQUAL?	OBJ,TH-SAPPHIRE,TH-EMERALD,TH-RUBY /?CTR36
	EQUAL?	OBJ,TH-OPAL,TH-GARNET,TH-TOPAZ /?CTR36
	CALL	RT-IDENTIFY-EVENT?,W?AGRA,OBJ
	ZERO?	STACK /?CCL37
?CTR36:	PRINTR	"""Merely bait to be used in the hunting of a greater prey."""
?CCL37:	EQUAL?	OBJ,CH-QUEEN \?CCL42
	PRINTR	"""A foolish old woman. Her empire deserves to fail."""
?CCL42:	PRINTI	"""Your lives and the fate of your precious monarchy hang in the balance, Doctor. Have you nothing better to do than to query me about "
	ICALL2	RT-THEO-PRINT,OBJ
	PRINTR	"?"""
?CCL9:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL44
	RETURN	2
?CCL44:	EQUAL?	CONTEXT,K-M-WINNER \?CCL46
	FSET?	CH-MORIARTY,FL-ASLEEP \?CCL49
	CALL2	RT-NO-CONDITION-MSG,CH-MORIARTY
	RSTACK	
?CCL49:	EQUAL?	GL-PRSA,V?YES \?CCL51
	PRINT	K-GOOD-SHOW-MSG
	CRLF	
	RTRUE	
?CCL51:	EQUAL?	GL-PRSA,V?NO \?CCL53
	PRINT	K-PITY-MSG
	CRLF	
	RTRUE	
?CCL53:	EQUAL?	GL-PRSA,V?MAYBE \?CCL55
	PRINT	K-MAYBE-MSG
	CRLF	
	RTRUE	
?CCL55:	ICALL	RT-NOT-LIKELY-MSG,CH-MORIARTY,STR?719
	RTRUE	
?CCL46:	ZERO?	GL-NOW-PRSI? \FALSE
	ZERO?	GL-NOW-PRSI? /FALSE
	RFALSE	


	.FUNCT	RT-AC-CH-HUDSON,CONTEXT,OBJ
	ICALL2	RT-THIS-IS-IT,CH-HUDSON
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	FSET?	CH-HOLMES,FL-ASLEEP \?CCL6
	PRINTR	"Mrs Hudson appears agitated. She looks at you and says, ""Mr Holmes is upstairs, Doctor. Please see what you can do for him."""
?CCL6:	PRINTR	"Mrs Hudson appears happy that things are back to normal."
?CCL3:	CALL2	RT-TELL-ABOUT?,CH-HUDSON
	ZERO?	STACK /?CCL8
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL11
	SET	'OBJ,GL-PRSO
	JUMP	?CND9
?CCL11:	SET	'OBJ,GL-PRSI
?CND9:	FSET?	CH-HOLMES,FL-ASLEEP \?CCL14
	EQUAL?	OBJ,CH-HOLMES \?CCL17
	PRINTR	"""He doesn't eat. He doesn't drink. He doesn't read the newspaper. I'm very worried about him."""
?CCL17:	EQUAL?	OBJ,CH-PRIME-MINISTER \?CCL19
	PRINTR	"""He seems very worried. I gave him some tea."""
?CCL19:	ICALL2	RT-CTHEO-PRINT,CH-HUDSON
	PRINTR	" wrings her hands and looks at you anxiously. ""I'm too worried to think, Doctor. Won't you see what you can do for Mr Holmes?"""
?CCL14:	EQUAL?	OBJ,CH-HOLMES \?CCL22
	PRINTR	"""He seems much better now, Doctor. Thank you so much."""
?CCL22:	PRINTR	"""Shouldn't you be asking Mr Holmes?"""
?CCL8:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL24
	RETURN	2
?CCL24:	EQUAL?	CONTEXT,K-M-WINNER \FALSE
	EQUAL?	GL-PRSA,V?HELLO \?CCL29
	PRINTR	"""Hello, Dr Watson."""
?CCL29:	EQUAL?	GL-PRSA,V?GOODBYE \?CCL31
	PRINTR	"""Goodbye, Dr Watson."""
?CCL31:	EQUAL?	GL-PRSA,V?YES \?CCL33
	PRINT	K-GOOD-SHOW-MSG
	CRLF	
	RTRUE	
?CCL33:	EQUAL?	GL-PRSA,V?NO \?CCL35
	PRINT	K-PITY-MSG
	CRLF	
	RTRUE	
?CCL35:	EQUAL?	GL-PRSA,V?MAYBE \?CCL37
	PRINT	K-MAYBE-MSG
	CRLF	
	RTRUE	
?CCL37:	EQUAL?	GL-PRSA,V?THANK \?CCL39
	PRINTR	"""You're quite welcome, Dr Watson."""
?CCL39:	FSET?	CH-HOLMES,FL-ASLEEP \?CCL41
	PRINTR	"""I'm sorry Doctor, but I cannot do anything for you until you have attended to Mr Holmes."""
?CCL41:	PRINTR	"""I'm sorry. I must get back to my other duties."""


	.FUNCT	RT-AC-CH-DENKEEPER,CONTEXT,OBJ
	ICALL2	RT-THIS-IS-IT,CH-DENKEEPER
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	PRINTR	"He is a scrawny character with a weasel-like face and shifty eyes."
?CCL3:	CALL2	RT-TELL-ABOUT?,CH-DENKEEPER
	ZERO?	STACK /?CCL5
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL8
	SET	'OBJ,GL-PRSO
	RFALSE	
?CCL8:	SET	'OBJ,GL-PRSI
	RFALSE	
?CCL5:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL10
	RETURN	2
?CCL10:	EQUAL?	GL-PRSA,V?CALL \?PRD14
	EQUAL?	GL-PRSO,CH-AKBAR /?CTR11
?PRD14:	EQUAL?	GL-PRSA,V?ASK-FOR,V?ASK-ABOUT \?CCL12
	EQUAL?	GL-PRSI,CH-AKBAR \?CCL12
?CTR11:	FSET?	CH-AKBAR,FL-SEEN \?CTR20
	IN?	CH-AKBAR,RM-BAR-OF-GOLD /?CCL21
?CTR20:	ICALL2	RT-CTHEO-PRINT,CH-DENKEEPER
	PRINTI	" gives"
	ICALL1	RT-YOU-MSG
	PRINTR	"a sideways look and says, ""He might be here, and then again he might not. What's the password?"""
?CCL21:	ICALL2	RT-CTHEO-PRINT,CH-DENKEEPER
	PRINTR	" says, ""He's right there in front of you."""
?CCL12:	EQUAL?	GL-PRSA,V?GIVE \?CCL25
	FCLEAR	GL-PRSO,FL-WORN
	REMOVE	GL-PRSO
	PRINTI	"The denkeeper gives you a quick look of surprise, then he shrugs his shoulders and disappears briefly into a back room, returning moments later without "
	ICALL1	RT-THEO-PRINT
	PRINTR	"."
?CCL25:	EQUAL?	CONTEXT,K-M-WINNER \FALSE
	EQUAL?	GL-PRSA,V?SWORDFISH,V?PASSWORD /FALSE
	ICALL	RT-NOT-LIKELY-MSG,CH-DENKEEPER,STR?719
	RTRUE	


	.FUNCT	RT-AC-CH-LIBRARIAN,CONTEXT,OBJ
	ICALL2	RT-THIS-IS-IT,CH-LIBRARIAN
	CALL2	RT-TELL-ABOUT?,CH-LIBRARIAN
	ZERO?	STACK /?CCL3
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL6
	SET	'OBJ,GL-PRSO
	JUMP	?CND4
?CCL6:	SET	'OBJ,GL-PRSI
?CND4:	PRINTR	"""Let me finish telling you about this first."""
?CCL3:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL8
	RETURN	2
?CCL8:	EQUAL?	CONTEXT,K-M-WINNER \?CCL10
	EQUAL?	GL-PRSA,V?HUSH /?CCL10
	PRINTR	"""I will in a moment, but first let me finish telling you about this."""
?CCL10:	ZERO?	GL-NOW-PRSI? \FALSE
	ZERO?	GL-NOW-PRSI? /FALSE
	RFALSE	


	.FUNCT	RT-AC-CH-NANNIES,CONTEXT,OBJ
	ICALL2	RT-THIS-IS-IT,CH-NANNIES
	CALL2	RT-TELL-ABOUT?,CH-NANNIES
	ZERO?	STACK /?CCL3
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL6
	SET	'OBJ,GL-PRSO
	JUMP	?CND4
?CCL6:	SET	'OBJ,GL-PRSI
?CND4:	PRINT	K-TOO-HAUGHTY-MSG
	CRLF	
	RTRUE	
?CCL3:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL8
	RETURN	2
?CCL8:	EQUAL?	CONTEXT,K-M-WINNER \?CCL10
	PRINT	K-TOO-HAUGHTY-MSG
	CRLF	
	RTRUE	
?CCL10:	ZERO?	GL-NOW-PRSI? \FALSE
	ZERO?	GL-NOW-PRSI? /FALSE
	RFALSE	


	.FUNCT	RT-AC-CH-HOUSEWIVES,CONTEXT,OBJ
	ICALL2	RT-THIS-IS-IT,CH-HOUSEWIVES
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	IN?	CH-ELIZA-DOOLITTLE,RM-COVENT-GARDEN \?CCL6
	PRINTR	"The women have gathered in a circle around the girl. They keep looking at you as if they expect you to do something."
?CCL6:	PRINTR	"The housewives mill among the stalls, haggling with merchants over prices and looking for bargains."
?CCL3:	CALL2	RT-TELL-ABOUT?,CH-HOUSEWIVES
	ZERO?	STACK /?CCL8
	EQUAL?	GL-PRSA,V?WHO,V?WHAT \?CCL11
	SET	'OBJ,GL-PRSO
	JUMP	?CND9
?CCL11:	SET	'OBJ,GL-PRSI
?CND9:	PRINTR	"The women do not respond."
?CCL8:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL13
	RETURN	2
?CCL13:	EQUAL?	CONTEXT,K-M-WINNER \?CCL15
	IN?	CH-ELIZA-DOOLITTLE,RM-COVENT-GARDEN \?CCL18
	PRINTR	"The women are too upset about the girl to respond."
?CCL18:	PRINTR	"The housewives, intent on a bargain, ignore you."
?CCL15:	ZERO?	GL-NOW-PRSI? \FALSE
	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?LISTEN \FALSE
	ICALL1	RT-CTHEO-PRINT
	PRINTR	" are making a lot of noise."


	.FUNCT	RT-AC-CH-PALACE-GUARD,CONTEXT
	ICALL2	RT-THIS-IS-IT,CH-PALACE-GUARD
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	PRINTI	"Looks like any other "
	ICALL2	DPRINT,CH-PALACE-GUARD
	PRINTR	"."
?CCL3:	CALL2	RT-TELL-ABOUT?,CH-PALACE-GUARD
	ZERO?	STACK \?CTR4
	EQUAL?	CONTEXT,K-M-WINNER \?CCL5
?CTR4:	ICALL2	RT-CTHEO-PRINT,CH-PALACE-GUARD
	PRINTR	" stares straight ahead."
?CCL5:	CALL1	RT-WHO-WHAT-FAIL?
	ZERO?	STACK /?CCL9
	RETURN	2
?CCL9:	EQUAL?	GL-PRSA,V?GIVE,V?SHOW \?PRD12
	EQUAL?	GL-PRSO,TH-CROWN-JEWELS /?CCL10
?PRD12:	EQUAL?	CONTEXT,K-M-WINNER \FALSE
	EQUAL?	GL-PRSA,V?TAKE \FALSE
	EQUAL?	GL-PRSO,TH-CROWN-JEWELS \FALSE
?CCL10:	ICALL2	RT-CTHEO-PRINT,CH-PALACE-GUARD
	PRINTI	" examines the regalia closely and then disappears inside the palace. Moments later, he reappears with the Prime Minister, who quickly ushers you and Holmes into the presence of the Queen."
	CRLF	
	CRLF	
	PRINTI	"Overcome by emotion, for a few moments she says nothing. Finally she smiles and says, ""Once again, Mr Holmes, we find ourselves in your debt. Until now you have always refused our offers of gratitude. Do you intend to refuse your Queen yet again?"""
	CRLF	
	CRLF	
	PRINTI	"Holmes returns her smile. ""I do, Your Majesty. But only because your thanks would be misdirected. It is Doctor Watson here who deserves your gratitude."""
	CRLF	
	CRLF	
	PRINTI	"The Queen turns her gaze towards you. ""Indeed? And what reward would you ask of us, Doctor?"""
	CRLF	
	CRLF	
	PRINTI	"Flustered, you stammer something about the service itself being reward enough, and before you know it you have been royally thanked and ushered back out of the palace into Queens Gardens. There, you and Holmes join the cheering multitudes who greet the Queen when, promptly at 9:00 and wearing the full regalia, she steps onto the balcony to begin the Coronation Day festivities."
	CRLF	
	ICALL	SOUNDS,S-FANFARE,S-START,8,1,END-FANFARE
	ICALL2	RT-UPDATE-SCORE,1
	CRLF	
	PRINTI	"[Your score is "
	PRINTN	GL-SCORE-CUR
	PRINTI	" out of "
	PRINTN	GL-SCORE-MAX
	PRINTI	", which earns you a ranking of "
	CALL2	RT-RANK-STR,GL-SCORE-CUR
	PRINT	STACK
	PRINTI	".]"
	CRLF	
	CRLF	
	ICALL1	RT-UPDATE-STATUS-LINE
	ICALL1	RT-QSR
	RFALSE	


	.FUNCT	RT-AC-CH-URCHINS,CONTEXT
	ICALL2	RT-THIS-IS-IT,CH-URCHINS
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	CALL1	RT-TIME-OF-DAY
	ZERO?	STACK \?CCL6
	PRINTI	"Despite the hour, the"
	JUMP	?CND4
?CCL6:	PRINTI	"The"
?CND4:	PRINTI	" urchins are playing games in the street."
	CRLF	
	FSET?	CH-WIGGINS,FL-BROKEN \FALSE
	CRLF	
	PRINT	K-URCHIN-MSG
	CRLF	
	RTRUE	
?CCL3:	CALL2	RT-TELL-ABOUT?,CH-URCHINS
	ZERO?	STACK \?CTR10
	EQUAL?	CONTEXT,K-M-WINNER \?CCL11
?CTR10:	ICALL2	RT-CTHEO-PRINT,CH-URCHINS
	PRINTR	" ignore you."
?CCL11:	ZERO?	GL-NOW-PRSI? \FALSE
	ZERO?	GL-NOW-PRSI? /FALSE
	RFALSE	


	.FUNCT	RT-AC-CH-MEMBERS,CONTEXT
	ICALL2	RT-THIS-IS-IT,CH-MEMBERS
	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL3
	ICALL2	RT-CTHEO-PRINT,CH-MEMBERS
	PRINTR	" are all asleep."
?CCL3:	CALL2	RT-TELL-ABOUT?,CH-MEMBERS
	ZERO?	STACK \?CTR4
	EQUAL?	CONTEXT,K-M-WINNER \?CCL5
?CTR4:	ICALL2	RT-CTHEO-PRINT,CH-MEMBERS
	PRINTR	" are all asleep."
?CCL5:	ZERO?	GL-NOW-PRSI? \FALSE
	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?ALARM \?CCL14
	ICALL1	RT-CYOU-MSG
	PRINTR	"can't. No one can."
?CCL14:	EQUAL?	GL-PRSA,V?LISTEN \FALSE
	ICALL2	RT-CTHEO-PRINT,CH-MEMBERS
	PRINTR	" are all asleep."

	.ENDI
