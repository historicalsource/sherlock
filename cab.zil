;*****************************************************************************
; "game : SHERLOCK!"
; "file : CAB.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   28 Oct 1987  4:35:40  $"
; "rev  : $Revision:   1.63  $"
; "vers : 1.00"
;*****************************************************************************

<OBJECT CH-HANSOM-CABBIE
	(LOC TH-HANSOM-CAB)
	(DESC "hansom cabbie")
	(FLAGS FL-NODESC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM CABBIE DRIVER)
	(ADJECTIVE HANSOM)
	(SIZE 99)
	(ACTION RT-AC-CH-HANSOM-CABBIE)>

<OBJECT CH-GROWLER-CABBIE
	(LOC TH-GROWLER-CAB)
	(DESC "growler cabbie")
	(FLAGS FL-NODESC FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL)
	(SYNONYM CABBIE DRIVER ;FLOYD)
	(ADJECTIVE GROWLER)
	(SIZE 99)
	(ACTION RT-AC-CH-GROWLER-CABBIE)>

<ROUTINE RT-AC-CH-HANSOM-CABBIE ("OPTIONAL" (CONTEXT <>))
     <DEBUGGING? <RT-DEBUG-CH-AC "CH-HANSOM-CABBIE" .CONTEXT>>
     <COND (<MC-THIS-WINNER?>
	    <COND (<MC-VERB? WAIT>
		   <SETG GL-WHERE-TO-PROMPT? <>>
		   <SETG GL-WHERE-TO-ORPH? <>>
		   <TELL "\"Right-o.\"" CR>
		   <SETG TH-HANSOM-CAB-AUX2 1>
		   <RT-ALARM-CLR ,RT-I-HANSOM-LEAVE>
		   <RT-ALARM-SET-REL ,RT-I-HANSOM-LEAVE <RT-PARM-SET 0 30 0>>)
		  (<MC-VERB? DRIVE WALK-TO>
		   <RT-CF-TH-HANSOM-CAB>)
		  (<MC-VERB? HELLO GOODBYE THANK>
		   <SETG GL-WINNER ,CH-PLAYER>
		   <RT-PERFORM ,GL-PRSA ,CH-HANSOM-CABBIE>)
		  (T
		   <TELL "\"Sorry, guv. All I does is drives a cab.\"" CR>)>)
	   (<OR <AND <MC-VERB? PAY>
		     <MC-THIS-PRSO?>>
		<AND <MC-VERB? GIVE>
		     <MC-THIS-PRSI?>
		     <MC-IS? ,GL-PRSO ,FL-MONEY>>>
	    <TELL
"\"No thanks, guv'nor. It'll go on Mr 'Olmes's monthly account.\"" CR>)
	   (<AND <MC-VERB? TELL>
		 <MC-THIS-PRSO?>
		 ,GL-P-CONT>
	    <RFALSE>)
	   (<MC-VERB? HELLO>
	    <TELL "\"'Ello.\"" CR>)
	   (<MC-VERB? GOODBYE>
	    <TELL "\"Ta ta.\"" CR>)
	   (<MC-VERB? THANK>
	    <TELL "\"Anytime, mate.\"" CR>)
	   (<RT-TALK-VERB?>
	    <TELL "\"Sorry, sir. No time to chat.\"" CR>)>>

