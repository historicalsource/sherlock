;******************************************************************************
; "game : SHERLOCK!"
; "file : LOCALS.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   26 Oct 1987  7:15:02  $"
; "rev  : $Revision:   1.51  $"
; "vers : 1.00"
;******************************************************************************

<OBJECT LG-BAKER-ST-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "front door")
   (FLAGS FL-DOOR FL-OPENABLE FL-LOCKED)
   (SYNONYM DOOR)
   (ADJECTIVE FRONT HOLMES\' HOLMES\'S SHERLOCK)
   (GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-BAKER-ST-DOOR)>

<OBJECT LG-PARLOUR-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "parlour door")
   (FLAGS FL-DOOR FL-OPENABLE)
   (SYNONYM DOOR)
   (ADJECTIVE PARLOUR PARLOR)
   (GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-PARLOUR-DOOR)>

<OBJECT LG-HOLMES-STUDY-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "study door")
   (FLAGS FL-DOOR FL-OPENABLE FL-OPENED)
   (SYNONYM DOOR)
   (ADJECTIVE STUDY HOLMES\'S HOLMES\' SHERLOCK)
   (GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-HOLMES-STUDY-DOOR)>

<OBJECT LG-HOLMES-BEDROOM-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "bedroom door")
   (FLAGS FL-DOOR FL-OPENABLE FL-LOCKED)
   (SYNONYM DOOR)
   (ADJECTIVE BEDROOM HOLMES\'S HOLMES\' SHERLOCK)
   (GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-HOLMES-BEDROOM-DOOR)>

<OBJECT LG-BANK-VAULT-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "vault door")
   (FLAGS FL-DOOR FL-OPENABLE FL-LOCKED FL-HAS-DESCFCN)
   (SYNONYM DOOR)
   (ADJECTIVE VAULT)
   (VALUE 3)
   (GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-BANK-VAULT-DOOR)>

<OBJECT LG-BAR-OF-GOLD-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "door")
   (FLAGS FL-DOOR FL-OPENABLE FL-OPENED)
   (SYNONYM DOOR)
   (GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-BAR-OF-GOLD-DOOR)>

<OBJECT LG-LAIR-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "door")
   (FLAGS FL-DOOR FL-OPENABLE FL-LOCKED)
   (SYNONYM DOOR)
   (GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-LAIR-DOOR)>

<OBJECT LG-JERICHO-PARLOUR-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "door to the Jericho Parlour")
   (FLAGS FL-DOOR FL-OPENABLE)
   (SYNONYM DOOR)
   (ADJECTIVE JERICHO PARLOUR PARLOR)
   (GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-JERICHO-PARLOUR-DOOR)>

<OBJECT LG-BRITISH-MUSEUM-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "door")
   (FLAGS FL-DOOR FL-LOCKED FL-OPENABLE)
   (SYNONYM DOOR)
   (GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-BRITISH-MUSEUM-DOOR)>

<OBJECT LG-WESTMINSTER-DOOR
   (LOC LOCAL-GLOBALS)
   (DESC "Abbey door")
   (FLAGS FL-DOOR FL-LOCKED FL-OPENABLE)
   (SYNONYM DOOR)
   (GENERIC RT-GN-DOOR)
   (ACTION RT-AC-LG-WESTMINSTER-DOOR)>

<OBJECT LG-SHOPS
   (LOC LOCAL-GLOBALS)
   (DESC "shops")
   (FLAGS FL-PLURAL FL-HAS-DESCFCN)
   (SYNONYM SHOPS STORES EMPORIUMS WINDOWS WINDOW SHOP STORE)
   (ACTION RT-AC-LG-SHOPS)>

<OBJECT LG-WATER
   (LOC LOCAL-GLOBALS)
   (FLAGS FL-NODESC FL-CONTAINER FL-OPENED FL-SURFACE FL-HAS-SDESC
	  FL-NOARTC)
   (SYNONYM WATER RIVER THAMES)
   (SIZE 0 CAPACITY 100)
   (ACTION RT-AC-LG-WATER)>

<OBJECT LG-UP-DOWN-STREAM
   (LOC LOCAL-GLOBALS)
   (FLAGS FL-NODESC FL-HAS-SDESC FL-NEEDS-IDENTITY)
   (OBJ-NOUN 0)
   (OBJ-ADJ 0)
   (SYNONYM UPSTREAM DOWNSTREAM)
   (ACTION RT-AC-LG-UP-DOWN-STREAM)>

