;*****************************************************************************
; "game : SHERLOCK!"
; "file : TOWER.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   28 Oct 1987 17:00:32  $"
; "revs : $Revision:   1.45  $"
; "vers : 1.00"
;*****************************************************************************

; "EAST  from RM-BYWARD-TOWER to RM-OUTER-WARD"
; "WEST  from RM-BYWARD-TOWER to RM-DRAWBRIDGE"

<ROUTINE RT-EX-RM-EXIT-BYWARD-TOWER ()
   <COND (<MC-PRSO? P?EAST P?IN>
	  <COND (<T? ,ALLOW-IN-TOWER>
		 <TELL "The guard nods as you pass." CR>
		 <RETURN ,RM-OUTER-WARD>)>
	  <TELL
"The guard steps into your path and says, \"I am sorry but you cannot go
in unless you can tell me the password.\"" CR>
	  <RFALSE>)
	 (<MC-PRSO? P?WEST P?OUT>
	  <COND (<EQUAL? ,GL-PLACE-PRV ,RM-DRAWBRIDGE>
		 <RETURN ,RM-DRAWBRIDGE>)
		(T
		 <TELL
"The guard blocks your path and says, \"I am sorry, but I am under strict
orders not to allow anyone to leave the Tower.\"" CR>
		 <RFALSE>)>)>>

<OBJECT CH-TOWER-GUARD
	(LOC RM-BYWARD-TOWER)
	(DESC "beefeater")
	(FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-LOCKED FL-NODESC)
	(SYNONYM GUARD YEOMAN BEEFEATER)
	(ADJECTIVE TOWER)
	(SIZE 99 CAPACITY 20)
	(ACTION RT-AC-CH-TOWER-GUARD)>

<ROUTINE RT-AC-CH-TOWER-GUARD ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-CH-AC "TOWER-GUARD" .CONTEXT>>
	<COND (<MC-THIS-WINNER?>
	       <COND (<MC-VERB? BOLEYN CLEVES HOWARD PARR ARAGON SEYMOUR PASSWORD>
		      <RFALSE>)
		     (T
		      <TELL "The guard stares at you impassively." CR>)>)
	      (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <RFALSE>)>>

<OBJECT TH-MALMSEY
   (LOC TH-BUTT-OF-MALMSEY)
   (DESC "malmsey")
   (FLAGS FL-PLURAL FL-COLLECTIVE FL-TRYTAKE FL-FOOD)
   (SYNONYM MALMSEY WINE)
   (ACTION RT-AC-TH-MALMSEY)>

<OBJECT TH-MALMSEY-POOL
   (DESC "pool of malmsey")
   (FLAGS FL-TRYTAKE FL-FOOD)
   (SYNONYM MALMSEY WINE POOL)
   (ADJECTIVE POOL)
   (ACTION RT-AC-TH-MALMSEY-POOL)>

<OBJECT TH-BUTT-OF-MALMSEY
   (LOC RM-BOWYER-TOWER)
   ;(DESC "butt of malmsey")
   (FLAGS FL-TRYTAKE FL-CONTAINER FL-OPENED FL-NODESC
	  FL-HAS-SDESC FL-HAS-DESCFCN)
   (SYNONYM BUTT KEG BARREL)
   (ADJECTIVE BUTT KEG BARREL MALMSEY)
   (SIZE 50 MASS 50 CAPACITY 50)
   (ACTION RT-AC-TH-BUTT-OF-MALMSEY)>

