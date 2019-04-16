

	.FUNCT	RT-AC-TH-BLUE-PILL-BOTTLE,CONTEXT
	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?READ,V?EXAMINE,V?LOOK-ON \?CCL6
	PRINTR	"The label on the bottle reads: ""Digitalis leaf. For tachycardia and other accelerated arrhythmias."""
?CCL6:	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	REMOVE	TH-BLUE-PILL-BOTTLE
	ICALL1	RT-CTHEO-PRINT
	PRINT	K-SHATTER-MSG
	CRLF	
	RTRUE	


	.FUNCT	RT-AC-TH-BROWN-PILL-BOTTLE,CONTEXT
	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?READ,V?EXAMINE,V?LOOK-ON \?CCL6
	PRINTR	"The label on the bottle reads: ""Belladonna. For bradycardia and other decelerated arrhythmias."""
?CCL6:	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	REMOVE	TH-BROWN-PILL-BOTTLE
	ICALL1	RT-CTHEO-PRINT
	PRINT	K-SHATTER-MSG
	CRLF	
	RTRUE	


	.FUNCT	RT-AC-TH-ORANGE-PILL,CONTEXT
	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?EAT \?CCL6
	EQUAL?	GL-WINNER,CH-PLAYER \?CCL6
	PRINTI	"You swallow the pill. For a few moments everything seems to move much slower."
	CRLF	
	REMOVE	GL-PRSO
	RTRUE	
?CCL6:	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	REMOVE	TH-ORANGE-PILL
	ICALL1	RT-CTHEO-PRINT
	PRINT	K-SHATTER-MSG
	CRLF	
	RTRUE	


	.FUNCT	RT-AC-TH-YELLOW-PILL,CONTEXT
	ZERO?	GL-NOW-PRSI? \FALSE
	EQUAL?	GL-PRSA,V?EAT \?CCL6
	EQUAL?	GL-WINNER,CH-PLAYER \?CCL6
	PRINTI	"You swallow the pill. For a few moments everything seems to move much faster."
	CRLF	
	REMOVE	GL-PRSO
	RTRUE	
?CCL6:	EQUAL?	GL-PRSA,V?SHOOT \FALSE
	REMOVE	TH-YELLOW-PILL
	ICALL1	RT-CTHEO-PRINT
	PRINT	K-SHATTER-MSG
	CRLF	
	RTRUE	


	.FUNCT	RT-AC-CH-ELIZA-DOOLITTLE,CONTEXT
	GETP	CH-ELIZA-DOOLITTLE,P?OBJ-NOUN
	EQUAL?	STACK,W?HEART,W?HEARTBEAT \?CCL3
	EQUAL?	CONTEXT,K-M-SDESC \?CCL6
	PRINTI	"girl's heart"
	RTRUE	
?CCL6:	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL8
	PRINTR	"You don't have X-ray vision."
?CCL8:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?LISTEN \?CCL12
	ICALL1	RT-LISTEN-ELIZA
	RTRUE	
?CCL12:	CALL1	RT-TOUCH-VERB?
	ZERO?	STACK /FALSE
	ICALL1	RT-IMPOSSIBLE-MSG
	RTRUE	
?CCL3:	EQUAL?	CONTEXT,K-M-SDESC \?CCL16
	PRINTI	"girl"
	RTRUE	
?CCL16:	EQUAL?	CONTEXT,K-M-DESCFCN \?CCL18
	ICALL2	RT-THIS-IS-IT,CH-ELIZA-DOOLITTLE
	PRINTR	"The flower girl is lying on the ground in a dead faint. She is very beautiful, but her clothes indicate that she must be poor."
?CCL18:	EQUAL?	CONTEXT,K-M-WINNER \?CCL20
	ICALL2	RT-CTHEO-PRINT,CH-ELIZA-DOOLITTLE
	PRINTR	" is unconscious. She cannot do anything."