<OBJECT LG-PLAQUES
   (LOC LOCAL-GLOBALS)
   (DESC "sign")
   (FLAGS FL-TRYTAKE FL-NOALL FL-SURFACE FL-HAS-DESCFCN)
   (SYNONYM PLAQUE PLATE SIGN RELIEF)
   (SIZE 0 CAPACITY 999)
   (ACTION RT-AC-LG-PLAQUES)>

<OBJECT LG-WINDOW
   (LOC LOCAL-GLOBALS)
   (DESC "window")
   (FLAGS FL-TRYTAKE FL-NOALL FL-HAS-DESCFCN FL-OPENABLE FL-TRANSPARENT)
   (SYNONYM WINDOW)
   (ADJECTIVE BOW)
   (ACTION RT-AC-LG-WINDOW)>

<OBJECT LG-TOMBS-ABBEY
   (LOC LOCAL-GLOBALS)
   (FLAGS FL-TRYTAKE FL-PLURAL FL-NOALL FL-HAS-DESCFCN
	  FL-HAS-SDESC FL-NEEDS-IDENTITY)
   (OBJ-ADJ 0)
   (OBJ-NOUN 0)
   (ADJECTIVE WESTMINSTER)
   (SYNONYM TOMBS SCULPTURES STATUES TOMB ABBEY)
   (ACTION RT-AC-LG-TOMBS-ABBEY)>

<OBJECT LG-STREETLIGHT
   (LOC LOCAL-GLOBALS)
   (DESC "streetlight")
   (FLAGS FL-TRYTAKE FL-NOALL FL-TRANSPARENT)
   (SYNONYM LIGHT LAMP STREETLIGHT STREETLAMP STREET-LIGHT GASLIGHT GAS-LIGHT)
   (ADJECTIVE GAS)
   (ACTION RT-AC-LG-STREETLIGHT)>

<OBJECT LG-STAIRWAY
   (LOC LOCAL-GLOBALS)
   (DESC "stairway")
   (FLAGS FL-TRYTAKE FL-NOALL)
   (SYNONYM STAIRWAY STAIR STAIRS STEP STEPS)
   (ACTION RT-AC-LG-STAIRWAY)>

<OBJECT LG-SHAFT-OF-LIGHT
   (LOC LOCAL-GLOBALS)
   (DESC "shaft of light")
   (FLAGS FL-NODESC FL-HAS-DESCFCN)
   (SYNONYM SHAFT LIGHT SUNLIGHT)
   (ADJECTIVE SHAFT LIGHT SUNLIGHT)
   (ACTION RT-AC-LG-SHAFT-OF-LIGHT)>

<OBJECT LG-MARBLE
   (LOC LOCAL-GLOBALS)
   (DESC "marble")
   (FLAGS FL-NODESC)
   (SYNONYM MARBLE)>

<OBJECT LG-COLUMNS
   (LOC LOCAL-GLOBALS)
   (DESC "columns")
   (FLAGS FL-TRYTAKE FL-PLURAL FL-NOALL)
   (SYNONYM COLUMNS COLUMN)
   (ADJECTIVE PURBECK)>

<OBJECT LG-RAVENS
   (LOC LOCAL-GLOBALS)
   (DESC "ravens")
   (FLAGS FL-NODESC FL-PLURAL FL-ALIVE FL-TRYTAKE FL-HAS-DESCFCN)
   (SYNONYM RAVENS BIRDS ROOKS RAVEN ROOK BIRD)
   (ADJECTIVE FLOCK GROUP BUNCH GAGGLE)
   (SIZE 50 MASS 250)
   (ACTION RT-AC-LG-RAVENS)>

<OBJECT LG-BOATS
   (LOC LOCAL-GLOBALS)
   (DESC "boats")
   (FLAGS FL-NODESC FL-HAS-DESCFCN)
   (SYNONYM BOATS SHIPS)
   (ADJECTIVE PLEASURE)
   (ACTION RT-DF-LG-BOATS)>

<OBJECT LG-TOWER
   (LOC LOCAL-GLOBALS)
   (DESC "Tower")
   (SYNONYM TOWER LONDON)
   (ADJECTIVE TOWER LONDON)
   (GENERIC RT-GN-TOWER)
   (ACTION RT-AC-LG-TOWER)>