<OBJECT TH-GARNET
   (DESC "garnet")
   (FLAGS FL-TAKEABLE FL-READABLE FL-SURFACE FL-MONEY
	  FL-HAS-DESCFCN FL-HAS-SDESC FL-NEEDS-IDENTITY FL-LOSE-IDENTITY)
   (OBJ-ADJ 0)
   (OBJ-NOUN 0)
   (SYNONYM GARNET GEM GEMS SCRATCH)
   (ADJECTIVE GARNET GARNET\'S)
   (VALUE 5)
   (SIZE 1 MASS 1 CAPACITY 1)
   (GENERIC RT-GN-GEM)
   (ACTION RT-AC-TH-GARNET)>

<OBJECT TH-BUNG
   (LOC TH-BUTT-OF-MALMSEY)
   (DESC "bung")
   (FLAGS FL-TAKEABLE FL-TRYTAKE FL-NODESC)
   (SYNONYM BUNG STOPPER CORK)
   (SIZE 3 MASS 3)
   (ACTION RT-AC-TH-BUNG)>

<OBJECT TH-MACE
   (LOC RM-JEWEL-ROOM)
   (DESC "mace")
   (FLAGS FL-TAKEABLE FL-WEAPON FL-HAS-DESCFCN)
   (SYNONYM MACE WEAPON)
   (VALUE 1)
   (SIZE 15 MASS 15)
   (ACTION RT-AC-TH-MACE)>

<OBJECT TH-PORTCULLIS-CHAIN
   (LOC RM-INSIDE-TRAITORS-GATE)
   (DESC "chain")
   (FLAGS FL-TRYTAKE FL-NODESC FL-HAS-DESCFCN)
   (SYNONYM CHAIN)
   (ADJECTIVE PORTCULLIS)
   (ACTION RT-AC-TH-PORTCULLIS-CHAIN)>

<OBJECT TH-SUIT-OF-ARMOUR
   (LOC RM-DUNGEON)
   (DESC "suit of armour")
   (FLAGS FL-TAKEABLE FL-CLOTHING FL-CONTAINER FL-OPENED
	  FL-HAS-DESCFCN)
   (SYNONYM ARMOUR SUIT ARMOR)
   (ADJECTIVE SUIT ARMOUR ARMOR)
   (SIZE 100 CAPACITY 999)
   (ACTION RT-AC-TH-SUIT-OF-ARMOUR)>

<ROUTINE RT-AC-TH-MALMSEY ()
	<DEBUGGING? <RT-DEBUG-TH-AC "TH-MALMSEY">>
	<COND (<MC-THIS-PRSO?>
	       <SETG GL-P-IT-OBJECT ,TH-MALMSEY>)>
	<COND (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? DRINK DRINK-FROM EAT DRINK>
		      <TELL ,K-TIPSY-MSG CR>)
		     (<MC-VERB? SHOOT>
		      <TELL ,K-BULLET-MSG>
		      <RT-EMPTY-BUTT-MSG>)>)>>

<ROUTINE RT-AC-TH-MALMSEY-POOL ()
	<DEBUGGING? <RT-DEBUG-TH-AC "TH-MALMSEY-POOL">>
	<COND (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? DRINK DRINK-FROM EAT TASTE>
		      <TELL
"You get down on all fours and lap up some of the wine. Yuch!" CR>)
		     (<MC-VERB? SHOOT>
		      <RT-WHY-SHOOT-MSG>)>)>>

<ROUTINE RT-AC-TH-BUTT-OF-MALMSEY ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-TH-AC "TH-BUTT-OF-MALMSEY">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <COND (<FSET? ,TH-BUTT-OF-MALMSEY ,FL-BROKEN>
		      <TELL "empty ">)>
	       <TELL "butt of malmsey">
	       <RTRUE>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<FSET? ,TH-BUTT-OF-MALMSEY ,FL-BROKEN>
		      <RFALSE>)
		     (T
		      <TELL
"It's an old wooden keg that's brimming over with malmsey and covered with
stains where the wine has spilled down the sides and leaked through the
bung." CR>
		      <RTRUE>)>)>
	<COND (<FSET? ,TH-BUTT-OF-MALMSEY ,FL-BROKEN>
	       <RT-AC-TH-EMPTY-BUTT-OF-MALMSEY>)
	      (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? DRINK>
		      <TELL ,K-TIPSY-MSG CR>)
		     (<MC-VERB? DRINK-FROM>
		      <TELL "You take a sip. It tastes like Malmsey." CR>)
		     (<MC-VERB? FLIP PUSH TIP PUSH-TO LOOSEN>
		      <TELL CTHEO " is much too heavy to move." CR>)
				(<MC-VERB? SHOOT>
				 <TELL ,K-BULLET-MSG>
				 <RT-EMPTY-BUTT-MSG>)
				(<MC-VERB? REACH-IN>
				 <RT-CYOU-MSG "stick" "sticks">
				 <TELL
"an arm down into the malmsey, but">
				 <RT-YOU-MSG "come" "comes" T>
				 <TELL "up empty." CR>)>)>>

