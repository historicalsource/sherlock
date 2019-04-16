;*****************************************************************************
; "game : SHERLOCK!"
; "file : MACROS.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   24 Sep 1987 21:15:56  $"
; "rev  : $Revision:   1.4  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "default property values"
;-----------------------------------------------------------------------------

<PROPDEF VALUE			0>
<PROPDEF SIZE			0>
<PROPDEF STRENGTH		10>
<PROPDEF DEXTERITY	10>

;*****************************************************************************
; "tell-tokens"
;*****************************************************************************

<TELL-TOKENS
	CR			<CRLF>
	N		*	<PRINTN .X>
	C		*	<PRINTC .X>
	D		*	<DPRINT .X>
	A		*	<RT-A-PRINT .X>
	CA		*	<RT-THEO-PRINT .X T ,K-DESC-A>
	AO			<RT-A-PRINT>
	ANY		*	<RT-THEO-PRINT .X <> ,K-DESC-ANY>
	THE	*	<RT-THEO-PRINT .X>
	THEO		<RT-THEO-PRINT>
	THEI		<RT-THEI-PRINT>
	CTHE	*	<RT-CTHEO-PRINT .X>
	CTHEO		<RT-CTHEO-PRINT>
	CTHEI		<RT-CTHEI-PRINT>
	VW			<RT-VW-PRINT>
	INDENT	<RT-INDENT-PRINT>
	WRAP		<RT-WRAP-PRINT>
>

<DEFINE MULTIFROB (X ATMS "AUX" (OO (OR)) (O .OO) (LL (T)) (L .LL) ATM)
	<REPEAT ()
		<COND
			(<EMPTY? .ATMS>
				<RETURN!-
					<COND
						(<LENGTH? .OO 1>
							<ERROR .X>
						)
						(<LENGTH? .OO 2>
							<NTH .OO 2>
						)
						(ELSE
							<CHTYPE .OO FORM>
						)
					>
				>
			)
		>
		<REPEAT ()
			<COND
				(<EMPTY? .ATMS>
					<RETURN!->
				)
			>
			<SET ATM <NTH .ATMS 1>>
			<SET L <REST <PUTREST .L
				(<COND
					(<TYPE? .ATM ATOM>
						<CHTYPE
							<COND
								(<==? .X GL-PRSA>
									<PARSE <STRING "V?" <SPNAME .ATM>>>
								)
								(<==? .X GL-P-PRSA-WORD>
									<PARSE <STRING "W?" <SPNAME .ATM>>>
								)
								(T
									.ATM
								)
							>
							GVAL
						>
					)
					(ELSE
						.ATM
					)
				>)
			>>>
			<SET ATMS <REST .ATMS>>
			<COND
				(<==? <LENGTH .LL> 4>
					<RETURN!->
				)
			>
		>
		<SET O <REST <PUTREST .O
			(<FORM EQUAL? <CHTYPE .X GVAL> !<REST .LL>>)
		>>>
		<SET LL (T)>
		<SET L .LL>
	>
>

;*****************************************************************************
; "macro definitions"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "MC-VERB?"
;-----------------------------------------------------------------------------

<DEFMAC MC-VERB? ("ARGS" ATMS)
	<MULTIFROB GL-PRSA .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-VERB-WORD?"
;-----------------------------------------------------------------------------

<DEFMAC MC-VERB-WORD? ("ARGS" ATMS)
	<MULTIFROB GL-P-PRSA-WORD .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-PRSO?"
;-----------------------------------------------------------------------------

<DEFMAC MC-PRSO? ("ARGS" ATMS)
	<MULTIFROB GL-PRSO .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-PRSI?"
;-----------------------------------------------------------------------------

<DEFMAC MC-PRSI? ("ARGS" ATMS)
	<MULTIFROB GL-PRSI .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-THIS-PRSO?"
;-----------------------------------------------------------------------------

<DEFMAC MC-THIS-PRSO? ()
	<FORM ZERO? <CHTYPE GL-NOW-PRSI? GVAL>>
>

;-----------------------------------------------------------------------------
; "MC-THIS-PRSI?"
;-----------------------------------------------------------------------------

<DEFMAC MC-THIS-PRSI? ()
	<FORM NOT <FORM ZERO? <CHTYPE GL-NOW-PRSI? GVAL>>>
>

;-----------------------------------------------------------------------------
; "MC-HERE?"
;-----------------------------------------------------------------------------

<DEFMAC MC-HERE? ("ARGS" ATMS)
	<MULTIFROB GL-PLACE-CUR .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-LISTEN?"
;-----------------------------------------------------------------------------

<DEFMAC MC-LISTEN? ("ARGS" ATMS)
	<MULTIFROB GL-LISTEN-OBJ .ATMS>