<ROUTINE RT-AC-LG-BAKER-ST-DOOR ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-BAKER-ST-DOOR">>
	<COND (<MC-VERB? KNOCK>
	       <COND (<MC-HERE? ,RM-ENTRY-HALL>
		      <TELL "You are already inside." CR>)
		     (<MC-IS? ,LG-BAKER-ST-DOOR ,FL-OPENED>
		      <TELL "The door is already open." CR>)
		     (<MC-IS? ,CH-HUDSON ,FL-ASLEEP>
		      <TELL "There is no answer." CR>)
		     (<MC-ISNOT? ,LG-BAKER-ST-DOOR ,FL-LOCKED>
		      <MC-MAKE ,LG-BAKER-ST-DOOR ,FL-OPENED>
		      <MOVE ,CH-HUDSON ,RM-ENTRY-HALL>
		      <RT-THIS-IS-IT ,CH-HUDSON>
		      <TELL
"Mrs Hudson appears and says, \"Please come in Dr Watson.\" She
steps back into the hall to allow room for you to pass." CR>)
		     (T
		      <MC-UNMAKE ,LG-BAKER-ST-DOOR ,FL-LOCKED>
		      <SETG GL-PLACE-CUR ,RM-ENTRY-HALL>
		      <MOVE ,CH-HUDSON ,GL-PLACE-CUR>
		      <MOVE ,CH-PLAYER ,GL-PLACE-CUR>
		      <RT-THIS-IS-IT ,CH-HUDSON>
		      <TELL
"You hear a bolt sliding back and the door opens to reveal a worried
Mrs Hudson." CR CR

"\"Oh Doctor Watson, I'm so glad to see you. It's Mr
Holmes, sir. Three days have come and gone since he's been out of his
rooms. He won't eat and I know he hasn't slept. Now there's a visitor
who says he's here about some important government business. I tried
to send him away, but he insisted on waiting in the parlour. That's
when I sent for you. Thank God you've come.\"" CR>
		      <RT-EXEC-RM-DESCFCN ,RM-ENTRY-HALL ,K-M-DESC-1>
		      <CRLF>)>)
	      (<MC-VERB? KICK HIT MUNG>
	       <COND (<MC-HERE? ,RM-ENTRY-HALL>
		      <RFALSE>)
		     (<MC-ISNOT? ,LG-BAKER-ST-DOOR ,FL-OPENED>
		      <TELL
"Mrs Hudson pokes her head out the door and says, \"I'm not opening the door
until you knock like a proper gentleman.\" She slams the door in your
face." CR>)>)
	      (<MC-VERB? ENTER THROUGH>
	       <COND (<MC-HERE? ,RM-221B-BAKER-ST>
		      <RT-DO-WALK ,P?WEST>)
		     (<MC-HERE? ,RM-ENTRY-HALL>
		      <RT-DO-WALK ,P?EAST>)>)>>

<ROUTINE RT-AC-LG-PARLOUR-DOOR ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-PARLOUR-DOOR">>
	<COND (<MC-VERB? OPEN>
	       <COND (<MC-IS? ,CH-HOLMES ,FL-ASLEEP>
		      <TELL CTHE ,CH-HUDSON ,K-HUDSON-WORRIED-MSG CR>)>)
	      (<MC-VERB? ENTER THROUGH>
	       <COND (<MC-HERE? ,RM-PARLOUR>
		      <RT-DO-WALK ,P?SOUTH>)
		     (<MC-HERE? ,RM-ENTRY-HALL>
		      <RT-DO-WALK ,P?NORTH>)>)>>

<ROUTINE RT-AC-LG-HOLMES-STUDY-DOOR ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-HOLMES-STUDY-DOOR">>
	<COND (<MC-VERB? ENTER THROUGH>
	       <COND (<MC-HERE? ,RM-VESTIBULE>
		      <RT-DO-WALK ,P?NORTH>)
		     (<MC-HERE? ,RM-HOLMES-STUDY>
		      <RT-DO-WALK ,P?SOUTH>)>)>>

<ROUTINE RT-AC-LG-HOLMES-BEDROOM-DOOR ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-HOLMES-BEDROOM-DOOR">>
	<COND (<MC-VERB? ENTER THROUGH>
	       <COND (<MC-HERE? ,RM-HOLMES-STUDY>
		      <RT-DO-WALK ,P?WEST>)
		     (<MC-HERE? ,RM-HOLMES-BEDROOM>
		      <RT-DO-WALK ,P?EAST>)>)>>

<ROUTINE RT-AC-LG-BAR-OF-GOLD-DOOR ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-BAR-OF-GOLD-DOOR">>
	<COND (<MC-VERB? ENTER THROUGH>
	       <COND (<MC-HERE? ,RM-BAR-OF-GOLD>
		      <RT-DO-WALK ,P?EAST>)
		     (<MC-HERE? ,RM-SWAN-LANE>
		      <RT-DO-WALK ,P?WEST>)>)>>

<ROUTINE RT-AC-LG-LAIR-DOOR ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-LAIR-DOOR">>
	<COND (<MC-THIS-PRSO?>
	       <COND (<AND <MC-VERB? ENTER THROUGH OPEN CLOSE UNLOCK LOCK>
			   <MC-ISNOT? ,CH-AKBAR ,FL-LOCKED>
			   <MC-ISNOT? ,CH-AKBAR ,FL-ASLEEP>>
		      <TELL "Akbar">
		      <COND (<MC-IS? ,TH-WATSONS-HAT ,FL-WORN>
			     <TELL " says, \"Forgive me, sir,\" and">)>
		      <TELL " stops you as you move toward the door." CR>)
		     (<AND <MC-VERB? OPEN>
			   <MC-IS? ,CH-HOLMES ,FL-LOCKED>>
		      <TELL
"Holmes calls out, \"Watson! I'm still tied up!\" You pause and look back,
torn by indecision." CR>)
		     (<MC-VERB? ENTER THROUGH>
		      <COND (<MC-HERE? ,RM-LAIR>
			     <RT-DO-WALK ,P?OUT>)>)
		     (<AND <MC-VERB? UNLOCK>
			   <MC-PRSI? ,TH-LAIR-KEY>
			   <MC-IS? ,LG-LAIR-DOOR ,FL-LOCKED>>
		      <MC-UNMAKE ,LG-LAIR-DOOR ,FL-LOCKED>
		      <RT-CYOU-MSG "unlock" "unlocks">
		      <TELL THE ,LG-LAIR-DOOR "." CR>)
		     (<AND <MC-VERB? LOCK>
			   <MC-PRSI? ,TH-LAIR-KEY>
			   <MC-ISNOT? ,LG-LAIR-DOOR ,FL-OPENED>
			   <MC-ISNOT? ,LG-LAIR-DOOR ,FL-LOCKED>>
		      <MC-MAKE ,LG-LAIR-DOOR ,FL-LOCKED>
		      <RT-CYOU-MSG "lock" "locks">
		      <TELL THE ,LG-LAIR-DOOR "." CR>)>)>>

<ROUTINE RT-AC-LG-JERICHO-PARLOUR-DOOR ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-JERICHO-PARLOUR-DOOR">>
	<COND (<MC-VERB? ENTER THROUGH>
	       <COND (<MC-HERE? ,RM-SOUTH-AISLE>
		      <RT-DO-WALK ,P?SOUTH>)
		     (<MC-HERE? ,RM-JERICHO-PARLOUR>
		      <RT-DO-WALK ,P?NORTH>)>)>>

<ROUTINE RT-AC-LG-SHOPS ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-SHOPS">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The shops are closed for the Jubilee." CR>)
	      (<MC-VERB? LOOK-INSIDE SEARCH>
	       <TELL "The shops are all closed for the Jubilee." CR>)>>

<ROUTINE RT-AC-LG-WATER ("OPT" (CONTEXT <>) (CLASS <>) (CAP? <>))
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-WATER">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "water" .CLASS
			    <COND (<==? .CLASS ,K-DESC-A> T)
				  (T <>)>
			    <>>
	       <RTRUE>)
	      (<T? .CONTEXT> <RFALSE>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? ENTER LEAP>
		      <COND (<EQUAL? ,GL-WINNER ,CH-PLAYER>
			     <TELL "You may not remember this, but you can't swim." CR>)
			    (T
			     <TELL "That's not very polite." CR>)>)
		     (<MC-VERB? DRINK>
		      <TELL ,K-YUCK-MSG CR>)
		     (<MC-VERB? EXAMINE>
		      <TELL "The water is black, oily, slimy, dirty, and
otherwise unwholesome-looking." CR>)
		     (<MC-VERB? LOOK-INSIDE SEARCH>
		      <TELL
"The water is so black and oily that you can't see a thing." CR>)
		     (<MC-VERB? REACH-IN SEARCH>
		      <TELL
"Slimy things brush up against your hand, so you quickly pull it back." CR>)
		     (<MC-VERB? SHOOT>
		      <RT-WASTE-OF-BULLETS-MSG>)>)
	      (<MC-THIS-PRSI?>
	       <COND (<MC-VERB? PUT PUT-ON>
		      <COND (<OR <MC-IS? ,GL-PRSO ,FL-BODYPART>
				 <MC-PRSO? ,CH-ME ,CH-PLAYER>>
			     <TELL ,K-YUCK-MSG CR>)
			    (T
			     <COND (<OR <MC-PRSO? ,TH-ANCHOR ,PSEUDO-OBJECT>
					<EQUAL? <LOC ,GL-PRSO>
						,GLOBAL-OBJECTS
						,LOCAL-GLOBALS>>
				    <RT-PERFORM ,V?DROP ,GL-PRSO>
				    <RTRUE>)
				   (<MC-PRSO? ,CH-TRAINED-PIGEON>
				    <REMOVE ,GL-PRSO>
				    <RT-KILL-PIGEON>
				    <TELL "The pigeon struggles briefly,
its feathers too wet to fly, then sinks below the water.">
				    <RTRUE>)
				   (T
				    <REMOVE ,GL-PRSO>
				    <FCLEAR ,GL-PRSO ,FL-WORN>
				    <TELL "Plop." CR>
				    <RTRUE>)>)>)>)>>

<ROUTINE RT-AC-LG-UP-DOWN-STREAM ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-UPSTREAM">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINTB <GETP ,LG-UP-DOWN-STREAM ,P?OBJ-NOUN>>)
	      (<MC-VERB? SHOOT>
	       <RT-IMPOSSIBLE-MSG>
	       <RTRUE>)>>

<ROUTINE RT-AC-LG-BRITISH-MUSEUM-DOOR ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-BRITISH-MUSEUM-DOOR">>
	<COND (<MC-VERB? ENTER THROUGH>
	       <COND (<MC-HERE? ,RM-GREAT-RUSSELL-ST>
		      <RT-DO-WALK ,P?NORTH>)
		     (<MC-HERE? ,RM-BRITISH-MUSEUM>
		      <RT-DO-WALK ,P?SOUTH>)>)>>

<ROUTINE RT-AC-LG-WESTMINSTER-DOOR ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-WESTMINSTER-DOOR">>
	<COND (<MC-VERB? ENTER THROUGH>
	       <COND (<MC-HERE? ,RM-BROAD-SANCTUARY>
		      <RT-DO-WALK ,P?EAST>)
		     (<MC-HERE? ,RM-NAVE>
		      <RT-DO-WALK ,P?WEST>)>)>>

<ROUTINE RT-AC-LG-PLAQUES ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-PLAQUES">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "It looks mighty like a plaque." CR>)
	      (<MC-VERB? TAKE>
	       <TELL "The plaque is firmly attached to the ">
	       <COND (<EQUAL? ,GL-PLACE-CUR ,RM-MANUSCRIPT-ROOM>
		      <TELL "desk">)
		     (T
		      <TELL "wall">)>
	       <TELL ". You can't remove it." CR>)
	      (<MC-VERB? READ EXAMINE>
	       <COND (<EQUAL? ,GL-PLACE-CUR ,RM-BROAD-SANCTUARY>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-ABBEY>>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-MANUSCRIPT-ROOM>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-QUIET>>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-MADAME-TUSSAUDS>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-HORRORS>>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-GREAT-RUSSELL-ST>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-MUSEUM>>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-MONUMENT>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-MONUMENT>>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-THE-BLACK-MUSEUM>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-BLIGH>>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-THREADNEEDLE-ST>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-BANK>>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-TOWER-ENTRANCE>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-TOWER>>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-TRAFALGAR-SQUARE>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-NELSON>>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-VICTORIA-STREET>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-LOITER>>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-SWAN-LANE>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-GOLDBAR>>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-JERUSALEM-CHAMBER>
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-HENRY>>)
		     ;(<EQUAL? ,GL-PLACE-CUR ,RM-BLIND-ALLEY>
		       <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-HERRING>>)
		     (T
		      <SETG GL-WINDOW <GET ,GL-QUOTES ,K-SIGN-BLANK>>)>
	       <RT-WINDOW ,GL-WINDOW>
	       <SETG GL-WINDOW <>>
	       <RTRUE>)
	      (<AND <MC-VERB? PUT PUT-ON>
		    <MC-THIS-PRSI?>>
	       <TELL "Putting anything on " THE ,LG-PLAQUES " would">
	       <RT-WASTE-OF-TIME-MSG>)>>

<ROUTINE RT-DF-LG-WAX-STATUES ("OPT" (CONTEXT <>) (CLASS <>))
	<DEBUGGING? <RT-DEBUG-LG-DF "LG-WAX-STATUES">>
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "statues" .CLASS <> T>
	       <RTRUE>)
	      (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<EQUAL? ,GL-PLACE-CUR ,RM-MADAME-TUSSAUDS>
		      <TELL "The statues are of King John, Sir Francis Drake,
Sir Walter Raleigh, and William the Conqueror." CR>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-CHAMBER-OF-HORRORS>
		      <TELL "The statues are of Guy Fawkes, Charles I, and
Saint Thomas Becket." CR>)>)>>

<ROUTINE RT-AC-LG-WINDOW ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-WINDOW">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <COND (<EQUAL? ,GL-PLACE-CUR ,RM-221B-BAKER-ST>
		      <TELL "It is a bow window, far above your head." CR>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-SOUTH-TRANSEPT>
		      <TELL "It is the largest rose window in all England">
		      <COND (<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			     <TELL ,K-BRIGHTENS-UP-MSG>)>
		      <TELL "." CR>)
		     (<EQUAL? ,GL-PLACE-CUR ,RM-NORTH-TRANSEPT>
		      <TELL "It is set high in the north wall of the Abbey">
		      <COND (<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			     <TELL ,K-BRIGHTENS-UP-MSG>)>
		      <TELL "." CR>)>)
	      (<AND <MC-VERB? SHOOT>
		    <MC-THIS-PRSO?>>
	       <RT-WASTE-OF-BULLETS-MSG>)
	      (<OR <IN? ,GL-WINNER ,RM-SOUTH-TRANSEPT>
		   <IN? ,GL-WINNER ,RM-NORTH-TRANSEPT>>
	       <COND (<MC-VERB? LOOK-INSIDE SEARCH LOOK-OUTSIDE>
		      <TELL "You cannot see through the stained-glass window." CR>)
		     (<RT-TOUCH-VERB?>
		      <TELL CTHE ,LG-WINDOW " is too high." CR>)>)
	      (<IN? ,GL-WINNER ,RM-221B-BAKER-ST>
	       <COND (<RT-TOUCH-VERB?>
		      <TELL CTHE ,LG-WINDOW " is too high." CR>)
		     (<MC-VERB? LOOK-INSIDE LOOK-OUTSIDE SEARCH>
		      <TELL CTHE ,LG-WINDOW " is too high to see in." CR>)>)
	      (<IN? ,GL-WINNER ,RM-HOLMES-STUDY>
	       <COND (<MC-VERB? LOOK-INSIDE LOOK-OUTSIDE SEARCH>
		      <TELL "You look down into Baker Street." CR>
		      <RT-DESCRIBE-PLACE-CONTENTS ,RM-221B-BAKER-ST>)
		     (<MC-VERB? MUNG>
		      <TELL CTHE ,LG-WINDOW
" is made of reinforced glass. It can't be broken." CR>)
		     (<MC-VERB? OPEN>
		      <TELL CTHE ,LG-WINDOW
" is jammed shut. It can't be opened." CR>)>)>>

