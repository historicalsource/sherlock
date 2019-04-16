;*****************************************************************************
; "game : SHERLOCK!"
; "file : CHARLES.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   28 Oct 1987 19:34:20  $"
; "rev  : $Revision:   1.76  $"
; "vers : 1.00"
;*****************************************************************************

;-----------------------------------------------------------------------------
; "TH-WAX-HEAD commented out of THINGS1.ZIL"
; "TH-WAX-AX commented out of THINGS1.ZIL"
; "TH-EMERALD commented out of THINGS1.ZIL"
; "TH-TORCH commented out of THINGS1.ZIL"
; "TH-TOBACCO commented out of THINGS1.ZIL"
;-----------------------------------------------------------------------------
; "RT-AC-TH-MATCH commented out of THINGS2.ZIL"
; "RT-AC-TH-TORCH commented out of THINGS2.ZIL"
; "RT-AC-TH-TOBACCO commented out of THINGS2.ZIL"
; "RT-AC-TH-PIPE commented out of THINGS2.ZIL"
; "RT-AC-TH-MAIL commented out of THINGS2.ZIL"
; "RT-AC-TH-NEWSPAPER commented out of THINGS2.ZIL"
; "RT-AC-TH-WESTMINSTER-CLUE commented out of THINGS2.ZIL"
;-----------------------------------------------------------------------------
; "RT-DF-TH-MAIL commented out of THINGS3.ZIL"
; "RT-DF-TH-NEWSPAPER commented out of THINGS3.ZIL"
; "RT-DF-TH-WESTMINSTER-CLUE commented out of THINGS3.ZIL"
; "RT-DF-TH-TOBACCO commented out of THINGS3.ZIL"
; "RT-DF-TH-PIPE commented out of THINGS3.ZIL"
; "RT-DF-TH-MATCH commented out of THINGS3.ZIL"
; "RT-DF-TH-TORCH commented out of THINGS3.ZIL"
;-----------------------------------------------------------------------------

<OBJECT TH-WAX-HEAD
   (LOC TH-CHARLES-STATUE)
   (FLAGS FL-TAKEABLE FL-TRYTAKE FL-NODESC FL-NOALL FL-HAS-SDESC
	  FL-HAS-DESCFCN)
   (SYNONYM HEAD WAX)
   (ADJECTIVE HEAD WAX)
   (SIZE 1 CAPACITY 1 MASS 0)
   (GENERIC RT-GN-WAX)
   (ACTION RT-AC-TH-WAX-HEAD)>

<VOC "POOL" NOUN>
<VOC "POOL" ADJ>

<OBJECT TH-WAX-AX
   (LOC TH-CHARLES-STATUE)
   ;(DESC "axe")
   (FLAGS FL-TAKEABLE FL-VOWEL FL-NODESC FL-NOALL FL-WEAPON
	  FL-HAS-DESCFCN FL-HAS-SDESC)
   (SYNONYM BLADE AX AXE WAX)
   (ADJECTIVE WAX WAX)
   (SIZE 12 CAPACITY 0 MASS 0)
   (GENERIC RT-GN-WAX)
   (ACTION DESC-WAX-AX)>

<VOC "MELTED" ADJ>

<OBJECT TH-EMERALD
   (FLAGS FL-READABLE FL-TAKEABLE FL-VOWEL FL-SURFACE FL-MONEY
	  FL-HAS-DESCFCN FL-HAS-SDESC FL-NEEDS-IDENTITY FL-LOSE-IDENTITY)
   (OBJ-ADJ 0)
   (OBJ-NOUN 0)
   (SYNONYM EMERALD GEM GEMS SCRATCH)
   (ADJECTIVE GREEN EMERALD EMERALD\'S)
   (VALUE 5)
   (SIZE 1 MASS 1 CAPACITY 1)
   (GENERIC RT-GN-GEM)
   (ACTION RT-AC-TH-EMERALD)>

<OBJECT TH-TORCH
   (LOC TH-FAWKES-STATUE)
   ;(DESC "torch")
   (FLAGS FL-BURNABLE FL-TAKEABLE FL-NODESC FL-NOALL FL-HAS-SDESC
	  FL-HAS-DESCFCN)
   (SYNONYM TORCH)
   (ADJECTIVE ZZZP)
   (SIZE 1)
   (ACTION RT-AC-TH-TORCH)>

<VOC "BURNT" ADJ>

<OBJECT TH-TOBACCO
   (LOC TH-PERSIAN-SLIPPER)
   (DESC "tobacco")
   (FLAGS FL-TAKEABLE FL-BURNABLE FL-PLURAL FL-COLLECTIVE FL-NOALL
	  FL-HAS-DESCFCN)
   (SYNONYM TOBACCO SHAG)
   (ADJECTIVE SHAG)
   (VALUE 1)
   (SIZE 1)
   (ACTION RT-AC-TH-TOBACCO)>

<ROUTINE BURN-OUT-MATCH ()
  <FCLEAR ,TH-MATCH ,FL-BURNABLE>
  <CLEAR-ALL-FLAGS ,TH-MATCH>
  <FSET ,TH-MATCH ,FL-TAKEABLE>
  <FSET ,TH-MATCH ,FL-BROKEN>>

<ROUTINE RT-AC-TH-MATCH ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-MATCH">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <COND (<FSET? ,TH-MATCH ,FL-BROKEN>
		      <TELL "burnt match">)
		     (T
		      <TELL "match">)>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<FSET? ,TH-MATCH ,FL-BROKEN>
		      <RFALSE>)
		     (<MC-IS? ,TH-MATCH ,FL-LIGHTED>
		      <TELL CTHE ,TH-MATCH " is burning." CR>)
		     (T <RFALSE>)>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<FSET? ,TH-MATCH ,FL-BROKEN>
	       <COND (<MC-VERB? LAMP-OFF LIGHT STRIKE BURN-WITH LIGHT-WITH>
		      <TELL "The match is already burned out." CR>)>)
	      (<AND <MC-VERB? LIGHT-WITH BURN-WITH STRIKE LIGHT>
		    <MC-PRSO? ,TH-MATCH>>
	       <COND (<MC-IS? ,TH-MATCH ,FL-LIGHTED>
		      <TELL CTHEO " is already lit." CR>)
		     (<MC-ISNOT? ,TH-MATCH ,FL-BURNABLE>
		      <TELL CTHEO " is burned out." CR>)
		     (<OR <MC-PRSI? ,TH-HANDS <>>
			  <AND <MC-IS? ,GL-PRSI ,FL-LIGHTED>
			       <MC-IS? ,GL-PRSI ,FL-BURNABLE>>>
		      <MC-MAKE ,TH-MATCH ,FL-LIGHTED>
		      <RT-ALARM-SET-REL ,RT-I-MATCH-OUT
					<RT-PARM-SET 0 2 0>>
		      <MOVE ,TH-MATCH ,GL-WINNER>
		      <TELL CTHEO " flares to life." CR>)>)
	      (<MC-VERB? LAMP-OFF>
	       <COND (<MC-ISNOT? ,TH-MATCH ,FL-LIGHTED>
		      <TELL CTHEO " isn't lit." CR>)
		     (T
		      <MC-UNMAKE ,TH-MATCH ,FL-LIGHTED>
		      ;<MC-UNMAKE ,TH-MATCH ,FL-BURNABLE>
		      <BURN-OUT-MATCH>
		      ;<MOVE ,TH-BURNT-MATCH <LOC ,TH-MATCH>>
		      ;<REMOVE ,TH-MATCH>
		      <RT-ALARM-CLR ,RT-I-MATCH-OUT>
		      <RT-CYOU-MSG "blow" "blows">
		      <TELL "out the match." CR>)>)>>