<ROUTINE RT-AC-TH-EMPTY-BUTT-OF-MALMSEY ()
	<DEBUGGING? <RT-DEBUG-TH-AC "TH-EMPTY-BUTT-OF-MALMSEY">>
	<COND (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? DRINK DRINK-FROM>
		      <TELL "Too bad. All gone." CR>)
		     (<MC-VERB? FLIP>
		      <TELL "That would">
		      <RT-WASTE-OF-TIME-MSG>)>)>>

<ROUTINE RT-EMPTY-BUTT-MSG ()
	<REMOVE ,TH-MALMSEY>
	;<REMOVE ,TH-BUTT-OF-MALMSEY>
	<MOVE ,TH-GARNET ,TH-BUTT-OF-MALMSEY>
	<MOVE ,TH-MALMSEY-POOL ,RM-BOWYER-TOWER>
	;<MOVE ,TH-EMPTY-BUTT-OF-MALMSEY ,RM-BOWYER-TOWER>
	<FSET ,TH-BUTT-OF-MALMSEY ,FL-BROKEN>
	<MOVE ,TH-BUNG ,RM-BOWYER-TOWER>
	<TELL
" flies across the room and lands in the corner. " CTHE ,TH-MALMSEY " streams
out of the butt and across the floor. Soon the keg is completely empty, and
there's wine all over the floor." CR>>