?CCL20:	ZERO?	CONTEXT \FALSE
	EQUAL?	GL-PRSA,V?LISTEN \?PRD26
	ZERO?	GL-NOW-PRSI? /?CTR23
?PRD26:	EQUAL?	GL-PRSA,V?USE-ON,V?TOUCH-TO \?PRD29
	EQUAL?	GL-PRSO,TH-STETHOSCOPE \?PRD29
	ZERO?	GL-NOW-PRSI? \?CTR23
?PRD29:	EQUAL?	GL-PRSA,V?DIAGNOSE \?PRD33
	ZERO?	GL-NOW-PRSI? /?CTR23
?PRD33:	EQUAL?	GL-PRSA,V?LOOK-THRU \?CCL24
	EQUAL?	GL-P-PRSA-WORD,W?EXAMINE \?CCL24
	ZERO?	GL-NOW-PRSI? \?CCL24
	EQUAL?	GL-PRSI,TH-STETHOSCOPE \?CCL24
?CTR23:	CALL1	RT-LISTEN-ELIZA
	RSTACK	
?CCL24:	EQUAL?	GL-PRSA,V?GIVE,V?FEED \?CCL41
	CALL2	RT-CURE-ELIZA,GL-PRSO
	RSTACK	
?CCL41:	EQUAL?	GL-PRSA,V?TAKE,V?RAISE,V?MOVE \?CCL43
	EQUAL?	GL-PRSO,TH-ELIZAS-FLOWERS \?CCL46
	PRINT	K-OUTRAGED-CROWD-MSG
	CRLF	
	RTRUE	
?CCL46:	EQUAL?	GL-PRSO,CH-ELIZA-DOOLITTLE \FALSE
	PRINTR	"The girl is too sick to be moved."
?CCL43:	EQUAL?	GL-PRSA,V?RESCUE \?CCL50
	PRINTR	"A noble thought, worthy of someone who has taken the Hippocratic oath."
?CCL50:	EQUAL?	GL-PRSA,V?ALARM \?CCL52
	PRINTR	"Your medical expertise tells you she's not just asleep. It's more serious than that."
?CCL52:	EQUAL?	GL-PRSA,V?SEARCH \FALSE
	PRINT	K-OUTRAGED-CROWD-MSG
	CRLF	
	RTRUE	


	.FUNCT	RT-LISTEN-ELIZA,?TMP1
	FSET?	TH-COTTON-BALLS,FL-WORN \?CCL3
	ICALL1	RT-CYOU-MSG
	PRINTI	"cannot hear a thing with "
	ICALL2	RT-THEO-PRINT,TH-COTTON-BALLS
	PRINTI	" in "
	ICALL2	RT-THEO-PRINT,TH-EARS
	PRINTR	"."
?CCL3:	FSET?	TH-STETHOSCOPE,FL-WORN \?CCL5
	LOC	CH-PLAYER >?TMP1
	LOC	CH-ELIZA-DOOLITTLE
	EQUAL?	?TMP1,STACK /?CND6
	PRINTR	"You can't reach the girl from where you are."
?CND6:	ZERO?	CH-ELIZA-DOOLITTLE-AUX1 \?CND8
	RANDOM	100
	LESS?	50,STACK /?CCL12
	SET	'CH-ELIZA-DOOLITTLE-AUX1,1
	JUMP	?CND8
?CCL12:	SET	'CH-ELIZA-DOOLITTLE-AUX1,2
?CND8:	EQUAL?	CH-ELIZA-DOOLITTLE-AUX1,1 \?CCL15
	ICALL	SOUNDS,S-HEART3,S-START,6,10
	PRINTR	"Her heartbeat is incredibly fast."
?CCL15:	EQUAL?	CH-ELIZA-DOOLITTLE-AUX1,2 \FALSE
	ICALL	SOUNDS,S-HEART1,S-START,6,6
	PRINTR	"Her heartbeat is incredibly slow."