<ROUTINE CLEAR-ALL-FLAGS (OBJ)
  <REPEAT ((N 1))
    <COND (<NOT <EQUAL? .N ,FL-HAS-SDESC ,FL-HAS-DESCFCN ,FL-NEEDS-IDENTITY
			,FL-LOSE-IDENTITY>>
	   <FCLEAR .OBJ .N>)>
    <COND (<G? <SET N <+ .N 1>> 48> <RETURN>)>>>

<ROUTINE RT-AC-TH-TORCH ("OPTIONAL" (CONTEXT <>) "AUX" WHO)
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-TORCH">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <COND (<FSET? ,TH-TORCH ,FL-BROKEN>
		      <TELL "burnt torch">)
		     (T
		      <TELL "torch">)>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<FSET? ,TH-TORCH ,FL-BROKEN>
		      <RFALSE>)
		     (<MC-IS? ,TH-TORCH ,FL-LIGHTED>
		      <TELL CTHE ,TH-TORCH " is burning." CR>
		      <RTRUE>)>
	       <RFALSE>)
	      (<FSET? ,TH-TORCH ,FL-BROKEN>
	       <RFALSE>
	       ;<RT-AC-TH-BURNT-TORCH .CONTEXT>)
	      (<AND <MC-VERB? MELT HEAT LIGHT-WITH BURN-WITH>
		    <MC-PRSI? ,TH-TORCH>>
	       <COND (<MC-ISNOT? ,TH-TORCH ,FL-LIGHTED>
		      <TELL CTHE ,TH-TORCH " is not lit." CR>)
		     (<MC-PRSO? ,TH-TORCH>
		      <TELL CTHEO " is already lit." CR>)
		     (<MC-PRSO? ,TH-WAX-HEAD>
		      ;<REMOVE ,TH-WAX-HEAD>
		      ;<MOVE ,TH-WAX-POOL ,GL-PLACE-CUR>
		      <TELL
CTHEO " melts into a pool of wax on the floor. You see
a gem glittering in the wax." CR>
		      <MOVE ,TH-WAX-HEAD ,GL-PLACE-CUR>
		      <MOVE ,TH-EMERALD ,TH-WAX-HEAD>
		      <CLEAR-ALL-FLAGS ,TH-WAX-HEAD>
		      <FSET ,TH-WAX-HEAD ,FL-OPENED>
		      <FSET ,TH-WAX-HEAD ,FL-TRANSPARENT>
		      <FSET ,TH-WAX-HEAD ,FL-CONTAINER>
		      <FSET ,TH-WAX-HEAD ,FL-BROKEN>
		      <SET-MASS-TO-ONE ,TH-WAX-HEAD>
		      <PUT <GETPT ,TH-WAX-HEAD ,P?SYNONYM> 0 ,W?POOL>
		      <PUT <GETPT ,TH-WAX-HEAD ,P?ADJECTIVE> 0 ,W?POOL>
		      <RT-THIS-IS-IT ,TH-EMERALD>)
		     (<MC-PRSO? ,TH-WAX-AX>
		      ;<REMOVE ,TH-WAX-AX>
		      ;<MOVE ,TH-MELTED-AX ,GL-PLACE-CUR>
		      <TELL CTHEO " melts into a pool of wax on the floor." CR>
		      <MOVE ,TH-WAX-AX ,GL-PLACE-CUR>
		      <CLEAR-ALL-FLAGS ,TH-WAX-AX>
		      <FSET ,TH-WAX-AX ,FL-OPENED>
		      <FSET ,TH-WAX-AX ,FL-TRANSPARENT>
		      <FSET ,TH-WAX-AX ,FL-CONTAINER>
		      <FSET ,TH-WAX-AX ,FL-BROKEN>
		      <SET-SIZE-TO-ONE ,TH-WAX-AX>
		      <SET-CAPACITY-TO-ONE ,TH-WAX-AX>
		      <SET-MASS-TO-ONE ,TH-WAX-AX>
		      <PUT <GETPT ,TH-WAX-AX ,P?SYNONYM> 0 ,W?AX>
		      <PUT <GETPT ,TH-WAX-AX ,P?ADJECTIVE> 0 ,W?MELTED>)
		     (<MC-ISNOT? ,GL-PRSO ,FL-BURNABLE>
		      <RT-CYOU-MSG>
		      <TELL "cannot " VW " " THEO " with " THEI "." CR>)>)
	      (<AND <MC-VERB? LIGHT-WITH BURN-WITH>
		    <MC-PRSO? ,TH-TORCH>>
	       <COND (<AND <MC-PRSI? ,TH-TOBACCO ,TH-PIPE>
			   <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>
		      <TELL CTHEI>
		      <RT-DONT-DOESNT-MSG ,GL-PRSI>
		      <TELL "put out enough heat to light " THEO "." CR>)
		     (<MC-ISNOT? ,GL-PRSI ,FL-BURNABLE>
		      <RT-CYOU-MSG>
		      <TELL "cannot light " THEO " with " THEI "." CR>)
		     (<MC-ISNOT? ,GL-PRSI ,FL-LIGHTED>
		      <TELL CTHEI>
		      <RT-ISNT-ARENT-MSG ,GL-PRSI>
		      <TELL "burning." CR>)
		     (T
		      <TELL CTHEO " catches fire quickly." CR>
		      <MC-MAKE ,TH-TORCH ,FL-LIGHTED>
		      <RT-ALARM-SET-REL ,RT-I-TORCH-OUT <RT-PARM-SET 1 0 0>>
		      <SET WHO <RT-WHO-SAYS?>>
		      <COND (<EQUAL? .WHO ,CH-HOLMES>
			     <TELL CR
"Holmes looks at you and says, \"An ingenious solution, Watson. My
compliments, old chap.\"" CR>)>
		      <RT-UPDATE-SCORE 4>)>)>>