<ROUTINE RT-AC-LG-TOMBS-ABBEY ("OPT" (CONTEXT <>))
  <COND (<==? <GETP ,LG-TOMBS-ABBEY ,P?OBJ-NOUN> ,W?ABBEY>
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<TELL "Abbey">)
	       (<T? .CONTEXT> <RFALSE>)
	       (<MC-VERB? ENTER>
		<COND (<MC-HERE? ,RM-NAVE>
		       <RT-ALREADY-IN-ROOM-MSG>)
		      (<MC-HERE? ,RM-BROAD-SANCTUARY>
		       <RT-DO-WALK ,P?EAST>)>)
	       (<MC-VERB? EXIT>
		<COND (<MC-HERE? ,RM-NAVE>
		       <RT-DO-WALK ,P?WEST>)
		      (T
		       <RT-NOT-IN-ROOM-MSG>)>)
	       (<MC-VERB? SHOOT>
		<RT-IMPOSSIBLE-MSG>)>)
	(T
	 <COND (<==? .CONTEXT ,K-M-SDESC>
		<TELL "tombs">)
	       (<OR <NOT <FSET? ,GL-PLACE-CUR ,FL-INDOORS>>
		    <EQUAL? ,GL-PLACE-CUR ,RM-JERICHO-PARLOUR
			    ,RM-JERUSALEM-CHAMBER
			    ,RM-NORTH-CLOISTER>>
		<RT-CANT-SEE-ANY-MSG ,LG-TOMBS-ABBEY>
		<RTRUE>)
	       (<==? .CONTEXT ,K-M-DESCFCN>
		<COND
		 (<EQUAL? ,GL-PLACE-CUR ,RM-SOUTH-AMBULATORY
			  ,RM-NORTH-AMBULATORY>
		  <TELL
"There are so many of them! None stands out in particular." CR>)
		 (<EQUAL? ,GL-PLACE-CUR ,RM-CONFESSOR-CHAPEL>
		  <TELL
"Two of them are especially interesting. One is the tomb of Edward
the Confessor. The other is of Henry V." CR>)
		 (T
		  <TELL "One tomb in particular catches your eye." CR>)>)
	       (<MC-THIS-PRSO?>
		<COND (<MC-VERB? SHOOT>
		       <RT-SHOOT-DEAD-MSG>)>)>)>>

<ROUTINE RT-AC-LG-STREETLIGHT ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-STREETLIGHT">>
	<COND (<RT-TOUCH-VERB?>
	       <TELL CTHE ,LG-STREETLIGHT " is too high." CR>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? SHOOT>
		      <RT-WASTE-OF-BULLETS-MSG>)>)>>