>

;-----------------------------------------------------------------------------
; "MC-PROB"
;-----------------------------------------------------------------------------

<DEFMAC MC-PROB ('BASE?)
	<FORM NOT <FORM L? .BASE? '<RANDOM 100>>>
>

;-----------------------------------------------------------------------------
; "MC-GET/B"
;-----------------------------------------------------------------------------

<DEFMAC MC-GET/B ('TBL 'PTR)
	<FORM GET .TBL .PTR>
>

;-----------------------------------------------------------------------------
; "MC-ABS"
;-----------------------------------------------------------------------------

<DEFMAC MC-ABS ('NUM)
	<FORM COND
      (<FORM L? .NUM 0>
   	  	<FORM - 0 .NUM>
  		)
  		(T
  			.NUM
  		)
	>
>

;-----------------------------------------------------------------------------
; "MC-SPACE"
;-----------------------------------------------------------------------------

<DEFMAC MC-SPACE ()
	<FORM PRINTC 32>
>

;-----------------------------------------------------------------------------
; "MC-QUOTE?"
;-----------------------------------------------------------------------------

<DEFMAC MC-QUOTE? ()
	<FORM
		COND
			(<FORM NOT <FORM EQUAL?
					<CHTYPE GL-WINNER GVAL>
					<CHTYPE CH-PLAYER GVAL>>
					>
					    <FORM PRINTC 34>
			)
	>
> 

;-----------------------------------------------------------------------------
; "MC-MAKE"
;-----------------------------------------------------------------------------

<DEFMAC MC-MAKE ('OBJ 'FLAG)
	<FORM FSET .OBJ .FLAG>
>

;-----------------------------------------------------------------------------
; "MC-UNMAKE"
;-----------------------------------------------------------------------------

<DEFMAC MC-UNMAKE ('OBJ 'FLAG)
	<FORM FCLEAR .OBJ .FLAG>
>

;-----------------------------------------------------------------------------
; "MC-IS?"
;-----------------------------------------------------------------------------

<DEFMAC MC-IS? ('OBJ 'FLAG)
	<FORM FSET? .OBJ .FLAG>
>

;-----------------------------------------------------------------------------
; "MC-ISNOT?"
;-----------------------------------------------------------------------------

<DEFMAC MC-ISNOT? ('OBJ 'FLAG)
	<FORM NOT <FORM FSET? .OBJ .FLAG>>
>

;-----------------------------------------------------------------------------
; "MC-NOTZERO?"
;-----------------------------------------------------------------------------

<DEFMAC MC-NOTZERO? ('TERM)
	<FORM NOT <FORM ZERO? .TERM>>
>

;-----------------------------------------------------------------------------
; "MC-T?"
;-----------------------------------------------------------------------------

<DEFMAC MC-T? ('TERM)
	<FORM NOT <FORM ZERO? .TERM>>
>

;-----------------------------------------------------------------------------
; "MC-THIS-WINNER?"
;-----------------------------------------------------------------------------

<DEFMAC MC-THIS-WINNER? ()
	<FORM EQUAL? '.CONTEXT ',K-M-WINNER>
>

;-----------------------------------------------------------------------------
; "MC-F?"
;-----------------------------------------------------------------------------

<DEFMAC MC-F? ('TERM)
	<FORM ZERO? .TERM>
>

;-----------------------------------------------------------------------------
; "MC-GET-RM-EXIT-DEST"
;-----------------------------------------------------------------------------

<DEFMAC MC-GET-RM-EXIT-DEST ('PT)
	<FORM GETB .PT ',K-REXIT>
>

;-----------------------------------------------------------------------------
; "MC-GET-RM-EXIT-DOOR"
;-----------------------------------------------------------------------------

<DEFMAC MC-GET-RM-EXIT-DOOR ('PT)
	<FORM GET <FORM REST .PT> '<- ,K-DEXITOBJ 1>>>

<DEFMAC DEBUGGING? ('X "OPT" 'Y)
  <COND (,GL-DEBUG?
	 <COND (<TYPE? .X LIST>
		<CHTYPE .X SPLICE>)
	       (T .X)>)
	(T
	 <COND (<ASSIGNED? Y>
		<COND (<TYPE? .Y LIST>
		       <CHTYPE .Y SPLICE>)
		      (T .Y)>)
	       (T #SPLICE ())>)>>

<DEFMAC STRLENGTH (X)
  <LENGTH .X>>

<DEFMAC RT-VW-PRINT ()
	<FORM PRINTB ',GL-P-PRSA-WORD>>

<DEFMAC RT-CLOCK-INC-SET ("ARGS" STUFF)
  <FORM RT-DO-CLOCK-SET ',GL-TIME-UPDT-INC !.STUFF>>

<DEFMAC RT-CLOCK-DEF-SET ("ARGS" STUFF)
  <FORM RT-DO-CLOCK-SET ',GL-TIME-UPDT-DEF !.STUFF>>

<DEFMAC RT-CLOCK-SET ("ARGS" STUFF)
  <FORM RT-DO-CLOCK-SET ',GL-TIME !.STUFF>>

<DEFMAC RT-PARM-SET ("ARGS" STUFF)
  <FORM RT-DO-CLOCK-SET ',GL-TIME-PARM !.STUFF>>

; "Generate an appropriate BTST to test the part of speech in cases where
   we can get away with it.  Otherwise, call RT-WT?.
   EXTRA-BIT is used to test two parts of speech at the same time.  Note
   that all arguments after the first are evaluated at compile time, so had
   better be PS? or P1? type constants."
<DEFMAC WT? ('PTR BIT "OPT" (B1:<OR FIX FALSE> 5) EXTRA-BIT)
  <COND (<OR <NOT .B1>
	     <G? .B1 4>>
	 <COND (<ASSIGNED? EXTRA-BIT>
		; "Handle an OR test of two parts of speech"
		<FORM NOT <FORM 0? <FORM ANDB <FORM GETB .PTR ,K-P-PSOFF>
					 <+ .BIT .EXTRA-BIT>>>>)
	       (T
		<FORM BTST <FORM GETB .PTR ,K-P-PSOFF> .BIT>)>)
	(<ASSIGNED? EXTRA-BIT>
	 <ERROR CANT-TEST-FOR-TWO-PARTS-OF-SPEECH-WITH-VALUE!-ERRORS
		.BIT .EXTRA-BIT WT?>)
	(T
	 <FORM RT-WT? .PTR .BIT .B1>)>>

;"Structures created by eliminating the AUXn properties."

<GLOBAL TH-ROPE-AUX1 -1>	; "First person tied up"
<GLOBAL TH-ROPE-AUX2 -1>	; "Second person tied up"

<GLOBAL CH-BANK-GUARD-AUX1 0 <> BYTE>	; "Number of gems used to bribe him"

<GLOBAL CH-HOLMES-AUX1 0 <> BYTE>	; "Seems to be flags for holmes"

<GLOBAL CH-TRAINED-PIGEON-AUX1 0 <> BYTE>	; "Flags"
<GLOBAL CH-TRAINED-PIGEON-AUX2 0 <> BYTE>
<GLOBAL CH-TRAINED-PIGEON-AUX3 0>	; "An object"

<GLOBAL RM-HOLMES-STUDY-AUX1 0 <> BYTE>	; "Minutes out of study after
					   waking holmes"

<GLOBAL TH-BELL-AUX1 0 <> BYTE>		; "Number of times to ring Ben"
<GLOBAL TH-BELL-AUX2 0 <> BYTE>		; "Bell position?"

<GLOBAL TH-PACKET-OF-PAPER-AUX1 0 <> BYTE>

<GLOBAL TH-BOX-KEY-AUX1 0>		; "Box the key is in (number)"

<GLOBAL TH-SAFETY-DEPOSIT-BOX-AUX1 0>	; "Box number"

<GLOBAL TH-BOX-LOCK-AUX1 0>

<GLOBAL TH-DIAL-AUX1 0>			;"Direction being turned, or some such"
<GLOBAL TH-DIAL-AUX2 0>

<GLOBAL CH-WIGGINS-AUX1 0 <> BYTE>		; "True if `activated'"

<GLOBAL CH-ELIZA-DOOLITTLE-AUX1 0 <> BYTE>

<GLOBAL CH-VENDOR-AUX1 0 <> BYTE>		; "Number of haggles"

<GLOBAL TH-CAB-WHISTLE-AUX1 0 <> BYTE>	; "Number of whistles"
<GLOBAL TH-CAB-WHISTLE-AUX2 0 <> BYTE>	; "Where"

<GLOBAL TH-HANSOM-CAB-AUX1 0 <> BYTE>		; "Called before?"
<GLOBAL TH-HANSOM-CAB-AUX2 0 <> BYTE>		; "Waiting?"

<GLOBAL TH-GROWLER-CAB-AUX1 0 <> BYTE>

<GLOBAL TH-GUN-AUX1 6 <> BYTE>		; "Bullets left"

<GLOBAL TH-PHIAL-AUX1 0 <> BYTE>

<GLOBAL TH-BOAT-AUX1 0 <> BYTE>

<GLOBAL TH-SAPPHIRE-AUX1 2>		; "Number of grabs left"ct