<ROUTINE RT-LIGHT-PIPE (FIRE)
	<COND (<MC-ISNOT? .FIRE ,FL-BURNABLE>
	       <RT-CYOU-MSG>
	       <TELL "cannot light " THEO " with " THEI "." CR>)
	      (<MC-ISNOT? .FIRE ,FL-LIGHTED>
	       <TELL CTHE .FIRE " is not burning." CR>)
	      (<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
	       <TELL CTHEO " is already lit." CR>)
	      (<IN? ,TH-TOBACCO ,TH-PIPE>
	       <MC-MAKE ,TH-TOBACCO ,FL-LIGHTED>
	       <RT-ALARM-SET-REL ,RT-I-PIPE-OUT <RT-PARM-SET 0 15 0>>
	       <TELL "After a few puffs, " THEO " fires right up." CR>)>>

<ROUTINE RT-AC-TH-TOBACCO ("OPTIONAL" (CONTEXT <>) "AUX" I)
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-TOBACCO">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
		      <TELL CTHE ,TH-TOBACCO " is burning." CR>)
		     (T
		      <TELL "It's Holmes's favorite brand of shag tobacco." CR>)>
	       <RTRUE>)
	      (<MC-THIS-PRSO?>
	       <SETG GL-P-IT-OBJECT ,TH-TOBACCO>)>
	<COND (<AND <MC-VERB? LIGHT-WITH BURN-WITH>
		    <MC-PRSO? ,TH-TOBACCO>>
	       <COND (<MC-PRSI? <> ,TH-HANDS>
		      <SET I ,TH-MATCH>)
		     (T
		      <SET I ,GL-PRSI>)>
	       <COND (<NOT <IN? .I ,GL-WINNER>>
		      <RT-CYOU-MSG "are" "is">
		      <TELL "not holding " A .I "." CR>)
		     (<NOT <IN? ,TH-PIPE ,GL-WINNER>>
		      <RT-CYOU-MSG "are" "is">
		      <TELL "not holding " THE ,TH-PIPE "." CR>)
		     (<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
		      <TELL CTHEO " is already lit." CR>)
		     (<RT-LIGHT-PIPE .I>
		      <RTRUE>)
		     (T
		      <TELL CTHEO " " ,K-SMOULDERS-MSG CR>)>)
	      (<AND <MC-VERB? TAKE TOUCH>
		    <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>
	       <TELL "Yeeeeouch! That's hot!" CR>)
	      ;(<AND <MC-VERB? LIGHT-WITH BURN-WITH>
		     <MC-PRSI? ,TH-TOBACCO>
		     <MC-IS? ,GL-PRSO ,FL-BURNABLE>>
		<COND (<MC-PRSO? ,TH-TORCH>
		       <RFALSE>)
		      (<MC-ISNOT? ,TH-TOBACCO ,FL-LIGHTED>
		       <TELL CTHEI " is not lit." CR>)
		      (<MC-IS? ,GL-PRSO ,FL-LIGHTED>
		       <TELL CTHEO " is already burning." CR>)
		      (<MC-PRSO? ,TH-NEWSPAPER ,TH-WESTMINSTER-CLUE ,TH-MAIL>
		       <TELL CTHEO " lights right up." CR>
		       <MC-MAKE ,GL-PRSO ,FL-LIGHTED> 
		       <COND (<MC-PRSO? ,TH-NEWSPAPER>
			      <RT-ALARM-SET-REL ,RT-I-NEWSPAPER-OUT <RT-PARM-SET 0 3 0>>)
			     (<MC-PRSO? ,TH-WESTMINSTER-CLUE>
			      <RT-ALARM-SET-REL ,RT-I-CLUE-OUT <RT-PARM-SET 0 3 0>>)
			     (<MC-PRSO? ,TH-MAIL>
			      <RT-ALARM-SET-REL ,RT-I-MAIL-OUT <RT-PARM-SET 0 3 0>>)>)
		      (T
		       <TELL "Unfortunately, " THEI " doesn't put out enough heat to light " THEO "." CR>)>)
	      (<MC-VERB? SMOKE>
	       <COND (<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
		      <TELL ,K-BRAND-MSG CR>)
		     (T
		      <TELL CTHEO " is not lit." CR>)>)
	      (<MC-VERB? SMELL>
	       <TELL "The shag has a strong, but pleasant smell." CR>)>>