<ROUTINE RT-AC-LG-STAIRWAY ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-STAIRWAY">>
	<COND (<MC-VERB? CLIMB-UP>
	       <RT-DO-WALK ,P?UP>)
	      (<MC-VERB? CLIMB-DOWN>
	       <RT-DO-WALK ,P?DOWN>)>>

<ROUTINE RT-AC-LG-SHAFT-OF-LIGHT ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-SHAFT-OF-LIGHT">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"Well, it's not really a shaft of light. It's more like a diffused
murkiness. But any light that penetrates an English church from the outside
counts as a shaft." CR>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? SHOOT>
		      <RT-WASTE-OF-BULLETS-MSG>)>)
	      (<MC-THIS-PRSI?>
	       <COND (<MC-VERB? PUT>
		      <COND (<MC-PRSO? ,TH-MAGNIFYING-GLASS>
			     <COND (<EQUAL? <RT-WHO-SAYS?> ,CH-HOLMES>
				    <TELL
"\"Your Afghan experience is showing, Watson. The hot sun there would surely
produce rays capable, when focused, of producing a flame. Alas, our English
sun is too weak to produce such an effect.\"">)
				   (T
				    <TELL
"The rays from England's sun are too weak to focus.">)>
			     <CRLF>)
			    (<MC-PRSO? ,TH-GREEN-PAPER
				       ,TH-WHITE-PAPER
				       ,TH-BLUE-PAPER
				       ,TH-ORANGE-PAPER
				       ,TH-YELLOW-PAPER
				       ,TH-BROWN-PAPER>
			     <RFALSE>)
			    (T
			     <TELL "Putting " THEO " in " THEI>
			     <RT-WASTE-OF-TIME-MSG>)>)>)>>