<ROUTINE RT-AC-CH-GROWLER-CABBIE ("OPTIONAL" (CONTEXT <>))
   <DEBUGGING? <RT-DEBUG-CH-AC "CH-GROWLER-CABBIE" .CONTEXT>>
   <COND (<MC-THIS-WINNER?>
	  <COND (<MC-VERB? WAIT>
		 <SETG GL-WHERE-TO-PROMPT? <>>
		 <SETG GL-WHERE-TO-ORPH? <>>
		 <TELL CTHE ,CH-GROWLER-CABBIE " says brightly, \"Okay.\"" CR>)
		(<MC-VERB? DRIVE WALK-TO>
		 <RT-CF-TH-GROWLER-CAB>)
		(T
		 <TELL CTHE ,CH-GROWLER-CABBIE " says brightly, \"Hello,\"
and looks at you expectantly." CR>)>)
	 (<OR <AND <MC-VERB? PAY>
		   <MC-THIS-PRSO?>>
	      <AND <MC-VERB? GIVE>
		   <MC-THIS-PRSI?>
		   <MC-IS? ,GL-PRSO ,FL-MONEY>>>
	  <TELL
CTHE ,CH-GROWLER-CABBIE " says brightly, \"No thanks. I'm not in it for the
money. I just like to meet new people.\"" CR>)
	 (<AND <MC-VERB? TELL>
	       <MC-THIS-PRSO?>
	       ,GL-P-CONT>
	  <RFALSE>)
	 (<RT-TALK-VERB?>
	  <TELL CTHE ,CH-GROWLER-CABBIE " says brightly, \"Hello,\" and looks
at you expectantly." CR>)>>

; "This was formerly contained in the AUX1 properties of the rooms in the
   table.  Since it's just the numbers from 1 to 37, we can play horrible
   games by subtracting the initial pointer and the INTBL? pointer instead.
   It's a byte table because we order objects ROOMS-FIRST"

<CONSTANT CAB-ROOM-IDS-LEN 37>

<CONSTANT CAB-ROOM-IDS
  <TABLE (PURE BYTE)
	 RM-221B-BAKER-ST ;1
	 RM-YORK-PLACE ;2
	 RM-MARYLEBONE-RD ;3
	 RM-TOTTENHAM-COURT-RD ;4
	 RM-ST-GILES-CIRCUS ;5
	 RM-OXFORD-ST ;6
	 RM-ORCHARD-ST ;7
	 RM-AUDLEY-ST ;8
	 RM-HYDE-PARK-CORNER ;9
	 RM-KENSINGTON-GARDENS ;10
	 RM-TRAFALGAR-SQUARE ;11
	 RM-GREAT-RUSSELL-ST ;12
	 RM-GROSVENOR-PLACE ;13
	 RM-VICTORIA-SQUARE ;14
	 RM-VICTORIA-STREET ;15
	 RM-BROAD-SANCTUARY ;16
	 RM-PARLIAMENT-SQUARE ;17
	 RM-BUCKINGHAM-PALACE-RD ;18
	 RM-QUEENS-GARDENS ;19
	 RM-BIRDCAGE-WALK ;20
	 RM-THE-MALL ;21
	 RM-WHITEHALL ;22
	 RM-NEW-OXFORD-ST ;23
	 RM-COVENT-GARDEN ;24
	 RM-THE-STRAND ;25
	 RM-FLEET-STREET ;26
	 RM-THE-EMBANKMENT ;27
	 RM-UPPER-THAMES-ST ;28
	 0;RM-BLIND-ALLEY ;29
	 RM-PINCHIN-LANE ;30
	 RM-CHEAPSIDE ;31
	 RM-THREADNEEDLE-ST ;32
	 RM-KING-WILLIAM-ST ;33
	 RM-MONUMENT ;34
	 RM-LOWER-THAMES-ST ;35
	 RM-LONDON-BRIDGE ;36
	 RM-TOWER-ENTRANCE ;37>>

<ROUTINE RT-GET-ROOM-ID (HERE "AUX" TBL)
  <COND (<SET TBL <INTBL? .HERE ,CAB-ROOM-IDS ,CAB-ROOM-IDS-LEN 1>>
	 <COND (<L? ,CAB-ROOM-IDS 0>
		<+ <- .TBL ,CAB-ROOM-IDS> 1>)
	       (T
		<+ <- ,CAB-ROOM-IDS .TBL> 1>)>)
	(T 0)>>

<ROUTINE RT-CAB-DIST (HERE THERE "AUX" NUM1 NUM2 (PTR 0) TMP)
	<SET NUM1 <RT-GET-ROOM-ID .HERE>>
	<SET NUM2 <RT-GET-ROOM-ID .THERE>>
	<COND ;(<OR <ZERO? .NUM1>
		    <ZERO? .NUM2>>
		<TELL "*** ERROR: Missing room number ***" CR D .HERE " to " D .THERE "." CR>
		<RETURN 0>)
	      (<OR <EQUAL? .HERE .THERE>
		   <EQUAL? .NUM1 .NUM2>>
	       <RETURN 0>)>
	<COND (<L? .NUM1 .NUM2>
	       <SET TMP .NUM1>
	       <SET NUM1 .NUM2>
	       <SET NUM2 .TMP>)>
	<SET NUM1 <- .NUM1 2>>
	<REPEAT ()
		<COND (<L? .NUM1 1>
		       <RETURN>)
		      (T
		       <SET PTR <+ .PTR .NUM1>>
		       <DEC NUM1>)>>
	<SET PTR <+ .PTR <- .NUM2 1>>>
	<RETURN <GETB ,GL-CAB-DIST-TBL .PTR>>>

<ROUTINE RT-I-CAB-ARRIVE ("AUX" (CAB <>) (PLACE <>) NUM SCORE AUX1)
       <SET NUM ,TH-CAB-WHISTLE-AUX1>
       <SET PLACE ,TH-CAB-WHISTLE-AUX2>
       <SETG TH-CAB-WHISTLE-AUX1 0>
       <SETG TH-CAB-WHISTLE-AUX2 0>
       <COND (<AND <MC-HERE? .PLACE>
		   <NOT <MC-VERB? WALK>>>
	      <COND (<EQUAL? .NUM 1>
		     <SET CAB ,TH-GROWLER-CAB>
		     <SET SCORE 0>
		     <RT-ALARM-SET-REL ,RT-I-GROWLER-LEAVE <RT-PARM-SET 0 5 0>>
		     <RT-REMOVE-ALL ,TH-GROWLER-CAB>
		     <MOVE ,CH-GROWLER-CABBIE ,TH-GROWLER-CAB>
		     <MC-MAKE ,CH-GROWLER-CABBIE ,FL-SEEN>
		     ;<IFSOUND <COND (<F? ,SOUND-QUEUED?>
			             <SETG CAB-RAMP 2>
			             <RT-S-CAB-ARRIVES>)>>)
		    (<EQUAL? .NUM 2>
		     <SET CAB ,TH-HANSOM-CAB>
		     <SET SCORE 5>
		     <RT-ALARM-SET-REL ,RT-I-HANSOM-LEAVE <RT-PARM-SET 0 5 0>>
		     <RT-REMOVE-ALL ,TH-HANSOM-CAB>
		     <MOVE ,CH-HANSOM-CABBIE ,TH-HANSOM-CAB>
		     <MC-MAKE ,CH-HANSOM-CABBIE ,FL-SEEN>)
		    (T
		     <RFALSE>)>
	      <IFSOUND <COND (<F? ,SOUND-QUEUED?>
			      <SETG CAB-RAMP 2>
			      <RT-S-CAB-ARRIVES>)>>
	      <TELL CR "A " D .CAB " pulls up beside you." CR>
	      <MOVE .CAB ,GL-PLACE-CUR>
	      <COND (<==? .CAB ,TH-HANSOM-CAB>
		     <SET AUX1 ,TH-HANSOM-CAB-AUX1>)
		    (T
		     <SET AUX1 ,TH-GROWLER-CAB-AUX1>)>
	      <COND (<ZERO? .AUX1>
		     <COND (<==? .CAB ,TH-HANSOM-CAB>
			    <SETG TH-HANSOM-CAB-AUX1 1>)
			   (T
			    <SETG TH-GROWLER-CAB-AUX1 1>)>
		     <COND (<NOT <ZERO? .SCORE>>
			    <RT-UPDATE-SCORE .SCORE>)>)>
	      <RTRUE>)>>

<ROUTINE RT-I-HANSOM-LEAVE ()
	<COND (<NOT <MC-HERE? ,RM-VICTORIA-SQUARE>>
	       <COND (<RT-VISIBLE? ,TH-HANSOM-CAB>
		      <IFSOUND <RT-S-CAB-LEAVES>>
		      <TELL CTHE ,TH-HANSOM-CAB " drives off." CR>)>
	       <MOVE ,TH-HANSOM-CAB ,RM-VICTORIA-SQUARE>
	       <RT-REMOVE-ALL ,TH-HANSOM-CAB>
	       <MOVE ,CH-HANSOM-CABBIE ,TH-HANSOM-CAB>
	       <SETG GL-NOW-LIT? <RT-IS-LIT?>>)>
	<SETG TH-HANSOM-CAB-AUX2 0>
	<RFALSE>>

<ROUTINE RT-I-HANSOM-TO? ()
	<COND (<IN? ,CH-PLAYER ,TH-HANSOM-CAB>
	       <TELL "\"Where to mister?\"" CR>
	       <RT-ALARM-SET-REL ,RT-I-HANSOM-TO? <RT-PARM-SET 0 1 0>>)>>

<ROUTINE RT-I-GROWLER-LEAVE ()
	<COND (<NOT <MC-HERE? ,RM-OXFORD-ST>>
	       <COND (<RT-VISIBLE? ,TH-GROWLER-CAB>
		      <IFSOUND <RT-S-CAB-LEAVES>>
		      <TELL CTHE ,TH-GROWLER-CAB " drives off." CR>)>
	       <MOVE ,TH-GROWLER-CAB ,RM-OXFORD-ST>
	       <RT-REMOVE-ALL ,TH-GROWLER-CAB>
	       <MOVE ,CH-GROWLER-CABBIE ,TH-GROWLER-CAB>
	       <SETG GL-NOW-LIT? <RT-IS-LIT?>>)>
	<RFALSE>>

<ROUTINE RT-I-GROWLER-TO? ()
	<COND (<IN? ,CH-PLAYER ,TH-GROWLER-CAB>
	       <TELL CR
"Suddenly the cabbie - who seems to have a low threshold of boredom - pipes
up and says, \"I know where we can go!\"" CR CR ,K-WILD-RIDE-MSG CR>
	       <RT-MOVE-GROWLER>
	       <RT-ALARM-SET-REL ,RT-I-GROWLER-TO? <RT-PARM-SET 0 5 0>>
	       <CRLF>
	       <RT-DESC-ALL>)>>

<ROUTINE RT-MOVE-HANSOM ("OPTIONAL" (ROOM <>) MIN)
    <COND (<MC-HERE? .ROOM>
	   <TELL "\"We're already here, guv.\"" CR>)
	  (<MC-T? .ROOM>
	   <SETG GL-WHERE-TO-PROMPT? <>>
	   <SETG GL-WHERE-TO-ORPH? <>>
	   <SET MIN <* <RT-CAB-DIST ,GL-PLACE-CUR .ROOM> ,K-HANSOM-TIME>>
	   <TELL "\"Right-o.\"" CR CR>
	   <MOVE ,TH-HANSOM-CAB .ROOM>
	   <SETG GL-PLACE-PRV ,GL-PLACE-CUR>
	   <SETG GL-PLACE-CUR .ROOM>
	   <COND (<IN? ,CH-PLAYER ,TH-HANSOM-CAB>
		  <SETG GL-PUPPY-MSG? <>>
		  <IFSOUND <COND (<==? .ROOM ,RM-COVENT-GARDEN>
				  <SETG LOOPING? ,S-CROWD>
				  <SETG LOOP-VOL 8>)
				 (T 
				  <SETG LOOPING? <>>)>
			   <SOUNDS ,S-HORSE ,S-START 4 6>>
		  <TELL "The cab speeds through the streets, ">
		  <COND (<EQUAL? <RT-TIME-OF-DAY> 1 2 3>
			 <TELL "deftly weaving in and out of the
jubilee traffic and ">)>
		  <TELL "whizzing past famous landmarks. Only a few minutes
later, you arrive at your destination." CR CR>
		  <RT-DESC-ALL>)
		 (T
		  <IFSOUND <RT-S-CAB-LEAVES>>
		  <TELL "The cab drives off." CR>
		  <SETG GL-NOW-LIT? <RT-IS-LIT?>>
		  <RT-ALARM-SET-REL ,RT-I-HANSOM-LEAVE <RT-PARM-SET 0 30 0>>)>
	   <RT-ALARM-CLR ,RT-I-HANSOM-LEAVE>
	   <RT-CLOCK-JMP 0 .MIN 0>
	   <RTRUE>)>>

<ROUTINE RT-MOVE-GROWLER ("AUX" ROOM NUM MIN)
	<SET NUM <RANDOM 37>>
	<COND (<EQUAL? .NUM 1>
	       <SET ROOM ,RM-AUDLEY-ST>)
	      (<EQUAL? .NUM 2>
	       <SET ROOM ,RM-221B-BAKER-ST>)
	      (<EQUAL? .NUM 3>
	       <SET ROOM ,RM-BIRDCAGE-WALK>)
	      ;(<EQUAL? .NUM 4>
	       <SET ROOM ,RM-BLIND-ALLEY>)
	      (<EQUAL? .NUM 5>
	       <SET ROOM ,RM-BROAD-SANCTUARY>)
	      (<EQUAL? .NUM 6>
	       <SET ROOM ,RM-BUCKINGHAM-PALACE-RD>)
	      (<EQUAL? .NUM 7>
	       <SET ROOM ,RM-CHEAPSIDE>)
	      (<EQUAL? .NUM 8>
	       <SET ROOM ,RM-COVENT-GARDEN>)
	      (<EQUAL? .NUM 9>
	       <SET ROOM ,RM-THE-EMBANKMENT>)
	      (<EQUAL? .NUM 10>
	       <SET ROOM ,RM-FLEET-STREET>)
	      (<EQUAL? .NUM 11>
	       <SET ROOM ,RM-GREAT-RUSSELL-ST>)
	      (<EQUAL? .NUM 12>
	       <SET ROOM ,RM-GROSVENOR-PLACE>)
	      (<EQUAL? .NUM 13>
	       <SET ROOM ,RM-HYDE-PARK-CORNER>)
	      (<EQUAL? .NUM 14>
	       <SET ROOM ,RM-KENSINGTON-GARDENS>)
	      (<EQUAL? .NUM 15>
	       <SET ROOM ,RM-KING-WILLIAM-ST>)
	      (<EQUAL? .NUM 16>
	       <SET ROOM ,RM-LONDON-BRIDGE>)
	      (<EQUAL? .NUM 17>
	       <SET ROOM ,RM-LOWER-THAMES-ST>)
	      (<EQUAL? .NUM 18>
	       <SET ROOM ,RM-THE-MALL>)
	      (<EQUAL? .NUM 19>
	       <SET ROOM ,RM-MARYLEBONE-RD>)
	      (<EQUAL? .NUM 20>
	       <SET ROOM ,RM-MONUMENT>)
	      (<EQUAL? .NUM 21>
	       <SET ROOM ,RM-NEW-OXFORD-ST>)
	      (<EQUAL? .NUM 22>
	       <SET ROOM ,RM-OXFORD-ST>)
	      (<EQUAL? .NUM 23>
	       <SET ROOM ,RM-ORCHARD-ST>)
	      (<EQUAL? .NUM 24>
	       <SET ROOM ,RM-PARLIAMENT-SQUARE>)
	      (<EQUAL? .NUM 25>
	       <SET ROOM ,RM-PINCHIN-LANE>)
	      (<EQUAL? .NUM 26>
	       <SET ROOM ,RM-QUEENS-GARDENS>)
	      (<EQUAL? .NUM 27>
	       <SET ROOM ,RM-ST-GILES-CIRCUS>)
	      (<EQUAL? .NUM 28>
	       <SET ROOM ,RM-THE-STRAND>)
	      (<EQUAL? .NUM 29>
	       <SET ROOM ,RM-THREADNEEDLE-ST>)
	      (<EQUAL? .NUM 30>
	       <SET ROOM ,RM-TOTTENHAM-COURT-RD>)
	      (<EQUAL? .NUM 31>
	       <SET ROOM ,RM-TOWER-ENTRANCE>)
	      (<EQUAL? .NUM 32>
	       <SET ROOM ,RM-TRAFALGAR-SQUARE>)
	      (<EQUAL? .NUM 33>
	       <SET ROOM ,RM-UPPER-THAMES-ST>)
	      (<EQUAL? .NUM 34>
	       <SET ROOM ,RM-VICTORIA-STREET>)
	      (<EQUAL? .NUM 35>
	       <SET ROOM ,RM-VICTORIA-SQUARE>)
	      (<EQUAL? .NUM 36>
	       <SET ROOM ,RM-WHITEHALL>)
	      (<EQUAL? .NUM 37>
	       <SET ROOM ,RM-YORK-PLACE>)
	      (T
	       <TELL "This is odd..." CR CR>
	       <SET ROOM ,RM-KENSINGTON-GARDENS>)>
	<SET MIN <* <RT-CAB-DIST ,GL-PLACE-CUR .ROOM> ,K-GROWLER-TIME>>
	<IFSOUND <COND (<==? .ROOM ,RM-COVENT-GARDEN>
			<SETG LOOPING? ,S-CROWD>
			<SETG LOOP-VOL 8>)
		       (T 
			<SETG LOOPING? <>>)>
		 <SOUNDS ,S-HORSE ,S-START 4 6>>
	<MOVE ,TH-GROWLER-CAB .ROOM>
	<SETG GL-PLACE-PRV ,GL-PLACE-CUR>
	<SETG GL-PLACE-CUR .ROOM>
	<SETG GL-PUPPY-MSG? <>>
	<RT-CLOCK-JMP 0 .MIN 0>>

<ROUTINE RT-CF-TH-HANSOM-CAB ("OPTIONAL" (CONTEXT <>) "AUX" WRD ADJ)
	<COND (<IN? ,CH-PLAYER ,TH-HANSOM-CAB>
	       <SETG GL-WHERE-TO-PROMPT? T>
	       <SETG GL-WHERE-TO-ORPH? T>)>
	<COND (<AND <MC-VERB? WALK>
		    <EQUAL? ,GL-P-WALK-DIR ,P?OUT>>
	       <RT-PERFORM ,V?EXIT ,TH-HANSOM-CAB>)
	      (<OR <AND <MC-VERB? WALK>
			<EQUAL? ,GL-WINNER ,CH-PLAYER>>
		   <AND <MC-VERB? ENTER>
			<NOT <MC-PRSO? ,TH-HANSOM-CAB>>>>
	       <RT-CYOU-MSG>
	       <RT-WOULD-HAVE-TO-MSG "get out of" ,TH-HANSOM-CAB>
	       <TELL " first." CR>
	       <RTRUE>)
	      (<MC-VERB? DRIVE WALK-TO>
	       <SET WRD <GET ,GL-P-NAMW 0>>
	       <SET ADJ <GET ,GL-P-ADJW 0>>
	       <COND (<MC-PRSO? ,RM-AUDLEY-ST>
		      <RT-MOVE-HANSOM ,RM-AUDLEY-ST>)
		     (<MC-PRSO? ,RM-221B-BAKER-ST ,RM-ENTRY-HALL>
		      <RT-MOVE-HANSOM ,RM-221B-BAKER-ST>)
		     (<MC-PRSO? ,RM-BIRDCAGE-WALK>
		      <RT-MOVE-HANSOM ,RM-BIRDCAGE-WALK>)
		     ;(<MC-PRSO? ,RM-BLIND-ALLEY ,RM-SIGN-OF-RED-HERRING>
		       <RT-MOVE-HANSOM ,RM-BLIND-ALLEY>)
		     (<MC-PRSO? ,RM-BROAD-SANCTUARY ,LG-TOMBS-ABBEY>
		      <RT-MOVE-HANSOM ,RM-BROAD-SANCTUARY>)
		     (<MC-PRSO? ,RM-BUCKINGHAM-PALACE-RD>
		      <RT-MOVE-HANSOM ,RM-BUCKINGHAM-PALACE-RD>)
		     (<MC-PRSO? ,RM-CHEAPSIDE>
		      <RT-MOVE-HANSOM ,RM-CHEAPSIDE>)
		     (<MC-PRSO? ,RM-COVENT-GARDEN>
		      <RT-MOVE-HANSOM ,RM-COVENT-GARDEN>)
		     (<MC-PRSO? ,RM-THE-EMBANKMENT ,LG-WATER>
		      <RT-MOVE-HANSOM ,RM-THE-EMBANKMENT>)
		     (<MC-PRSO? ,RM-FLEET-STREET>
		      <RT-MOVE-HANSOM ,RM-FLEET-STREET>)
		     (<MC-PRSO? ,RM-GREAT-RUSSELL-ST ,RM-BRITISH-MUSEUM>
		      <RT-MOVE-HANSOM ,RM-GREAT-RUSSELL-ST>)
		     (<MC-PRSO? ,RM-GROSVENOR-PLACE>
		      <RT-MOVE-HANSOM ,RM-GROSVENOR-PLACE>)
		     (<MC-PRSO? ,RM-HYDE-PARK-CORNER>
		      <RT-MOVE-HANSOM ,RM-HYDE-PARK-CORNER>)
		     (<MC-PRSO? ,RM-KENSINGTON-GARDENS>
		      <RT-MOVE-HANSOM ,RM-KENSINGTON-GARDENS>)
		     (<MC-PRSO? ,RM-KING-WILLIAM-ST>
		      <RT-MOVE-HANSOM ,RM-KING-WILLIAM-ST>)
		     (<MC-PRSO? ,RM-LONDON-BRIDGE>
		      <RT-MOVE-HANSOM ,RM-LONDON-BRIDGE>)
		     (<MC-PRSO? ,RM-LOWER-THAMES-ST ,RM-BAR-OF-GOLD
							 ,RM-SWAN-LANE>
		      <RT-MOVE-HANSOM ,RM-LOWER-THAMES-ST>)
		     (<MC-PRSO? ,RM-THE-MALL>
		      <RT-MOVE-HANSOM ,RM-THE-MALL>)
		     (<MC-PRSO? ,RM-MARYLEBONE-RD ,RM-MADAME-TUSSAUDS>
		      <RT-MOVE-HANSOM ,RM-MARYLEBONE-RD>)
		     (<OR <AND <EQUAL? .WRD ,W?MONUMENT>
			       <EQUAL? .ADJ <>>>
			  <MC-PRSO? ,RM-MONUMENT>>
		      <RT-MOVE-HANSOM ,RM-MONUMENT>)
		     (<MC-PRSO? ,RM-NEW-OXFORD-ST>
		      <RT-MOVE-HANSOM ,RM-NEW-OXFORD-ST>)
		     (<OR <AND <EQUAL? .WRD ,W?STREET ,W?ST>
			       <EQUAL? .ADJ ,W?OXFORD>>
			  <MC-PRSO? ,RM-OXFORD-ST>>
		      <RT-MOVE-HANSOM ,RM-OXFORD-ST>)
		     (<MC-PRSO? ,RM-ORCHARD-ST>
		      <RT-MOVE-HANSOM ,RM-ORCHARD-ST>)
		     (<MC-PRSO? ,RM-PARLIAMENT-SQUARE ,RM-PARLIAMENT ,TH-BELL>
		      <RT-MOVE-HANSOM ,RM-PARLIAMENT-SQUARE>)
		     (<MC-PRSO? ,RM-PINCHIN-LANE ,RM-SHERMANS-HOUSE>
		      <RT-MOVE-HANSOM ,RM-PINCHIN-LANE>)
		     (<MC-PRSO? ,RM-QUEENS-GARDENS ,RM-BUCKINGHAM-PALACE>
		      <RT-MOVE-HANSOM ,RM-QUEENS-GARDENS>)
		     (<MC-PRSO? ,RM-ST-GILES-CIRCUS>
		      <RT-MOVE-HANSOM ,RM-ST-GILES-CIRCUS>)
		     (<MC-PRSO? ,RM-THE-STRAND>
		      <RT-MOVE-HANSOM ,RM-THE-STRAND>)
		     (<MC-PRSO? ,RM-THREADNEEDLE-ST ,RM-BANK-OF-ENGLAND>
		      <RT-MOVE-HANSOM ,RM-THREADNEEDLE-ST>)
		     (<MC-PRSO? ,RM-TOTTENHAM-COURT-RD>
		      <RT-MOVE-HANSOM ,RM-TOTTENHAM-COURT-RD>)
		     (<OR <EQUAL? .WRD ,W?TOWER>
			  <MC-PRSO? ,RM-TOWER-ENTRANCE ,LG-TOWER
                                    ,RM-DRAWBRIDGE>>
		      <RT-MOVE-HANSOM ,RM-TOWER-ENTRANCE>)
		     (<MC-PRSO? ,RM-TRAFALGAR-SQUARE ,RM-DIOGENES-CLUB>
		      <RT-MOVE-HANSOM ,RM-TRAFALGAR-SQUARE>)
		     (<MC-PRSO? ,RM-UPPER-THAMES-ST>
		      <RT-MOVE-HANSOM ,RM-UPPER-THAMES-ST>)
		     (<MC-PRSO? ,RM-VICTORIA-STREET>
		      <RT-MOVE-HANSOM ,RM-VICTORIA-STREET>)
		     (<MC-PRSO? ,RM-VICTORIA-SQUARE>
		      <RT-MOVE-HANSOM ,RM-VICTORIA-SQUARE>)
		     (<MC-PRSO? ,RM-WHITEHALL ,RM-SCOTLAND-YARD>
		      <RT-MOVE-HANSOM ,RM-WHITEHALL>)
		     (<MC-PRSO? ,RM-YORK-PLACE>
		      <RT-MOVE-HANSOM ,RM-YORK-PLACE>)>)
	      (<MC-VERB? STAND STAND-ON LEAP>
	       <TELL ,K-ENOUGH-ROOM-MSG CR>
	       <RTRUE>)
	      (<MC-VERB? SIT>
	       <TELL "You're already seated." CR>
	       <RTRUE>)
	      (<RT-TOUCH-VERB?>
	       <COND (<MC-PRSO? <> ,ROOMS>
		      T)
		     (<IN? ,GL-PRSO ,GLOBAL-OBJECTS>
		      T)
		     (<NOT <RT-META-IN? ,GL-PRSO ,TH-HANSOM-CAB>>
		      <RT-CYOU-MSG>
		      <TELL "cannot reach " THEO "." CR>
		      <RTRUE>)>
	       <COND (<MC-PRSI? <> ,ROOMS>
		      <RFALSE>)
		     (<IN? ,GL-PRSI ,GLOBAL-OBJECTS>
		      <RFALSE>)
		     (<AND <FSET? ,GL-PRSI ,FL-PERSON>
			   <IN? ,GL-PRSI ,GL-PLACE-CUR>>
		      <RFALSE>)
		     (<NOT <RT-META-IN? ,GL-PRSI ,TH-HANSOM-CAB>>
		      <RT-CYOU-MSG>
		      <TELL "cannot reach " THEI "." CR>)>)>>

<ROUTINE RT-CF-TH-GROWLER-CAB ("OPTIONAL" (CONTEXT <>))
	<COND (<IN? ,CH-PLAYER ,TH-GROWLER-CAB>
	       <SETG GL-WHERE-TO-PROMPT? T>
	       <SETG GL-WHERE-TO-ORPH? T>)>
	<COND (<AND <MC-VERB? WALK>
		    <EQUAL? ,GL-P-WALK-DIR ,P?OUT>>
	       <RT-PERFORM ,V?EXIT ,TH-GROWLER-CAB>)
	      (<OR <AND <MC-VERB? WALK>
			<EQUAL? ,GL-WINNER ,CH-PLAYER>>
		   <AND <MC-VERB? ENTER>
			<NOT <MC-PRSO? ,TH-GROWLER-CAB>>>>
	       <RT-CYOU-MSG>
	       <RT-WOULD-HAVE-TO-MSG "get out of" ,TH-GROWLER-CAB>
	       <TELL " first." CR>
	       <RTRUE>)
	      (<MC-VERB? DRIVE WALK-TO>
	       <TELL "\"Oh good! I've never been THERE before.\"" CR CR>
	       <SETG GL-WHERE-TO-PROMPT? <>>
	       <SETG GL-WHERE-TO-ORPH? <>>
	       <RT-ALARM-CLR ,RT-I-GROWLER-TO?>
	       <RT-ALARM-CLR ,RT-I-GROWLER-LEAVE>
	       <RT-MOVE-GROWLER>
	       <COND (<IN? ,CH-PLAYER ,TH-GROWLER-CAB>
		      <SETG GL-PUPPY-MSG? <>>
		      <TELL ,K-WILD-RIDE-MSG CR CR>
		      <RT-ALARM-SET-REL ,RT-I-GROWLER-TO? <RT-PARM-SET 0 5 0>>
		      <RT-DESC-ALL>)
		     (T
		      <TELL "The cab drives off." CR>
		      <SETG GL-NOW-LIT? <RT-IS-LIT?>>
		      <RT-ALARM-SET-REL ,RT-I-GROWLER-LEAVE <RT-PARM-SET 0 30 0>>)>
	       <RTRUE>)
	      (<MC-VERB? STAND STAND-ON LEAP>
	       <TELL ,K-ENOUGH-ROOM-MSG CR>
	       <RTRUE>)
	      (<MC-VERB? SIT>
	       <TELL "You're already seated." CR>
	       <RTRUE>)
	      (<RT-TOUCH-VERB?>
	       <COND (<MC-PRSO? <> ,ROOMS> T)
		     (<IN? ,GL-PRSO ,GLOBAL-OBJECTS> T)
		     (<NOT <RT-META-IN? ,GL-PRSO ,TH-GROWLER-CAB>>
		      <RT-CYOU-MSG>
		      <TELL "cannot reach " THEO "." CR>
		      <RTRUE>)>
	       <COND (<MC-PRSI? <> ,ROOMS>
		      <RFALSE>)
		     (<IN? ,GL-PRSI ,GLOBAL-OBJECTS>
		      <RFALSE>)
		     (<NOT <RT-META-IN? ,GL-PRSI ,TH-GROWLER-CAB>>
		      <RT-CYOU-MSG>
		      <TELL "cannot reach " THEI "." CR>)>)>>

<ROUTINE RT-BLOW-WHISTLE ("AUX" WHO WHO2 L)
    <COND (<MC-HERE? <LOC ,TH-HANSOM-CAB> <LOC ,TH-GROWLER-CAB>>
	   <TELL ,K-CAB-HERE-MSG CR>
	   <RTRUE>)
	  (T
	   ;<IFSOUND <SOUNDS ,S-WHISTLE ,S-START 8 1
			      <COND (,TH-CAB-WHISTLE-AUX1
				     <RT-S-WHISTLE-TWICE>)
				    (T CHECK-LOOPING)>>>
	   <TELL "Tweeeeeeeeee!" CR>)>
    <COND (<MC-IS? ,GL-PLACE-CUR ,FL-INDOORS>
	   <COND (<AND <MC-HERE? ,RM-HOLMES-STUDY>
		       <MC-IS? ,CH-HOLMES ,FL-ASLEEP>>
		  <TELL ,K-HOLMES-DISTRACTION-MSG CR>
		  <RTRUE>)>
	   <SET WHO <RT-ANYONE-HERE?>>
	   <COND (<MC-T? .WHO>
		  <SET L <LOC .WHO>>
		  <REMOVE .WHO>
		  <SET WHO2 <RT-ANYONE-HERE?>>
		  <COND (;AND .WHO2 ;<MC-ISNOT? .WHO2 ,FL-ASLEEP> ;"RFP"
			 <TELL "Everyone holds their hands to their ">)
			(T
			 <TELL CTHE .WHO " hold">
			 <RT-S-NOS-MSG .WHO>
			 <TELL " ">
			 <RT-YOUR-MSG .WHO>
			 <TELL "hands to ">
			 <RT-YOUR-MSG .WHO>)>
		  <MOVE .WHO .L>
		  <TELL "ears and glare">
		  <RT-S-NOS-MSG .WHO>
		  <TELL " at you." CR>)>)
	  (<NOT <MC-HERE? ,RM-TOWER-GREEN ,RM-OUTER-WARD
			  ,RM-BYWARD-TOWER ,RM-INSIDE-TRAITORS-GATE
			  ,RM-OUTSIDE-TRAITORS-GATE ,RM-DRAWBRIDGE
			  ,RM-THAMES-ONE ,RM-THAMES-TWO
			  ,RM-THAMES-THREE ,RM-THAMES-FOUR
			  ,RM-THAMES-FIVE ,RM-SWAN-LANE>>
	   <SETG TH-CAB-WHISTLE-AUX1 <+ ,TH-CAB-WHISTLE-AUX1 1>>
	   <SETG TH-CAB-WHISTLE-AUX2 ,GL-PLACE-CUR>
	   <COND (<NOT <RT-ALARM-SET? ,RT-I-CAB-ARRIVE>>
		  <RT-ALARM-SET-REL ,RT-I-CAB-ARRIVE <RT-PARM-SET 0 1 0>>)>)>
    <RTRUE>>

<OBJECT TH-HANSOM-CAB
   (LOC RM-VICTORIA-SQUARE)
   (DESC "hansom cab")
   (FLAGS FL-VEHICLE FL-CONTAINER FL-TRYTAKE FL-OPENED FL-LIGHTED
	  FL-HAS-DESCFCN)
   (SYNONYM CAB)
   (ADJECTIVE HANSOM)
   (SIZE 0 CAPACITY 999)
   (ACTION RT-AC-TH-HANSOM-CAB)
   (CONTFCN RT-CF-TH-HANSOM-CAB)>

<OBJECT TH-GROWLER-CAB
   (LOC RM-OXFORD-ST)
   (DESC "growler cab")
   (FLAGS FL-VEHICLE FL-CONTAINER FL-TRYTAKE FL-OPENED FL-LIGHTED
	  FL-HAS-DESCFCN)
   (SYNONYM CAB)
   (ADJECTIVE GROWLER)
   (SIZE 0 CAPACITY 999)
   (ACTION RT-AC-TH-GROWLER-CAB)
   (CONTFCN RT-CF-TH-GROWLER-CAB)>

<OBJECT TH-CAB-WHISTLE
   (LOC CH-PLAYER)
   (DESC "whistle")
   (FLAGS FL-TAKEABLE FL-CLOTHING FL-WORN)
   (SYNONYM WHISTLE)
   (SIZE 1 MASS 1)
   (ACTION RT-AC-TH-CAB-WHISTLE)>

<ROUTINE RT-AC-TH-HANSOM-CAB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-HANSOM-CAB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"It is a small cab with two wheels and room for only two persons,
drawn by a single horse." CR>
	       <RTRUE>)
	      (<AND <MC-VERB? ENTER>
		    <MC-PRSO? ,ROOMS ,TH-HANSOM-CAB>>
	       <COND (<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
		      <TELL ,K-HEAVY-ARMOUR-MSG CR>)
		     (<NOT <IN? ,GL-WINNER ,TH-HANSOM-CAB>>
		      <MOVE ,GL-WINNER ,TH-HANSOM-CAB>
		      <COND (<AND <MC-T? ,GL-PUPPY>
				  <EQUAL? ,GL-WINNER ,CH-PLAYER>>
			     <MOVE ,GL-PUPPY ,TH-HANSOM-CAB>
			     <TELL "You and " THE ,GL-PUPPY " get ">)
			    (T
			     <RT-CYOU-MSG "get" "gets">)>
		      <MC-MAKE ,TH-HANSOM-CAB ,FL-NODESC>
		      <RT-ALARM-CLR ,RT-I-HANSOM-LEAVE>
		      <SETG TH-HANSOM-CAB-AUX2 0>
		      ;<RT-ALARM-SET-REL ,RT-I-HANSOM-TO? <RT-PARM-SET 0 5 0>>
		      <SETG GL-WHERE-TO-PROMPT? T>
		      <SETG GL-WHERE-TO-ORPH? T>
		      <TELL "into the cab." CR>)>)
	      (<AND <MC-VERB? EXIT>
		    <MC-PRSO? ,ROOMS ,TH-HANSOM-CAB>>
	       <COND (<IN? ,CH-PLAYER ,TH-HANSOM-CAB>
		      <MOVE ,GL-WINNER ,GL-PLACE-CUR>
		      <COND (<AND <MC-T? ,GL-PUPPY>
				  <EQUAL? ,GL-WINNER ,CH-PLAYER>>
			     <MOVE ,GL-PUPPY ,GL-PLACE-CUR>
			     <TELL "You and " THE ,GL-PUPPY " get ">)
			    (T
			     <RT-CYOU-MSG "get" "gets">)>
		      <TELL "out of the cab.">
		      <MC-UNMAKE ,TH-HANSOM-CAB ,FL-NODESC>
		      <COND (<AND <ZERO? ,TH-HANSOM-CAB-AUX2>
				  <NOT <IN? ,CH-PLAYER ,TH-HANSOM-CAB>>
				  <OR <MC-F? ,GL-PUPPY>
				      <NOT <IN? ,GL-PUPPY ,TH-HANSOM-CAB>>>
				  <NOT <MC-HERE? ,RM-VICTORIA-SQUARE>>>
			     <TELL " After">
			     <RT-YOU-MSG "get" "gets">
			     <TELL "out, it drives off.">
			     <IFSOUND <RT-S-CAB-LEAVES>>
			     <MOVE ,TH-HANSOM-CAB ,RM-VICTORIA-SQUARE>
			     <RT-REMOVE-ALL ,TH-HANSOM-CAB>
			     <MOVE ,CH-HANSOM-CABBIE ,TH-HANSOM-CAB>
			     <RT-ALARM-CLR ,RT-I-HANSOM-LEAVE>
			     ;<RT-ALARM-CLR ,RT-I-HANSOM-TO?>
			     <SETG GL-NOW-LIT? <RT-IS-LIT?>>)>
		      <SETG GL-WHERE-TO-PROMPT? <>>
		      <SETG GL-WHERE-TO-ORPH? <>>
		      <CRLF>)>)
	      (<MC-VERB? LOOK-ON>
	       <TELL "There is a cab driver sitting on the hansom." CR>)
	      (<AND <MC-VERB? TAKE PUSH-TO>
		    <MC-THIS-PRSO?>>
	       <TELL ,K-TAKE-CAB-MSG CR>
	       <RFATAL>)
	      (<MC-VERB? SHOOT>
	       <RT-WASTE-OF-BULLETS-MSG>)>>

<ROUTINE RT-AC-TH-GROWLER-CAB ("OPT" (CONTEXT <>))
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-GROWLER-CAB">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL
"It is a large cab with four wheels and room for four persons,
drawn by a single horse." CR>
	       <RTRUE>)
	      (<AND <MC-VERB? ENTER>
		    <MC-PRSO? ,ROOMS ,TH-GROWLER-CAB>>
	       <COND (<MC-IS? ,TH-SUIT-OF-ARMOUR ,FL-WORN>
		      <TELL ,K-HEAVY-ARMOUR-MSG CR>)
		     (<NOT <IN? ,GL-WINNER ,TH-GROWLER-CAB>>
		      <MOVE ,GL-WINNER ,TH-GROWLER-CAB>
		      <COND (<AND <MC-T? ,GL-PUPPY>
				  <EQUAL? ,GL-WINNER ,CH-PLAYER>>
			     <MOVE ,GL-PUPPY ,TH-GROWLER-CAB>
			     <TELL "You and " THE ,GL-PUPPY " get ">)
			    (T
			     <RT-CYOU-MSG "get" "gets">)>
		      <MC-MAKE ,TH-GROWLER-CAB ,FL-NODESC>
		      <RT-ALARM-CLR ,RT-I-GROWLER-LEAVE>
		      <RT-ALARM-SET-REL ,RT-I-GROWLER-TO? <RT-PARM-SET 0 5 0>>
		      <SETG GL-WHERE-TO-PROMPT? T>
		      <SETG GL-WHERE-TO-ORPH? T>
		      <TELL "into the cab." CR>)>)
	      (<AND <MC-VERB? EXIT>
		    <MC-PRSO? ,ROOMS ,TH-GROWLER-CAB>>
	       <COND (<IN? ,CH-PLAYER ,TH-GROWLER-CAB>
		      <MOVE ,GL-WINNER ,GL-PLACE-CUR>
		      <COND (<AND <MC-T? ,GL-PUPPY>
				  <EQUAL? ,GL-WINNER ,CH-PLAYER>>
			     <MOVE ,GL-PUPPY ,GL-PLACE-CUR>
			     <TELL "You and " THE ,GL-PUPPY " get ">)
			    (T
			     <RT-CYOU-MSG "get" "gets">)>
		      <TELL "out of the cab.">
		      <MC-UNMAKE ,TH-GROWLER-CAB ,FL-NODESC>
		      <COND (<AND <NOT <IN? ,CH-PLAYER ,TH-GROWLER-CAB>>
				  <OR <MC-F? ,GL-PUPPY>
				      <NOT <IN? ,GL-PUPPY ,TH-GROWLER-CAB>>>
				  <NOT <MC-HERE? ,RM-OXFORD-ST>>>
			     <TELL " After">
			     <RT-YOU-MSG "get" "gets">
			     <TELL "out, it drives off.">
			     <IFSOUND <RT-S-CAB-LEAVES>>
			     <MOVE ,TH-GROWLER-CAB ,RM-OXFORD-ST>
			     <RT-REMOVE-ALL ,TH-GROWLER-CAB>
			     <MOVE ,CH-GROWLER-CABBIE ,TH-GROWLER-CAB>
			     <RT-ALARM-CLR ,RT-I-GROWLER-LEAVE>
			     <RT-ALARM-CLR ,RT-I-GROWLER-TO?>
			     <SETG GL-NOW-LIT? <RT-IS-LIT?>>)>
		      <SETG GL-WHERE-TO-PROMPT? <>>
		      <SETG GL-WHERE-TO-ORPH? <>>
		      <CRLF>)>)
	      (<MC-VERB? LOOK-ON>
	       <TELL "There is a cab driver sitting on the growler." CR>)
	      (<AND <MC-VERB? TAKE PUSH-TO>
		    <MC-THIS-PRSO?>>
	       <TELL ,K-TAKE-CAB-MSG CR>
	       <RFATAL>)
	      (<MC-VERB? SHOOT>
	       <RT-WASTE-OF-BULLETS-MSG>)>>

<ROUTINE RT-AC-TH-CAB-WHISTLE ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-CAB-WHISTLE">>
	<COND (<AND <MC-VERB? BLOW-INTO>
		    <MC-THIS-PRSO?>>
	       <RT-BLOW-WHISTLE>)
	      (<AND <MC-VERB? CALL>
		    <MC-THIS-PRSI?>>
	       <COND (<MC-PRSO? ,TH-HANSOM-CAB>
		      <RT-BLOW-WHISTLE>
		      <COND (<RT-ALARM-SET? ,RT-I-CAB-ARRIVE>
			     <RT-CLOCK-INC-SET 0 2 0>
			     <RT-BLOW-WHISTLE>)>
		      <RTRUE>)
		     (<MC-PRSO? ,TH-GROWLER-CAB>
		      <RT-BLOW-WHISTLE>
		      <COND (<RT-ALARM-SET? ,RT-I-CAB-ARRIVE>
			     <RT-CLOCK-INC-SET 0 2 0>)>
		      <RTRUE>)
		     (<EQUAL? <GET ,GL-P-NAMW 0> ,W?CAB>
		      <RT-BLOW-WHISTLE>)
		     (T
		      <RT-CYOU-MSG>
		      <TELL "can't " VW " " AO " with " THEI "." CR>)>)
	      (<MC-VERB? SHOOT>
	       <RT-WASTE-OF-BULLETS-MSG>)>>