<ROUTINE RT-AC-TH-PIPE ("OPTIONAL" (CONTEXT <>) "AUX" I DEST)
	 <DEBUGGING? <RT-DEBUG-OB-AC "TH-PIPE">>
	 <COND (<==? .CONTEXT ,K-M-DESCFCN>
		<COND (<AND <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
			    <IN? ,TH-TOBACCO ,TH-PIPE>>
		       <TELL "Smoke gently wafts from " THE ,TH-PIPE "." CR>)
		      (T
		       <TELL "It is an old and oily black clay pipe, the companion of Holmes's deepest meditations." CR>)>)
	       (<MC-T? .CONTEXT> <RFALSE>)
	       (<MC-THIS-PRSO?>
		<COND (<MC-VERB? LIGHT-WITH BURN-WITH>
		       <COND (<MC-PRSI? <> ,TH-HANDS>
			      <SET I ,TH-MATCH>)
			     (T
			      <SET I ,GL-PRSI>)>
		       <COND (<NOT <IN? .I ,GL-WINNER>>
			      <RT-CYOU-MSG "are" "is">
			      <TELL "not holding " A .I "." CR>)
			     (<NOT <IN? ,TH-PIPE ,GL-WINNER>>
			      <RT-CYOU-MSG "are" "is">
			      <TELL "not holding " THE ,TH-PIPE "." CR>)
			     (<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
			      <TELL CTHEO " is already lit." CR>)
			     (<RT-LIGHT-PIPE .I>
			      <RTRUE>)
			     ;(<FIRST? ,TH-PIPE>
			      <RT-CYOU-MSG>
			      <TELL "cannot light " THE <FIRST? ,TH-PIPE>
				    " in " THE ,TH-PIPE "." CR>)
			     (T
			      <TELL "There is nothing in the pipe to light." CR>)>)
		      (<AND <MC-VERB? PUT>
			    <MC-PRSI? ,TH-PLAYER-BODY>
			    <==? <ZGET ,GL-P-NAMW 1> ,W?MOUTH>>
		       <RT-PERFORM ,V?SMOKE ,TH-PIPE>)
		      (<MC-VERB? SMOKE>
		       <COND (<MC-IS? ,TH-TOBACCO ,FL-LIGHTED>
			      <TELL ,K-BRAND-MSG CR>)
			     (T
			      <TELL CTHEO " is not lit." CR>)>)
		      (<AND <MC-VERB? EMPTY-INTO POUR>
			    <IN? ,TH-TOBACCO ,TH-PIPE>
			    <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>
		       <COND (<MC-VERB? POUR>
			      <MC-UNMAKE ,TH-TOBACCO ,FL-LIGHTED>
			      <MOVE ,TH-TOBACCO ,GL-PLACE-CUR>
			      <TELL CTHE ,TH-TOBACCO " falls ">
			      <COND (<MC-HERE? ,RM-THAMES-ONE ,RM-THAMES-TWO
					      ,RM-THAMES-THREE ,RM-THAMES-FOUR
					      ,RM-THAMES-FIVE>
				     <REMOVE ,TH-TOBACCO>
				     <TELL "into the water." CR>)
				    (T
				     <TELL "to ">
				     <COND (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
					    <TELL-THE-FLOOR>)
					   (T
					    <TELL-THE-GROUND>)>
				     <TELL ", " ,K-SMOULDERS-MSG CR>)>)
			     (<MC-VERB? EMPTY-INTO>
			      <COND (<RT-ROOM-IN-ON-MSG? ,TH-TOBACCO ,GL-PRSI>
				     <RTRUE>)
				    (<RT-CHECK-MOVE-MSG? ,TH-TOBACCO ,GL-PRSI>
				     <RTRUE>)
				    (T
				     <MC-UNMAKE ,TH-TOBACCO ,FL-LIGHTED>
				     <MOVE ,TH-TOBACCO ,GL-PRSI>
				     <TELL CTHE ,TH-TOBACCO " falls ">
				     <COND (<MC-IS? ,GL-PRSI ,FL-CONTAINER>
					    <TELL "into">)
					   (T
					    <TELL "onto">)>
				     <TELL " " THEI ", " ,K-SMOULDERS-MSG CR>)>)>)>)
	       (<MC-THIS-PRSI?>
		<COND (<AND <MC-VERB? PUT>
			    <NOT <MC-PRSO? ,TH-TOBACCO>>>
		       <TELL "Putting " THEO " in " THEI " would">
		       <RT-WASTE-OF-TIME-MSG>)
		      (<AND <MC-VERB? POUR-FROM>
			    <MC-PRSO? ,TH-TOBACCO>
			    <IN? ,TH-TOBACCO ,TH-PIPE>
			    <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>
		       <MC-UNMAKE ,TH-TOBACCO ,FL-LIGHTED>
		       <MOVE ,TH-TOBACCO ,GL-PLACE-CUR>
		       <TELL CTHEO " falls to ">
		       <COND (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
			      <TELL-THE-FLOOR>)
			     (T
			      <TELL-THE-GROUND>)>
		       <TELL ", " ,K-SMOULDERS-MSG CR>)
		      ;(<AND <MC-VERB? LIGHT-WITH BURN-WITH>
			     <MC-THIS-PRSI?>
			     <MC-IS? ,GL-PRSO ,FL-BURNABLE>>
			<COND (<MC-PRSO? ,TH-TORCH>
			       <RFALSE>)
			      (<MC-ISNOT? ,TH-TOBACCO ,FL-LIGHTED>
			       <TELL CTHEI " is not lit." CR>)
			      (<MC-IS? ,GL-PRSO ,FL-LIGHTED>
			       <TELL CTHEO " is already burning." CR>)
			      (<MC-PRSO? ,TH-NEWSPAPER ,TH-WESTMINSTER-CLUE ,TH-MAIL>
			       <TELL CTHEO " lights right up." CR>
			       <MC-MAKE ,GL-PRSO ,FL-LIGHTED>
			       <COND (<MC-PRSO? ,TH-NEWSPAPER>
				      <RT-ALARM-SET-REL ,RT-I-NEWSPAPER-OUT <RT-PARM-SET 0 3 0>>)
				     (<MC-PRSO? ,TH-WESTMINSTER-CLUE>
				      <RT-ALARM-SET-REL ,RT-I-CLUE-OUT <RT-PARM-SET 0 3 0>>)
				     (<MC-PRSO? ,TH-MAIL>
				      <RT-ALARM-SET-REL ,RT-I-MAIL-OUT <RT-PARM-SET 0 3 0>>)>)
			      (T
			       <TELL "Unfortunately, " THEI " doesn't put out
				      enough heat to light " THEO "." CR>)>)>)>>

<ROUTINE RT-AC-TH-MAIL ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-MAIL">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<MC-IS? ,TH-MAIL ,FL-LIGHTED>
		      <TELL CTHE ,TH-MAIL " is burning." CR>
		      <RTRUE>)
		     (T
		      <RFALSE>)>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <SETG GL-P-IT-OBJECT ,TH-MAIL>)>
	<COND (<MC-VERB? READ EXAMINE LOOK-ON LOOK-INSIDE OPEN SEARCH OPEN-WITH>
	       <TELL "You should not read other people's mail." CR>)
	      (<MC-VERB? CLOSE>
	       <TELL "The mail hasn't been opened." CR>)
	      (<AND <MC-VERB? TAKE>
		    <T? ,KNIFE-COLD?>>
	       <SETG KNIFE-COLD? <>>
	       <MOVE ,TH-KNIFE ,GL-WINNER>
	       <TELL "[Taking the knife first]">
	       <COND (,GL-P-MULT?
		      <TELL " ">)
		     (T
		      <CRLF>)>
	       <RFALSE>)
	      (<AND <MC-VERB? LIGHT-WITH BURN-WITH>
		    <MC-THIS-PRSO?>>
	       <COND (<MC-IS? ,TH-MAIL ,FL-LIGHTED>
		      <TELL CTHEO " is already lit." CR>)
		     (<AND <MC-ISNOT? ,GL-PRSI ,FL-BURNABLE>
			   <NOT <MC-PRSI? ,TH-PIPE>>>
		      <RFALSE>)
		     (<OR <AND <MC-IS? ,GL-PRSI ,FL-LIGHTED>
			       <MC-IS? ,GL-PRSI ,FL-BURNABLE>>
			  <AND <MC-PRSI? ,TH-PIPE>
			       <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>>
		      <TELL CTHE ,TH-MAIL " lights up." CR>
		      <MC-MAKE ,TH-MAIL ,FL-LIGHTED>
		      <RT-ALARM-SET-REL ,RT-I-MAIL-OUT <RT-PARM-SET 0 3 0>>)
		     (T
		      <TELL CTHEI>
		      <RT-ISNT-ARENT-MSG ,GL-PRSI>
		      <TELL "burning." CR>)>)>>

<ROUTINE RT-AC-TH-NEWSPAPER ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-NEWSPAPER">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<MC-IS? ,TH-NEWSPAPER ,FL-LIGHTED>
		      <TELL CTHE ,TH-NEWSPAPER " is burning." CR>)
		     (T
		      <TELL
		       "It's the newspaper that came in your game package."
		       CR>)>
	       <RTRUE>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<NOT <MC-VERB? READ READ-TO SHOW LIGHT-WITH BURN-WITH
			      GIVE TELL-ABOUT>>
	       <RFALSE>)
	      (<NOT <IN? ,TH-NEWSPAPER ,CH-PLAYER>>
	       <TELL "The newspaper will not leap into your hand by itself." CR>)
	      (<MC-VERB? READ>
	       <RT-READ-NEWSPAPER>)
	      (<OR <AND <MC-VERB? READ-TO SHOW GIVE>
			<MC-THIS-PRSO?>>
		   <AND <MC-VERB? TELL-ABOUT>
			<MC-THIS-PRSI?>>>
	       <COND (<MC-ISNOT? ,GL-PRSI ,FL-PERSON>
		      <RFALSE>)
		     (<OR <MC-IS? ,TH-NEWSPAPER ,FL-ASLEEP>
			  <MC-IS? ,TH-NEWSPAPER ,FL-OPENED>>
		      <RT-READ-NEWSPAPER>
		      <CRLF>)>
	       <COND (<OR <AND <MC-VERB? READ-TO SHOW GIVE>
			       <MC-PRSI? ,CH-HOLMES>>
			  <AND <MC-VERB? TELL-ABOUT>
			       <MC-PRSO? ,CH-HOLMES>>>
		      <COND (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
			     <RT-WAKE-UP-HOLMES>
			     <COND 
			      (<MC-VERB? GIVE>
			       <MOVE ,TH-NEWSPAPER ,CH-HOLMES>)>
			     <RTRUE>)
			    ;(T
			      <TELL "\"Don't be tedious, Watson. You have ">
			      <COND (<MC-VERB? READ-TO>
				     <TELL "read">)
				    (<MC-VERB? SHOW>
				     <TELL "shown">)
				    (<MC-VERB? GIVE>
				     <TELL "given">)
				    (<MC-VERB? TELL-ABOUT>
				     <TELL "mentioned">)>
			      <TELL " that to me already.\"" CR>)>)
		     (T
		      <TELL CTHEI>
		      <RT-DONT-DOESNT-MSG ,GL-PRSI>
		      <TELL "seem to be interested." CR>)>)
	      (<AND <MC-VERB? LIGHT-WITH BURN-WITH>
		    <MC-THIS-PRSO?>>
	       <COND (<MC-IS? ,TH-NEWSPAPER ,FL-LIGHTED>
		      <TELL CTHEO " is already lit." CR>)
		     (<AND <MC-ISNOT? ,GL-PRSI ,FL-BURNABLE>
			   <NOT <MC-PRSI? ,TH-PIPE>>>
		      <RFALSE>)
		     (<OR <AND <MC-IS? ,GL-PRSI ,FL-LIGHTED>
			       <MC-IS? ,GL-PRSI ,FL-BURNABLE>>
			  <AND <MC-PRSI? ,TH-PIPE>
			       <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>>
		      <TELL CTHE ,TH-NEWSPAPER " lights up." CR>
		      <MC-MAKE ,TH-NEWSPAPER ,FL-LIGHTED>
		      <RT-ALARM-SET-REL ,RT-I-NEWSPAPER-OUT <RT-PARM-SET 0 3 0>>
		      <RTRUE>)
		     (T
		      <TELL CTHEI>
		      <RT-ISNT-ARENT-MSG ,GL-PRSI>
		      <TELL "burning." CR>)>)>>