?CCL5:	EQUAL?	GL-PRSO,TH-STETHOSCOPE /?CTR18
	EQUAL?	GL-PRSI,TH-STETHOSCOPE \?CCL19
?CTR18:	ICALL	RT-CYOU-MSG,STR?228,STR?229
	PRINTI	"not wearing "
	ICALL2	RT-THEO-PRINT,TH-STETHOSCOPE
	PRINTR	"."
?CCL19:	PRINTR	"The city noises are too loud for you to make an accurate diagnosis."


	.FUNCT	RT-CURE-ELIZA,CURE
	EQUAL?	CURE,TH-ORANGE-PILL \?CCL3
	REMOVE	TH-ORANGE-PILL
	EQUAL?	CH-ELIZA-DOOLITTLE-AUX1,1 \?CCL6
	SET	'CH-ELIZA-DOOLITTLE-AUX1,3
	JUMP	?CND4
?CCL6:	SET	'CH-ELIZA-DOOLITTLE-AUX1,4
?CND4:	PRINTI	"You give her "
	ICALL2	RT-THEO-PRINT,CURE
	PRINTC	46
	CRLF	
	CRLF	
	JUMP	?CND1
?CCL3:	EQUAL?	CURE,TH-YELLOW-PILL \?CCL8
	REMOVE	TH-YELLOW-PILL
	EQUAL?	CH-ELIZA-DOOLITTLE-AUX1,2 \?CCL11
	SET	'CH-ELIZA-DOOLITTLE-AUX1,3
	JUMP	?CND9
?CCL11:	SET	'CH-ELIZA-DOOLITTLE-AUX1,4
?CND9:	PRINTI	"You give her "
	ICALL2	RT-THEO-PRINT,CURE
	PRINTC	46
	CRLF	
	CRLF	
?CND1:	EQUAL?	CH-ELIZA-DOOLITTLE-AUX1,3 \?CCL14
	MOVE	TH-CARNATION,TH-LAPEL
	REMOVE	CH-ELIZA-DOOLITTLE
	FCLEAR	CH-ELIZA-DOOLITTLE,FL-ASLEEP
	PRINTI	"Nothing happens for a moment, but then her eyelids flutter briefly and she opens her eyes."
	CRLF	
	CRLF	
	PRINTI	"The crowd breaks into applause, and they help her to her feet. When she is standing, she smiles at you shyly and puts a lovely carnation in your lapel as a gesture of thanks."
	CRLF	
	CRLF	
	PRINTI	"Just then, a distinguished-looking gentleman appears on the scene, takes her by the arm, and says, ""Come, Eliza. We mustn't be late for the ball."""
	CRLF	
	CRLF	
	PRINTI	"He escorts her away, but as she leaves, she glances back at you once more with a grateful expression in her lovely eyes."
	CRLF	
	GETP	TH-CARNATION,P?VALUE
	ICALL2	RT-UPDATE-SCORE,STACK
	PUTP	TH-CARNATION,P?VALUE,0
	RTRUE	
?CCL8:	PRINTR	"That would not do her much good."
?CCL14:	EQUAL?	CH-ELIZA-DOOLITTLE-AUX1,4 \FALSE
	FCLEAR	CH-ELIZA-DOOLITTLE,FL-ALIVE
	PRINTI	"Nothing happens for a moment, but then suddenly her body goes limp. It must have been the wrong pill."
	CRLF	
	CRLF	
	PRINTI	"By this time, the large crowd has gathered the attention of the police. Inspector Lestrade pushes his way through the crowd, sees the dead girl, and says, ""I'm sorry, Doctor Watson. I know you must have tried to save her. I'm afraid you'll have to come along with me to fill out the death certificate."""
	CRLF	
	CRLF	
	PRINTI	"Unfortunately, by the time you finish filling out the forms associated with the girl's death, the news of theft of the Crown Jewels leaks to the press, and all is lost."
	CRLF	
	CRLF	
	CALL1	RT-QSR
	RSTACK	

	.ENDI