<ROUTINE RT-AC-TH-BUNG ()
     <DEBUGGING? <RT-DEBUG-TH-AC "TH-BUNG">>
     <COND (<MC-THIS-PRSI?>
	    <RFALSE>)
	   (<MC-THIS-PRSO?> 
	    <COND (<MC-VERB? TAKE PULL LOOSEN UNPLUG RELEASE>
		   <COND (<IN? ,TH-BUNG ,TH-BUTT-OF-MALMSEY>
			  <TELL "You can't. It's jammed in too tight." CR>)>)
		  (<MC-VERB? PUT>
		   <COND (<AND <MC-PRSI? ,TH-BUTT-OF-MALMSEY>
			       <FSET? ,GL-PRSI ,FL-BROKEN>>
			  <TELL "Don't you think it's pretty pointless to try to stopper up an empty keg?" CR>)>)
		  (<MC-VERB? HIT>
		   <COND (<IN? ,TH-BUNG ,TH-BUTT-OF-MALMSEY>
			  <COND (<MC-PRSI? ,TH-HANDS>
				 <TELL "Your hands aren't nearly strong enough
to remove the stopper by themselves." CR>)
				(<MC-PRSI? ,TH-MACE>
				 <TELL CTHE ,TH-BUNG>
				 <RT-EMPTY-BUTT-MSG>)>)>)
		  (<MC-VERB? SHOOT>
		   <COND (<IN? ,TH-BUNG ,TH-BUTT-OF-MALMSEY>
			  <TELL ,K-BULLET-MSG>
			  <RT-EMPTY-BUTT-MSG>)>)>)>>

<ROUTINE RT-AC-TH-GARNET ("OPT" (CONTEXT <>))
  <COND (<==? <GETP ,TH-GARNET ,P?OBJ-NOUN> ,W?SCRATCH>
	 <RT-HANDLE-SCRATCH ,TH-GARNET .CONTEXT>)
	(T
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<TELL "garnet">
		<RTRUE>)
	       (<==? .CONTEXT ,K-M-DESCFCN>
		<RT-EXAMINE-GEM ,TH-GARNET>
		<RTRUE>)
	       (<T? .CONTEXT> <RFALSE>)
	       (<MC-THIS-PRSI?>
		<RFALSE>)
	       (<MC-THIS-PRSO?>
		<COND (<RT-EXAMINE-GEM ,TH-GARNET>
		       <RTRUE>)
		      (<MC-VERB? TAKE>
		       <COND (<IN? ,TH-GARNET ,TH-BUTT-OF-MALMSEY>
			      <TELL
"You can't. Your shoulders are too broad, and your arms are too short
for you to reach to the bottom of the butt." CR>)>)>)>)>>

<ROUTINE RT-AC-TH-MACE ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-TH-AC "TH-MACE">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"It's a huge, medieval mace that some medieval knight probably used for
knocking other knights off horses." CR>
	       <RTRUE>)
	      (<MC-THIS-PRSI?>
	       <COND (<MC-PRSO? CH-WIGGINS>
		      <COND (<FSET? ,GL-PRSO ,FL-ASLEEP>
			     <TELL "If he could, Wiggins
would dance nimbly out of harm's way and cry \"'Ere! Steady on, mate!\"
Assault and battery on your friends is probably not the way to go." CR>
			     <RTRUE>)>
		      <TELL
"Wiggins dances nimbly out of harm's way and cries, \"'Ere! Steady on,
mate!\"" CR>)
		     (<AND <MC-PRSO? ,TH-SUIT-OF-ARMOUR>
			   <MC-ISNOT? ,TH-SUIT-OF-ARMOUR ,FL-WORN>>
		      <TELL
"Did you really think beating up on an empty suit of armour was going to
get you anywhere?" CR>)>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? SHOOT>
		      <TELL ,K-RICOCHET-MSG CR>)>)>>

<ROUTINE RT-AC-TH-PORTCULLIS-CHAIN ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-TH-AC "TH-PORTCULLIS-CHAIN">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The chain is hanging just within reach." CR>)
	      (<MC-THIS-PRSI?>
	       <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? PULL LOWER LOOSEN PUSH-TO>
		      <COND (<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
			     <TELL "The gate is already up." CR>)
			    (T
			     <COND (<MC-ISNOT? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
				    <TELL
"You pull on the chain but the portcullis doesn't budge." CR>)
				   (T
				    <MC-MAKE ,LG-PORTCULLIS-DOOR ,FL-OPENED>
				    <MC-MAKE ,LG-PORTCULLIS-DOOR ,FL-LOCKED>
				    <IFSOUND <SOUNDS ,S-ARMOR>>
				    <TELL
"You grab the chain and lift your feet off the ground. The portcullis'
ancient mechanism creaks, but then it rises up and locks into place. When
you release the chain, the massive gate remains open." CR>
				    <RT-UPDATE-SCORE 1>
				    <RTRUE>)>)>)
		     (<MC-VERB? SHOOT>
		      <TELL ,K-RICOCHET-MSG CR>)>)>>

<ROUTINE RT-AC-TH-SUIT-OF-ARMOUR ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-TH-AC "TH-SUIT-OF-ARMOUR">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"The suit of armour was made for Henry VIII." CR>)
	      (<MC-THIS-PRSI?>
	       <COND (<MC-VERB? PUT>
		      <TELL "That would">
		      <RT-WASTE-OF-TIME-MSG>)
		     (<AND <MC-VERB? TAKE>
			   <MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>>
		      <RT-CYOU-MSG>
		      <RT-WOULD-HAVE-TO-MSG "take off" ,TH-SUIT-OF-ARMOUR>
		      <TELL " first." CR>)>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? TAKE>
		      <COND (<EQUAL? ,GL-WINNER ,CH-WIGGINS>
			     <TELL "\"">)>
		      <TELL "Ooof! It's too heavy to carry.">
		      <COND (<EQUAL? ,GL-WINNER ,CH-WIGGINS>
			     <TELL "\"">)>
		      <CRLF>
		      <RTRUE>)
		     (<MC-VERB? WEAR>
		      <COND (<MC-ISNOT? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
			     <MOVE ,TH-SUIT-OF-ARMOUR ,CH-PLAYER>
			     <MC-MAKE ,TH-SUIT-OF-ARMOUR ,FL-WORN>
			     <IFSOUND <SOUNDS ,S-ARMOR>>
			     <TELL "You put on the suit of armour." CR>)
			    (T
			     <TELL "You're already wearing it." CR>)>)
		     (<MC-VERB? TAKE-OFF EXIT>
		      <COND (<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
			     <MOVE ,TH-SUIT-OF-ARMOUR ,GL-PLACE-CUR>
			     <MC-UNMAKE ,TH-SUIT-OF-ARMOUR ,FL-WORN>
			     <IFSOUND <SOUNDS ,S-ARMOR>>
			     <TELL "You take off the suit of armour and leave it ">
			     <COND (<MC-HERE? ,RM-THAMES-ONE ,RM-THAMES-TWO
					      ,RM-THAMES-THREE ,RM-THAMES-FOUR
					      ,RM-THAMES-FIVE>
				    <MOVE ,TH-SUIT-OF-ARMOUR ,TH-BOAT>
				    <TELL "in the boat">)
				   (T
				    <TELL "on ">
				    <COND (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
				           <TELL-THE-FLOOR>)
				          (T
				           <TELL-THE-GROUND>)>)>
			     <TELL "." CR>)
			    (<EQUAL? ,GL-P-PRSA-WORD ,W?LEAVE>
			     <RFALSE>)
			    (T
			     <TELL "You're not wearing it." CR>)>)
		     (<MC-VERB? SHOOT>
		      <TELL ,K-RICOCHET-MSG CR>)>)>>