<ROUTINE RT-AC-TH-WESTMINSTER-CLUE ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-WESTMINSTER-CLUE">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<MC-IS? ,TH-MAIL ,FL-LIGHTED>
		      <TELL CTHE ,TH-MAIL " is burning." CR>
		      <RTRUE>)
		     (T <RFALSE>)>)
	      (<MC-T? .CONTEXT> <RFALSE>)
	      (<MC-VERB? READ EXAMINE>
	       <COND (<NOT <IN? ,TH-WESTMINSTER-CLUE ,CH-PLAYER>>
		      <TELL "The paper will not leap into your hand by itself." CR>)
		     (<ZERO? <GETP ,TH-WESTMINSTER-CLUE ,P?FLIPPED>>
		      <TELL 
INDENT "Mortality, behold and fear!" CR
INDENT "What a change of flesh is here!" CR
INDENT "Think how many royal bones" CR
INDENT "Sleep within this heap of stones:" CR
INDENT "Here they lie, had realms and lands," CR
INDENT "Who now want strength" WRAP "to stir their hands." CR CR

INDENT ,K-ASTERISK-MSG CR CR
		      
INDENT "For two-score years I reigned alone," CR
INDENT "A virgin queen on England's throne." CR
INDENT "My navy caused Armada's shame," CR
INDENT "And with me died the Tudor name." CR CR

INDENT ,K-ASTERISK-MSG CR CR

INDENT "The apple sorely tempted Eve," CR
INDENT "And Tell another aimed to cleave." CR
INDENT "But when one fell, it showed to me," CR
INDENT "The mighty pull of gravity." CR CR

INDENT ,K-ASTERISK-MSG CR CR

INDENT "My father, it was said, would die," CR
INDENT "Beneath the Holy City's sky." CR
INDENT "Jerusalem his body claimed," CR
INDENT "And it is after him I'm named." CR CR

INDENT ,K-ASTERISK-MSG CR CR

INDENT ,K-ASTERISK-MSG CR CR

INDENT "O stately Holmes of England," CR
INDENT "In Baker Street abide." CR
INDENT "For even you must surely fail," CR
INDENT "To save your country's pride." CR>)
		     (T
		      <TELL "This side appears to be blank." CR>)>)
	      (<AND <MC-VERB? LIGHT-WITH BURN-WITH>
		    <MC-THIS-PRSO?>>
	       <COND (<MC-IS? ,TH-WESTMINSTER-CLUE ,FL-LIGHTED>
		      <TELL CTHEO " is already lit." CR>)
		     (<AND <MC-ISNOT? ,GL-PRSI ,FL-BURNABLE>
			   <NOT <MC-PRSI? ,TH-PIPE>>>
		      <RFALSE>)
		     (<OR <AND <MC-IS? ,GL-PRSI ,FL-LIGHTED>
			       <MC-IS? ,GL-PRSI ,FL-BURNABLE>>
			  <AND <MC-PRSI? ,TH-PIPE>
			       <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>>
		      <TELL CTHE ,TH-WESTMINSTER-CLUE " lights up." CR>
		      <MC-MAKE ,TH-WESTMINSTER-CLUE ,FL-LIGHTED>
		      <RT-ALARM-SET-REL ,RT-I-CLUE-OUT <RT-PARM-SET 0 3 0>>)
		     (T
		      <TELL CTHEI>
		      <RT-ISNT-ARENT-MSG ,GL-PRSI>
		      <TELL "burning." CR>)>
	       <RTRUE>)
	      (<MC-VERB? FLIP>
	       <COND (<NOT <IN? ,TH-WESTMINSTER-CLUE ,GL-WINNER>>
		      <RT-CYOU-MSG "are" "is">
		      <TELL "not holding " THE ,TH-WESTMINSTER-CLUE "." CR>)
		     (T
		      <PUTP ,TH-WESTMINSTER-CLUE ,P?FLIPPED <- 1 <GETP ,TH-WESTMINSTER-CLUE ,P?FLIPPED>>>
		      <RT-CYOU-MSG "turn" "turns">
		      <TELL THE ,TH-WESTMINSTER-CLUE " over." CR>)>)
	      (<AND <MC-VERB? LOOK-THRU>
		    <MC-PRSI? ,TH-MAGNIFYING-GLASS>>
	       <TELL "It's been wiped clean." CR>)>>

