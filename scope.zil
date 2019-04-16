;*****************************************************************************
; "game : SHERLOCK!"
; "file : SCOPE.ZIL"
; "auth :   $Author:   RAB  $"
; "date :     $Date:   22 Oct 1987 14:01:14  $"
; "rev  : $Revision:   1.23  $"
; "vers : 1.00"
;*****************************************************************************

<OBJECT CH-VENDOR
	(LOC RM-BIRDCAGE-WALK)
	(DESC "vendor")
	(FLAGS FL-ALIVE FL-PERSON FL-TRYTAKE FL-NOALL FL-NODESC)
	(SYNONYM VENDOR SALESMAN MAN)
	(SIZE 99 CAPACITY 60)
	(ACTION RT-AC-CH-VENDOR)>

<ROUTINE RT-AC-CH-VENDOR ("OPTIONAL" (CONTEXT <>) "AUX" NUM)
  <DEBUGGING? <RT-DEBUG-OB-AC "CH-VENDOR" .CONTEXT>>
  <SET NUM ,CH-VENDOR-AUX1>
  <COND (<AND <MC-THIS-WINNER?>
	      <MC-VERB? TAKE>
	      <RT-META-IN? ,GL-PRSO ,CH-PLAYER>>
	 <SETG GL-WINNER ,CH-PLAYER>
	 <RT-PERFORM ,V?GIVE ,GL-PRSO ,CH-VENDOR>
	 <SETG GL-WINNER ,CH-VENDOR>
	 <RTRUE>)
	(<AND <MC-VERB? HAGGLE>
	      <MC-THIS-PRSO?>>
	 <RT-THIS-IS-IT ,TH-TELESCOPE>
	 <COND (<NOT <IN? ,TH-TELESCOPE ,CH-VENDOR>>
		<TELL "\"Sorry, guv. No refunds.\"" CR>)
	       (<EQUAL? .NUM 0>
		<TELL
"\"Alright, guv. For you I'll come down to me special Jubilee price of
Nineteen and six. 'Ow about it?\"" CR>
		<SETG CH-VENDOR-AUX1 1>)
	       (<EQUAL? .NUM 1>
		<TELL
"\"It'll break me poor wife's 'eart, me comin' 'ome wif so little. But times
is 'ard. Nineteen shillings. Not a farthing less.\"" CR>
		<SETG CH-VENDOR-AUX1 2>)
	       (<EQUAL? .NUM 2>
		<TELL "\"Sorry, guv. Nineteen shillings is me price.\"" CR>)>)
	(<RT-TELL-ABOUT? ,CH-VENDOR>
	 <COND (<MC-PRSI? ,TH-TELESCOPE>
		<COND (<NOT <IN? ,TH-TELESCOPE ,CH-VENDOR>>
		       <TELL "\"Sorry, guv. No refunds.\"" CR>)
		      (<EQUAL? .NUM 0>
		       <TELL
"\"It's me top-of-the-line model. I can let you 'ave it for one pound.\"" CR>)
		      (<EQUAL? .NUM 1>
		       <TELL
"\"Seeing as 'ow it's you, I'll let it go for nineteen and six.\"" CR>)
		      (<EQUAL? .NUM 2>
		       <TELL "\"Nineteen shillings is as low as I can go.\""
			     CR>)>)
	       (T
		<COND (<IN? ,TH-TELESCOPE ,CH-VENDOR>
		       <COND (<MC-PRSI? ,TH-TRINKETS>
			      <TELL
"\"I've got quite a nice telescope 'ere that I can let you 'ave for only
a quid.\"" CR>)
			     (T
			      <TELL
"He ignores your question and waves trinkets over his head, asking if you wish
to buy anything." CR>)>)
		      (T
		       <TELL
"He ignores your question and looks about for new customers." CR>)>)>)
	(<MC-VERB? GIVE>
	 <COND (<MC-PRSO? ,TH-TELESCOPE>
		<TELL "\"Sorry, mate. No refunds.\"" CR>
		<RTRUE>)>)>>

<OBJECT TH-POUND-NOTE
   (LOC TH-POCKET)
   (DESC "pound note")
   (FLAGS FL-TAKEABLE FL-READABLE FL-SURFACE FL-MONEY
	  FL-HAS-DESCFCN FL-BURNABLE)
   (SYNONYM POUND NOTE QUID)
   (ADJECTIVE POUND)
   (SIZE 1 MASS 1 CAPACITY 1)
   (ACTION RT-AC-TH-POUND-NOTE)>

<OBJECT TH-SIXPENCE
   (DESC "sixpence")
   (FLAGS FL-TAKEABLE FL-MONEY)
   (SYNONYM SIXPENCE)
   (SIZE 1 MASS 1)
   (ACTION RT-AC-TH-SIXPENCE)>

<OBJECT TH-TELESCOPE
   (LOC CH-VENDOR)
   (DESC "telescope")
   (FLAGS FL-TAKEABLE FL-TRANSPARENT FL-BUYABLE FL-HAS-DESCFCN)
   (SYNONYM TELESCOPE SCOPE)
   (VALUE 1)
   (SIZE 1 MASS 1)
   (ACTION RT-AC-TH-TELESCOPE)>

<ROUTINE RT-AC-TH-POUND-NOTE ("OPTIONAL" (CONTEXT <>) "AUX" NUM)
  <DEBUGGING? <RT-DEBUG-OB-AC "TH-POUND-NOTE" .CONTEXT>>
  <COND (<==? .CONTEXT ,K-M-DESCFCN>
	 <TELL "Why, haven't you ever seen a pound note before?" CR>)
	(<OR <AND <MC-VERB? BUY>
		  <MC-PRSO? ,TH-TELESCOPE>>
	     <AND <MC-VERB? GIVE>
		  <MC-THIS-PRSO?>
		  <MC-PRSI? ,CH-VENDOR>>>
	 <RT-CYOU-MSG "give" "gives">
	 <TELL THE ,TH-POUND-NOTE " to " THE ,CH-VENDOR ".">
	 <SET NUM ,CH-VENDOR-AUX1>
	 <COND (<EQUAL? .NUM 0>
		<TELL ,K-GOOD-HEALTH-MSG>)
	       (<EQUAL? .NUM 1>
		<TELL " He smirks, gives">
		<RT-YOU-MSG>
		<TELL "sixpence change,">
		<MOVE ,TH-SIXPENCE ,GL-WINNER>
		<MC-MAKE ,TH-SIXPENCE ,FL-SEEN>
		<MC-MAKE ,TH-SIXPENCE ,FL-TOUCHED>)
	       (<EQUAL? .NUM 2>
		<TELL " He gives">
		<RT-YOU-MSG>
		<TELL "a shilling for change,">
		<MOVE ,TH-SHILLING ,GL-WINNER>
		<MC-MAKE ,TH-SHILLING ,FL-SEEN>
		<MC-MAKE ,TH-SHILLING ,FL-TOUCHED>)>
	 <TELL " and hands">
	 <RT-YOU-MSG>
	 <TELL THE ,TH-TELESCOPE "." CR>
	 <MOVE ,TH-TELESCOPE ,GL-WINNER>
	 <REMOVE ,TH-POUND-NOTE>
	 <MC-MAKE ,TH-TELESCOPE ,FL-SEEN>
	 <MC-MAKE ,TH-TELESCOPE ,FL-TOUCHED>
	 <MC-UNMAKE ,TH-TELESCOPE ,FL-NODESC>
	 <COND (<EQUAL? .NUM 2>
		<RT-UPDATE-SCORE <GETP ,TH-TELESCOPE ,P?VALUE>>)>
	 <PUTP ,TH-TELESCOPE ,P?VALUE 0>
	 <RTRUE>)>>

<ROUTINE RT-AC-TH-TELESCOPE ("OPTIONAL" (CONTEXT <>) "AUX" NUM)
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-TELESCOPE">>
	<COND (<==? .CONTEXT ,K-M-DESCFCN>
	       <TELL "The telescope looks surprisingly good">
	       <COND (<IN? ,TH-TELESCOPE ,CH-VENDOR>
		      <TELL ". But it's not worth a whole pound">)
		     (T
		      <TELL ", considering it's just a trinket">)>
	       <TELL "." CR>
	       <RTRUE>)>
	<SETG GL-P-IT-OBJECT ,TH-TELESCOPE>
	<COND (<MC-THIS-PRSI?>
	       <COND (<MC-VERB? LOOK-THRU>
		      <COND (<NOT <IN? ,GL-PRSI ,CH-PLAYER>>
			     <RT-YOUD-HAVE-TO-MSG "be holding" ,GL-PRSI>
			     <RTRUE>)
			    (<OR <RT-GOT? ,GL-PRSO>
				 <MC-PRSO? ,CH-PLAYER ,CH-ME ,TH-HANDS
					 ,TH-FEET ,TH-POCKET>
				 <RT-IDENTIFY-FLOOR? ,W?GROUND
						     ,GL-PRSO>>
			     <TELL CTHEI " will not focus that closely." CR>
			     <RTRUE>)
			    (<NOT <EQUAL? ,GL-LASTFOC ,GL-PRSO>>
			     <SETG GL-LASTFOC ,GL-PRSO>
			     <TELL "You focus the telescope on " THEO "."
				   CR CR>)>
		      <COND (<AND <MC-PRSO? ,TH-NELSON-STATUE ,TH-NELSON-EYE>
				  <IN? ,TH-RUBY ,TH-NELSON-STATUE>>
			     <TELL "You can see a ruby in Nelson's blind eye."
				   CR>
			     <MC-MAKE ,TH-NELSON-STATUE ,FL-OPENED>
			     <RTRUE>)
			    (<AND <MC-IS? ,GL-PRSO ,FL-PLURAL>
				  <MC-ISNOT? ,GL-PRSO ,FL-COLLECTIVE>>
			     <TELL "They appear">)
			    (<AND <MC-IS? ,GL-PRSO ,FL-PERSON>
				  <MC-IS? ,GL-PRSO ,FL-FEMALE>>
			     <TELL "She appears">)
			    (<AND <MC-IS? ,GL-PRSO ,FL-PERSON>
				  <MC-ISNOT? ,GL-PRSO ,FL-FEMALE>>
			     <TELL "He appears">)
			    (T
			     <TELL "It appears">)>
		      <TELL " much closer now." CR>
		      <RTRUE>)
		     (T
		      <RFALSE>)>)
	      (<MC-VERB? LOOK-INSIDE>
	       <TELL "Everything appears much closer." CR>
	       <RTRUE>)
	      (<MC-VERB? ADJUST PLAY>
	       <TELL "You fiddle aimlessly with the controls." CR>
	       <RTRUE>)
	      (<AND <MC-VERB? TAKE STEAL>
		    <IN? ,TH-TELESCOPE ,CH-VENDOR>>
	       <TELL ,K-THEFT-MSG CR>
	       <RTRUE>)
	      (<AND <MC-VERB? BUY BUY-FROM>
		    <IN? ,TH-TELESCOPE ,CH-VENDOR>>
	       <COND (<OR <MC-PRSI? ,TH-POUND-NOTE>
			  <AND <MC-PRSI? <> ,CH-VENDOR>
			       <RT-META-IN? ,TH-POUND-NOTE ,GL-WINNER>>>
		      <RT-CYOU-MSG "give" "gives">
		      <TELL THE ,TH-POUND-NOTE " to " THE ,CH-VENDOR ".">
		      <SET NUM ,CH-VENDOR-AUX1>
		      <COND (<EQUAL? .NUM 0>
			     <TELL ,K-GOOD-HEALTH-MSG>)
			    (<EQUAL? .NUM 1>
			     <TELL " He smirks, gives">
			     <RT-YOU-MSG>
			     <TELL "sixpence change,">
			     <MOVE ,TH-SIXPENCE ,GL-WINNER>
			     <MC-MAKE ,TH-SIXPENCE ,FL-SEEN>
			     <MC-MAKE ,TH-SIXPENCE ,FL-TOUCHED>)
			    (<EQUAL? .NUM 2>
			     <TELL " He gives">
			     <RT-YOU-MSG>
			     <TELL "a shilling for change,">
			     <MOVE ,TH-SHILLING ,GL-WINNER>
			     <MC-MAKE ,TH-SHILLING ,FL-SEEN>
			     <MC-MAKE ,TH-SHILLING ,FL-TOUCHED>)>
		      <TELL " and hands">
		      <RT-YOU-MSG>
		      <TELL THE ,TH-TELESCOPE "." CR>
		      <MOVE ,TH-TELESCOPE ,GL-WINNER>
		      <REMOVE ,TH-POUND-NOTE>
		      <MC-MAKE ,TH-TELESCOPE ,FL-SEEN>
		      <MC-MAKE ,TH-TELESCOPE ,FL-TOUCHED>
		      <MC-UNMAKE ,TH-TELESCOPE ,FL-NODESC>
		      <COND (<EQUAL? .NUM 2>
			     <RT-UPDATE-SCORE <GETP ,TH-TELESCOPE ,P?VALUE>>)>
		      <PUTP ,TH-TELESCOPE ,P?VALUE 0>
		      <RTRUE>)
		     ;(<MC-PRSI? ,TH-SHILLING>
		      <TELL CTHE ,CH-VENDOR " looks at " THE ,TH-SHILLING
			    " and says, \"That's not enough.\"" CR>
		      <RTRUE>)
		     (T
		      <RT-CYOU-MSG>
		      <TELL "can't buy " THEO " with">
		      <COND (<MC-T? ,GL-PRSI>
			     <TELL " " THEI>)
			    (T
			     <TELL "out any money">)>
		      <TELL "." CR>)>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-AC-TH-SIXPENCE ()
	<DEBUGGING? <RT-DEBUG-OB-AC "TH-SIXPENCE">>
	<RFALSE>>