<OBJECT LG-PORTCULLIS-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "portcullis")
   (FLAGS FL-DOOR FL-OPENABLE FL-TRANSPARENT)
   (SYNONYM DOOR PORTCULLIS)
   (ADJECTIVE IRON GATE TRAITOR\'S)
   (VALUE 5)
   (ACTION RT-AC-LG-PORTCULLIS-DOOR)>

<ROUTINE RT-AC-LG-PORTCULLIS-DOOR ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-PORTCULLIS-DOOR">>
	<COND (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? RAISE OPEN LOOSEN>
		      <COND (<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
			     <TELL "The gate is already up." CR>)
			    (T
			     <TELL "Oomph. The portcullis is too heavy to lift." CR>)>)
		     (<MC-VERB? LOOK-INSIDE SEARCH>
		      <TELL "You look through the gate." CR>
		      <COND ;(<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
			     <TELL "You can't do that, the gate is up." CR>)
			    (<EQUAL? ,GL-PLACE-CUR ,RM-INSIDE-TRAITORS-GATE>
			     <RT-DESCRIBE-PLACE-CONTENTS ,RM-OUTSIDE-TRAITORS-GATE>)
			    (<EQUAL? ,GL-PLACE-CUR ,RM-OUTSIDE-TRAITORS-GATE>
			     <RT-DESCRIBE-PLACE-CONTENTS ,RM-INSIDE-TRAITORS-GATE>)>)
		     (<MC-VERB? ENTER THROUGH>
		      <COND (<MC-HERE? ,RM-INSIDE-TRAITORS-GATE>
			     <RT-DO-WALK ,P?SOUTH>)
			    (<MC-HERE? ,RM-OUTSIDE-TRAITORS-GATE>
			     <RT-DO-WALK ,P?NORTH>)>)
		     (<MC-VERB? CLOSE LOWER>
		      <COND (<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
			     <TELL "It's jammed open." CR>)>)
		     (<MC-VERB? SHOOT>
		      <TELL ,K-RICOCHET-MSG CR>)
		     (<MC-VERB? REACH-IN>
		      <COND (<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
			     <TELL "Why don't you just walk through the gate? "
CTHE ,LG-PORTCULLIS-DOOR " is open." CR>)
			    (T
			     <RT-CYOU-MSG "reach" "reaches">
			     <TELL "through " THEO
", but can't touch anything on the other side." CR>)>)>)
	      (<MC-THIS-PRSI?>
	       <COND (<AND <MC-VERB? THROW>
			   <MC-VERB-WORD? PUT>
			   <MC-PRSO? ,TH-HANDS ,TH-FEET>>
		      <COND (<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
			     <TELL "Why don't you just walk through the gate? "
CTHE ,LG-PORTCULLIS-DOOR " is open." CR>)
			    (T
			     <RT-CYOU-MSG "put" "puts">
			     <TELL THEO " through " THEI
", but can't reach anything on the other side." CR>)>)
		     (<MC-VERB? THROW PUT>
		      <COND (<MC-IS? ,LG-PORTCULLIS-DOOR ,FL-OPENED>
			     <TELL "Why bother? " CTHE ,LG-PORTCULLIS-DOOR " is open." CR>)>)>)>>