<CONSTANT K-HOLMES-HEAD? 1> ; "Has Holmes made comment about Charles I head?"
<CONSTANT K-HOLMES-GEM?	 2> ; "Has Holmes made comment about gem?"

<ROUTINE RT-AC-TH-WAX-HEAD ("OPTIONAL" (CONTEXT <>))
   <DEBUGGING? <RT-DEBUG-OB-AC "TH-WAX-HEAD">>
   <COND (<==? .CONTEXT ,K-M-SDESC>
	  <COND (<FSET? ,TH-WAX-HEAD ,FL-BROKEN>
		 <TELL "wax pool">)
		(T
		 <TELL "wax head">)>)
	 (<==? .CONTEXT ,K-M-DESCFCN>
	  <COND (<NOT <FSET? ,TH-WAX-HEAD ,FL-BROKEN>>
		 <RFALSE>)
		(<NOT <FIRST? ,TH-WAX-HEAD>>
		 <TELL "Looks like any other " D ,TH-WAX-HEAD "." CR>)>)
	 (<NOT <FSET? ,TH-WAX-HEAD ,FL-BROKEN>>  ; "STILL THE HEAD"
	  <COND (<IN? ,TH-WAX-HEAD ,TH-CHARLES-STATUE>
		 <COND (<MC-VERB? TAKE ;UNSCREW UNSCREW-FROM>
			<MOVE ,TH-WAX-HEAD ,GL-WINNER>
			<MC-MAKE ,TH-WAX-HEAD ,FL-SEEN>
			<MC-UNMAKE ,TH-WAX-HEAD ,FL-NODESC>
			<MC-UNMAKE ,TH-WAX-HEAD ,FL-NOALL>
			<COND (,GL-P-MULT?
			       <TELL "Taken." CR>)
			      (T
			       <RT-CYOU-MSG "take" "takes">
			       <TELL THE ,TH-WAX-HEAD "." CR>)>)
		       (<RT-TOUCH-VERB?>
			<MC-MAKE ,TH-WAX-HEAD ,FL-SEEN>
			<TELL CTHE ,TH-WAX-HEAD " wobbles slightly.">
			<COND (<MC-F? <BAND ,CH-HOLMES-AUX1 ,K-HOLMES-HEAD?>>
			       <TELL " " THE ,CH-HOLMES
" says, \"Even when he was alive, he didn't have his head screwed on right.\"">
			       <SETG CH-HOLMES-AUX1 <BOR ,CH-HOLMES-AUX1 ,K-HOLMES-HEAD?>>)>
			<CRLF>)>)
		(<AND <MC-VERB? MELT HEAT>
		      <MC-THIS-PRSO?>
		      <OR <AND <MC-IS? ,GL-PRSI ,FL-BURNABLE>
			       <MC-IS? ,GL-PRSI ,FL-LIGHTED>>
			  <AND <MC-PRSI? ,TH-PIPE>
			       <MC-IS? ,TH-TOBACCO ,FL-LIGHTED>>>>
		 <TELL CTHEO " softens, but " THEI
" does not put out enough heat to melt it." CR>)
		(<MC-VERB? MUNG KILL OPEN>
		 <RT-CYOU-MSG>
		 <TELL "can't break into the head." CR>)>)
	 (T ; "NOW THE POOL"
	  <RFALSE>)>>

<ROUTINE DESC-WAX-AX ("OPTIONAL" (CONTEXT <>))
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <COND (<FSET? ,TH-WAX-AX ,FL-BROKEN>
		      <TELL "melted axe">)
		     (T
		      <TELL "axe">)>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<NOT <FSET? ,TH-WAX-AX ,FL-BROKEN>> <RFALSE>)
		     (<NOT <FIRST? ,TH-WAX-AX>>
		      <TELL "Looks like any other " D ,TH-WAX-AX "." CR>)>)>>

<ROUTINE RT-GUARD-TAKE-ITEM (OBJ1 "OPTIONAL" (OBJ2 <>) (OBJ3 <>) "AUX" STR)
	<TELL CTHE ,CH-TUSSAUDS-GUARD " says, \"I'm sorry, but " THE .OBJ1>
	<COND (<AND .OBJ2 .OBJ3>
	       <TELL ", " THE .OBJ2 " and " THE .OBJ3 " are">
	       <SET STR "them">)
	      (<MC-T? .OBJ2>
	       <TELL " and " THE .OBJ2 " are">
	       <SET STR "them">)
	      (T
	       <TELL " is">
	       <SET STR "it">)>
	<TELL
" not to be removed.\" He takes " .STR " and returns " .STR " to the proper
place." CR CR>>

<ROUTINE RT-GUARD-STOP-ENTRANCE ("OPTIONAL" (OBJ <>) "AUX" WHO)
	<SET WHO <RT-WHO-SAYS?>>
	<IFSOUND <SOUNDS ,S-BARK ,S-START 8 4>>
	<TELL CTHE ,CH-MATCH-SNIFFING-DOG " barks loudly and " THE
,CH-TUSSAUDS-GUARD " says, \"Seeing as how it's you, ">
	<COND (<EQUAL? .WHO ,CH-HOLMES>
	       <TELL "Mr Holmes">)
	      (T
	       <TELL "Doctor Watson">)>
	<TELL
", I don't mind letting you in. But as you know we are very afraid of
fire here, so we have trained this dog to detect matches or open
flames. I'm afraid I can't allow you">
	<COND (<EQUAL? .WHO ,CH-HOLMES ,CH-WIGGINS>
	       <TELL " or your companion">)>
	<TELL " to enter until " THE .OBJ " has been discarded.\"" CR>
        ;<COND (<AND .OBJ 	;"COND ALWAYS TRUE"
		    <OR <IN? .OBJ ,CH-PLAYER>
			<AND ,GL-PUPPY
			     <IN? .OBJ ,GL-PUPPY>>>>
	        <TELL THE .OBJ>)
	       (T
		<TELL "the item">
		<COND (<NOT .OBJ>
		       <TELL "s">)>
		<TELL " to which the dog objects">)>
	;<TELL " ha">
	;<COND (.OBJ
		<TELL "s">)
	       (T
		<TELL "ve">)>
	;<TELL " been discarded.\"" CR>>