<ROUTINE RT-AC-LG-RAVENS ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "LG-RAVENS" .CONTEXT>>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The ravens stare at you with baleful eyes." CR>)
	      (<MC-THIS-WINNER?>
	       <TELL CTHE ,LG-RAVENS " caw raucously in response." CR>)
	      (<MC-THIS-PRSO?>
	       <COND (<MC-VERB? TAKE>
		      <TELL CTHE ,LG-RAVENS " fly out of reach." CR>)
		     (<MC-VERB? SHOOT>
		      <RT-SHOOT-BIRDS ,LG-RAVENS "staring at you">
		      <RTRUE>)
		     (<MC-VERB? LISTEN>
		      <TELL "None of the ravens is quothing \"Nevermore.\"" CR>)>)>>

<ROUTINE RT-DF-LG-BOATS ("OPTIONAL" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-DF "LG-BOATS" .CONTEXT>>
	<COND (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)>
	<COND (<EQUAL? <RT-TIME-OF-DAY> 0>
	       <TELL CTHE ,LG-BOATS " are shrouded in fog." CR>
	       <RTRUE>)
	      (T
	       <TELL CTHE ,LG-BOATS " bob merrily on the river." CR>)>>

<ROUTINE RT-AC-LG-HOLMES-HOUSE ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-HOLMES-HOUSE">>
	<COND (<MC-VERB? ENTER>
	       <COND (<MC-HERE? ,RM-ENTRY-HALL ,RM-PARLOUR
				,RM-VESTIBULE ,RM-HOLMES-STUDY
				,RM-HOLMES-BEDROOM>
		      <RT-ALREADY-IN-ROOM-MSG>
		      <RTRUE>)
		     (<MC-HERE? ,RM-221B-BAKER-ST>
		      <RT-DO-WALK ,P?WEST>
		      <RTRUE>)>)
		(<MC-VERB? EXIT>
		 <COND (<MC-HERE? ,RM-ENTRY-HALL>
			<RT-DO-WALK ,P?EAST>
			<RTRUE>)
		       (<MC-HERE? ,RM-PARLOUR ,RM-VESTIBULE
				  ,RM-HOLMES-STUDY ,RM-HOLMES-BEDROOM>
			<TELL ,K-SPECIFY-DIR-MSG CR>
			<RTRUE>)
		       (T
			<RT-NOT-IN-ROOM-MSG>
			<RTRUE>)>)>>

<ROUTINE RT-AC-LG-PEDESTAL ("OPT" (CONTEXT <>) (CLASS <>))
	<COND (<==? .CONTEXT ,K-M-SDESC>
	       <PRINT-SDESC "pedestal" .CLASS <> <>>
	       <RTRUE>)
	      (<N==? .CONTEXT ,K-M-DESCFCN> <RFALSE>)
	      (<EQUAL? ,GL-PLACE-CUR ,RM-TRAFALGAR-SQUARE>
	       <TELL "On the pedestal you see a bronze relief." CR>)>>

<ROUTINE RT-AC-LG-TOWER ()
	<DEBUGGING? <RT-DEBUG-LG-AC "LG-TOWER">>
	<COND (<MC-VERB? ENTER>
	       <COND (<MC-HERE? ,RM-BYWARD-TOWER ,RM-BLOODY-TOWER
			        ,RM-WAKEFIELD-TOWER ,RM-JEWEL-ROOM
			        ,RM-DUNGEON ,RM-TORTURE-ROOM ,RM-WHITE-TOWER
 			        ,RM-BOWYER-TOWER>
		      <RT-ALREADY-IN-ROOM-MSG>)
		     (<MC-HERE? ,RM-OUTER-WARD ,RM-TOWER-GREEN>
		      <TELL ,K-SPECIFY-DIR-MSG CR>)
		     (<MC-HERE? ,RM-OUTSIDE-TRAITORS-GATE>
		      <RT-DO-WALK ,P?NORTH>)
		     (<MC-HERE? ,RM-DRAWBRIDGE ,RM-TOWER-ENTRANCE>
		      <RT-DO-WALK ,P?EAST>)>)
	      (<MC-VERB? EXIT>
	       <COND (<MC-HERE? ,RM-BLOODY-TOWER ,RM-WAKEFIELD-TOWER
			        ,RM-WHITE-TOWER ,RM-BOWYER-TOWER
			        ,RM-BYWARD-TOWER>
		      <RT-DO-WALK ,P?OUT>)
		     (<MC-HERE? ,RM-DUNGEON ,RM-TORTURE-ROOM>
		      <RT-DO-WALK ,P?UP>)
		     (<MC-HERE? ,RM-JEWEL-ROOM>
		      <RT-DO-WALK ,P?DOWN>)
		     (<MC-HERE? ,RM-INSIDE-TRAITORS-GATE>
		      <RT-DO-WALK ,P?SOUTH>)
		     (<MC-HERE? ,RM-OUTER-WARD RM-TOWER-GREEN>
		      <TELL ,K-SPECIFY-DIR-MSG CR>)
		     (T
		      <RT-NOT-IN-ROOM-MSG>)>)
	      (<MC-VERB? SHOOT>
	       <RT-IMPOSSIBLE-MSG>)>>