<ROUTINE RT-EX-RM-EXIT-TUSSAUDS ("AUX" IN1 IN2 IN3 TORCH)
	<COND (<AND <EQUAL? ,GL-PRSO ,P?SOUTH ,P?OUT>
		    <MC-HERE? ,RM-MADAME-TUSSAUDS>>
	       <SET IN1
		    <COND (<OR <RT-META-IN? ,TH-TORCH ,GL-WINNER>
			       <RT-META-IN? ,TH-TORCH ,GL-PUPPY>>
			   <SET TORCH ,TH-TORCH>)
			  ;(<OR <RT-META-IN? ,TH-BURNT-TORCH ,GL-WINNER>
				<RT-META-IN? ,TH-BURNT-TORCH ,GL-PUPPY>>
			    <SET TORCH ,TH-BURNT-TORCH>)>>
	       <SET IN2 <OR <RT-META-IN? ,TH-WAX-HEAD ,GL-WINNER>
			    <RT-META-IN? ,TH-WAX-HEAD ,GL-PUPPY>>>
	       <SET IN3 <OR <RT-META-IN? ,TH-WAX-AX ,GL-WINNER>
			    <RT-META-IN? ,TH-WAX-AX ,GL-PUPPY>>>
	       <COND (<AND .IN1 .IN2 .IN3>
		      <RT-GUARD-TAKE-ITEM ,TH-TORCH ,TH-WAX-HEAD ,TH-WAX-AX>)
		     (<AND .IN1 .IN2>
		      <RT-GUARD-TAKE-ITEM ,TH-TORCH ,TH-WAX-HEAD>)
		     (<AND .IN1 .IN3>
		      <RT-GUARD-TAKE-ITEM ,TH-TORCH ,TH-WAX-AX>)
		     (<AND .IN2 .IN3>
		      <RT-GUARD-TAKE-ITEM ,TH-WAX-HEAD ,TH-WAX-AX>)
		     (<MC-T? .IN1>
		      <RT-GUARD-TAKE-ITEM ,TH-TORCH>)
		     (<MC-T? .IN2>
		      <RT-GUARD-TAKE-ITEM ,TH-WAX-HEAD>)
		     (<MC-T? .IN3>
		      <RT-GUARD-TAKE-ITEM ,TH-WAX-AX>)>
	       <COND (<MC-T? .IN1>
		      <MOVE .TORCH ,TH-FAWKES-STATUE>
		      <MC-MAKE .TORCH ,FL-NODESC>
		      <COND (<MC-IS? .TORCH ,FL-LIGHTED>
			     <RT-ALARM-CLR ,RT-I-TORCH-OUT>
			     <RT-I-TORCH-OUT>
			     <MC-MAKE ,TH-TORCH ,FL-NODESC>
			     ;<MC-MAKE ,TH-BURNT-TORCH ,FL-NODESC>)>)>
	       <COND (<MC-T? .IN2>
		      <MOVE ,TH-WAX-HEAD ,TH-CHARLES-STATUE>
		      <MC-MAKE ,TH-WAX-HEAD ,FL-NODESC>)>
	       <COND (<MC-T? .IN3>
		      <MOVE ,TH-WAX-AX ,TH-CHARLES-STATUE>
		      <MC-MAKE ,TH-WAX-AX ,FL-NODESC>)>
	       <RETURN ,RM-MARYLEBONE-RD>)>>

; "NORTH from RM-MARYLEBONE-RD to RM-MADAME-TUSSAUDS"

<ROUTINE RT-EX-RM-MATCH-SNIFFING-DOG ("AUX" OBJ (FLAME? <>) (FIRST T) LAMP? MATCH?)
     <COND (<AND <EQUAL? ,GL-PRSO ,P?NORTH ,P?IN>
		 <MC-HERE? ,RM-MARYLEBONE-RD>>
	    <REPEAT ()
		    <SET OBJ <FIRST? ,GL-WINNER>>
		    <REPEAT ()
			    <COND (<MC-F? .OBJ>
				   <RETURN>)
				  (<AND <MC-IS? .OBJ ,FL-BURNABLE>
					<MC-IS? .OBJ ,FL-LIGHTED>
					<NOT <EQUAL? .OBJ ,TH-TOBACCO>>>
				   <SET FLAME? .OBJ>
				   <RETURN>)>
			    <SET OBJ <NEXT? .OBJ>>>
		    <COND (<AND <MC-F? .FLAME?>
				<MC-T? .FIRST>
				<MC-T? ,GL-PUPPY>>
			   <SET OBJ <FIRST? ,GL-PUPPY>>
			   <SET FIRST <>>)
			  (T
			   <RETURN>)>>
	    <COND (<OR <SET MATCH? <AND <OR <RT-META-IN? ,TH-MATCH ,CH-PLAYER>
					    <RT-META-IN? ,TH-MATCH ,GL-PUPPY>>
					<OR <MC-IS? ,TH-MATCH ,FL-BURNABLE>
					    <MC-IS? ,TH-MATCH ,FL-LIGHTED>>>>
		       <SET LAMP? <OR <RT-META-IN? ,TH-LAMP ,CH-PLAYER>
				      <RT-META-IN? ,TH-LAMP ,GL-PUPPY>>>
		       .FLAME?>
		   <SET OBJ <COND (.FLAME?
				   .FLAME?)
				  (.LAMP?
				   ,TH-LAMP)
				  (.MATCH?
				   ,TH-MATCH)>>
		   <RT-GUARD-STOP-ENTRANCE .OBJ>
		   <RFALSE>)>
	    <COND (<OR <FSET? ,TH-WAX-HEAD ,FL-BROKEN>
		       ;<MC-F? <LOC ,TH-WAX-HEAD>>
		       <FSET? ,TH-WAX-AX ,FL-BROKEN>
		       ;<MC-F? <LOC ,TH-WAX-AX>>>
		   <TELL
"The guard blocks your path and says, \"Oh no you don't, laddie. When I let
you in earlier you made a proper mess of my museum. I won't let you do that
again.\" After you promise to pay for the damage and plead with him for a few
moments, he finally steps aside." CR CR>)>
	    <RETURN ,RM-MADAME-TUSSAUDS>)>>

<ROUTINE RT-PUT-OUT (THING)
	 <COND (<MC-ISNOT? .THING ,FL-BURNABLE>
		<RFALSE>)
	       (<MC-ISNOT? .THING ,FL-LIGHTED>
		<RFALSE>)
	       (<EQUAL? .THING ,TH-MATCH>
		<RT-ALARM-CLR ,RT-I-MATCH-OUT>
		<RT-I-MATCH-OUT>)
	       (<EQUAL? .THING ,TH-PIPE>
		<RT-ALARM-CLR ,RT-I-PIPE-OUT>
		<RT-I-PIPE-OUT>)
	       (<EQUAL? .THING ,TH-TORCH>
		<RT-ALARM-CLR ,RT-I-TORCH-OUT>
		<RT-I-TORCH-OUT>)
	       (<EQUAL? .THING ,TH-NEWSPAPER>
		<RT-ALARM-CLR ,RT-I-NEWSPAPER-OUT>
		<RT-I-NEWSPAPER-OUT>)
	       (<EQUAL? .THING ,TH-WESTMINSTER-CLUE>
		<RT-ALARM-CLR ,RT-I-CLUE-OUT>
		<RT-I-CLUE-OUT>)
	       (<EQUAL? .THING ,TH-MAIL>
		<RT-ALARM-CLR ,RT-I-MAIL-OUT>
		<RT-I-MAIL-OUT>)
	       (<EQUAL? .THING ,TH-MATCHBOOK>
		<RT-ALARM-CLR ,RT-I-MATCHBOOK-OUT>
		<RT-I-MATCHBOOK-OUT>)
	       (T
		<REMOVE .THING>
		<FCLEAR .THING ,FL-WORN>
		<MC-UNMAKE .THING ,FL-LIGHTED>
		<MC-UNMAKE .THING ,FL-BURNABLE>
		<TELL CTHE .THING " burn">
		<RT-S-NOS-MSG .THING>
		<TELL " up and disappears." CR>)>>

<ROUTINE RT-I-MATCH-OUT ("AUX" (RESULT <>))
	<COND (<RT-VISIBLE? ,TH-MATCH>
	       <TELL CR CTHE ,TH-MATCH " flickers and dies." CR>
	       <SET RESULT T>)>
	<MC-UNMAKE ,TH-MATCH ,FL-LIGHTED>
	<BURN-MATCH-OUT>
	;<MC-UNMAKE ,TH-MATCH ,FL-BURNABLE>
	;<MOVE ,TH-BURNT-MATCH <LOC ,TH-MATCH>>
	;<REMOVE ,TH-MATCH>
	<RETURN .RESULT>>

<ROUTINE BURN-MATCH-OUT ()
	<FCLEAR ,TH-MATCH ,FL-BURNABLE>
	<FSET ,TH-MATCH ,FL-BROKEN>
	<PUT <GETPT ,TH-MATCH ,P?ADJECTIVE> 0 ,W?BURNT>>

<ROUTINE RT-I-PIPE-OUT ("AUX" (RESULT <>))
	<COND (<RT-VISIBLE? ,TH-TOBACCO>
	       <TELL CR CTHE ,TH-PIPE " has gone out." CR>)>
	<MC-UNMAKE ,TH-TOBACCO ,FL-LIGHTED>
	<MC-UNMAKE ,TH-TOBACCO ,FL-BURNABLE>
	<REMOVE ,TH-TOBACCO>
	<RETURN .RESULT>>

<ROUTINE RT-I-TORCH-OUT ("AUX" (RESULT <>))
	<COND (<RT-VISIBLE? ,TH-TORCH>
	       <TELL CR CTHE ,TH-TORCH " sputters and dies." CR>
	       <SET RESULT T>)>
	<CLEAR-ALL-FLAGS ,TH-TORCH>
	<PUT <GETPT ,TH-TORCH ,P?ADJECTIVE> 0 ,W?BURNT>
	<FSET ,TH-TORCH ,FL-TAKEABLE>
	<FSET ,TH-TORCH ,FL-BROKEN>
	;<MC-UNMAKE ,TH-TORCH ,FL-LIGHTED>
	;<MC-UNMAKE ,TH-TORCH ,FL-BURNABLE>
	;<MOVE ,TH-BURNT-TORCH <LOC ,TH-TORCH>>
	;<REMOVE ,TH-TORCH>
	<RETURN .RESULT>>

<ROUTINE RT-I-NEWSPAPER-OUT ("AUX" (RESULT <>))
	<COND (<RT-VISIBLE? ,TH-NEWSPAPER>
	       <TELL CR CTHE ,TH-NEWSPAPER " disappears into a cloud of fine ash, which itself disappears." CR>
	       <SET RESULT T>)>
	<MC-UNMAKE ,TH-NEWSPAPER ,FL-LIGHTED>
	<MC-UNMAKE ,TH-NEWSPAPER ,FL-BURNABLE>
	<REMOVE ,TH-NEWSPAPER>
	<RETURN .RESULT>>

<ROUTINE RT-I-CLUE-OUT ("AUX" (RESULT <>))
	<COND (<RT-VISIBLE? ,TH-WESTMINSTER-CLUE>
	       <TELL CR CTHE ,TH-WESTMINSTER-CLUE
		     " disappears in a puff of oily black smoke." CR>
	       <SET RESULT T>)>
	<MC-UNMAKE ,TH-WESTMINSTER-CLUE ,FL-LIGHTED>
	<MC-UNMAKE ,TH-WESTMINSTER-CLUE ,FL-BURNABLE>
	<REMOVE ,TH-WESTMINSTER-CLUE>
	<RETURN .RESULT>>

<ROUTINE RT-I-MAIL-OUT ("AUX" (RESULT <>))
	<COND (<RT-VISIBLE? ,TH-MAIL>
	       <TELL CR CTHE ,TH-MAIL " disappears in a flash of light." CR>
	       <SET RESULT T>)>
	<MC-UNMAKE ,TH-MAIL ,FL-LIGHTED>
	<MC-UNMAKE ,TH-MAIL ,FL-BURNABLE>
	<REMOVE ,TH-MAIL>
	<RETURN .RESULT>>

<ROUTINE RT-I-MATCHBOOK-OUT ("AUX" (RESULT <>))
	<COND (<RT-VISIBLE? ,TH-MATCHBOOK>
	       <TELL CR CTHE ,TH-MATCHBOOK " burns up and disappears." CR>
	       <SET RESULT T>)>
	<MC-UNMAKE ,TH-MATCHBOOK ,FL-LIGHTED>
	<MC-UNMAKE ,TH-MATCHBOOK ,FL-BURNABLE>
	<REMOVE ,TH-MATCHBOOK>
	<RETURN .RESULT>>

<ROUTINE PRE-LIGHT-WITH ()
	<DEBUGGING? <RT-DEBUG-PRE-VERB "PRE-LIGHT-WITH">>
	<COND (<AND <NOT <MC-PRSO? ,TH-MATCH ,TH-TOBACCO>>
		    <NOT <IN? ,GL-PRSO ,GL-WINNER>>>
	       <RT-CYOU-MSG>
	       <RT-WOULD-HAVE-TO-MSG "be holding" ,GL-PRSO>
	       <TELL " to light ">
	       <RT-SAY-HIM-HER-THEM-IT-MSG ,GL-PRSO>
	       <TELL "." CR>)>>

<ROUTINE RT-GN-WAX (TBL "OPTIONAL" (LEN 0))
	<PUTP ,PSEUDO-OBJECT ,P?ACTION ,RT-DF-LG-WAX-STATUES>
	<SETG LAST-PSEUDO-LOC ,GL-PLACE-CUR>
	<RETURN ,PSEUDO-OBJECT>>

