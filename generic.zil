;*****************************************************************************
; "game : SHERLOCK!"
; "file : GENERIC.ZIL"
; "auth :   $Author:   DEB  $"
; "date :     $Date:   28 Oct 1987 15:50:50  $"
; "rev  : $Revision:   1.25  $"
; "vers : 1.00"
;*****************************************************************************

<ROUTINE RT-GN-PAPER
	(TBL "OPTIONAL" (LEN 0) "AUX" PTR OBJ PAPER
		(CONT <>) (C-PAPER <>)
		(HELD <>) (H-PAPER <>)
		(GND <>)  (G-PAPER <>))
	<COND (<ZERO? .LEN>
	       <SET LEN <GET .TBL 0>>)>
	<SET PTR <REST .TBL 2>>
	<COND (<INTBL? ,GL-P-IT-OBJECT .PTR .LEN>
	       <TELL "[" CTHE ,GL-P-IT-OBJECT "]" CR ;CR>
	       <RETURN ,GL-P-IT-OBJECT>)
	      (T
	       <REPEAT ()
		       <COND (<G? .PTR <REST .TBL <* .LEN 2>>>
			      <RETURN>)
			     (T
			      <SET OBJ <GET .PTR 0>>)>
; "If the paper is on a surface (i.e. tomb), use it."		       
		       <COND (<MC-IS? <LOC .OBJ> ,FL-SURFACE>
			      <RETURN>)
; "Check for single held paper."
			     (<EQUAL? <LOC .OBJ> ,CH-PLAYER>
			      <COND (<MC-F? .HELD>
				     <SET HELD T>
				     <SET H-PAPER .OBJ>)
				    (T
				     <SET H-PAPER <>>)>)
; "Check for single paper on ground/floor."
			    (<EQUAL? <LOC .OBJ> ,GL-PLACE-CUR>
			     <COND (<MC-F? .GND>
				    <SET GND T>
				    <SET G-PAPER .OBJ>)
				   (T
				    <SET G-PAPER <>>)>)
; "Find first contained paper."
			    (<AND <MC-F? .CONT>
				  <MC-IS? <LOC .OBJ> ,FL-CONTAINER>>
			     <SET CONT <LOC .OBJ>>
			     <SET C-PAPER .OBJ>)
; "Check for paper in a different container."
			    (<AND <MC-IS? <LOC .OBJ> ,FL-CONTAINER>
				  <MC-T? .CONT>
				  <NOT <EQUAL? <LOC .OBJ> .CONT>>>
			     <SET C-PAPER <>>)>
		       <SET PTR <REST .PTR 2>>>
	       <COND (<AND <MC-T? .OBJ>
			   <MC-IS? <LOC .OBJ> ,FL-SURFACE>>
		      <SET PAPER .OBJ>)
		     (<MC-T? .H-PAPER>
		      <SET PAPER .H-PAPER>)
		     (<MC-T? .G-PAPER>
		      <SET PAPER .G-PAPER>)
		     (<MC-T? .C-PAPER>
		      <SET PAPER .C-PAPER>)
		     (T
		      <RFALSE>)>
	       <TELL "[" CTHE .PAPER "]" CR CR>
	       <RETURN .PAPER>)>		
	<RFALSE>>

<ROUTINE RT-GN-GEM (TBL "OPTIONAL" (LEN 0) "AUX" PTR OBJ GEM (CONT <>)
		 	(C-GEM <>) (HELD <>) (H-GEM <>)(GND <>) (G-GEM <>))
	 <COND (<ZERO? .LEN>
		<SET LEN <GET .TBL 0>>)>
	 <SET PTR <REST .TBL 2>>
	 <COND (<INTBL? ,GL-P-IT-OBJECT .PTR .LEN>
		<TELL "[" CTHE ,GL-P-IT-OBJECT "]" CR CR>
		<RETURN ,GL-P-IT-OBJECT>)
	       (<AND <MC-HERE? RM-CLOCK-TOWER>
		     <IN? ,TH-SAPPHIRE ,TH-CLAPPER>>
		<RETURN ,TH-SAPPHIRE>)
	       (T
		<REPEAT ()
			<COND (<G? .PTR <REST .TBL <* .LEN 2>>>
			       <RETURN>)
			      (T
			       <SET OBJ <GET .PTR 0>>)>
; "Check for single held gem."
                        <COND (<EQUAL? <LOC .OBJ> ,CH-PLAYER>
			       <COND (<MC-F? .HELD>
				      <SET HELD T>
				      <SET H-GEM .OBJ>)
				     (T
				      <SET H-GEM <>>)>)
; "Check for single gem on ground/floor."
		              (<EQUAL? <LOC .OBJ> ,GL-PLACE-CUR>
			       <COND (<MC-F? .GND>
				      <SET GND T>
				      <SET G-GEM .OBJ>)
				     (T
				      <SET G-GEM <>>)>)
; "Find first contained gem."
			      (<AND <MC-T? <LOC .OBJ>>
				    <MC-F? .CONT>
				    <MC-IS? <LOC .OBJ> ,FL-CONTAINER>>
			       <SET CONT <LOC .OBJ>>
			       <SET C-GEM .OBJ>)
; "Check for gem in a different container."
		              (<AND <MC-T? <LOC .OBJ>>
				    <MC-IS? <LOC .OBJ> ,FL-CONTAINER>
				    <MC-T? .CONT>
				    <NOT <EQUAL? <LOC .OBJ> .CONT>>>
			       <SET C-GEM <>>)>
			<SET PTR <REST .PTR 2>>>
		<COND (<MC-T? .H-GEM>  ; "Return single held gem."
		       <SET GEM .H-GEM>)
		      (<MC-T? .G-GEM>  ; "Return single gem on ground/floor."
		       <SET GEM .G-GEM>)
		      (<MC-T? .C-GEM>  ; "Return first gem in container."
		       <SET GEM .C-GEM>)
		      (T
		       <RFALSE>)>
		<TELL "[" CTHE .GEM "]" CR CR>
		<RETURN .GEM>)>
	 <RFALSE>>

<ROUTINE RT-GN-PIGEON (TBL "OPTIONAL" (LEN 0))
	<COND (<MC-ISNOT? ,CH-TRAINED-PIGEON ,FL-ALIVE>
	       <TELL "[" CTHE ,TH-DEAD-PIGEON "]" CR CR>
	       <RETURN ,TH-DEAD-PIGEON>)
	      (T
	       <TELL "[" CTHE ,CH-TRAINED-PIGEON "]" CR CR>
	       <RETURN ,CH-TRAINED-PIGEON>)>>

<ROUTINE RT-GN-OAR (TBL "OPTIONAL" (LEN 0))
	<COND (<EQUAL? ,GL-P-IT-OBJECT ,TH-OAR-1 ,TH-OAR-2>
	       <TELL "[" CTHE ,GL-P-IT-OBJECT "]" CR CR>
	       <RETURN ,GL-P-IT-OBJECT>)
	      (T
	       <TELL "[" CTHE ,TH-OAR-2 "]" CR CR>
	       <RETURN ,TH-OAR-2>)>>

<ROUTINE RT-GN-BOX (TBL "OPTIONAL" (LEN 0) "AUX" PTR)
	<COND (<ZERO? .LEN>
	       <SET LEN <GET .TBL 0>>)>
	<SET PTR <REST .TBL 2>>
	<COND (<INTBL? ,GL-P-IT-OBJECT .PTR .LEN>
	       <TELL "[" CTHE ,GL-P-IT-OBJECT "]" CR CR>
	       <RETURN ,GL-P-IT-OBJECT>)
	      (T
	       <RFALSE>)>>

<ROUTINE RT-GN-DOOR (TBL "OPTIONAL" (LEN 0) "AUX" PTR (OBJ <>) (DOOR <>))
	<COND (<ZERO? .LEN>
	       <SET LEN <GET .TBL 0>>)>
	<SET PTR <REST .TBL 2>>
	<REPEAT ()
		<COND (<G? .PTR <REST .TBL <* .LEN 2>>>
		       <RETURN>)
		      (T
		       <SET OBJ <GET .PTR 0>>)>
		<COND (<MC-VERB? OPEN>
		       <COND (<MC-ISNOT? .OBJ ,FL-OPENED>
			      <COND (<MC-F? .DOOR>
				     <SET DOOR .OBJ>)
				    (T
				     <RFALSE>)>)>)
		      (<MC-VERB? CLOSE>
		       <COND (<MC-IS? .OBJ ,FL-OPENED>
			      <COND (<MC-F? .DOOR>
				     <SET DOOR .OBJ>)
				    (T
				     <RFALSE>)>)>)>
		<SET PTR <REST .PTR 2>>>
	<COND (<MC-T? .DOOR>
	       <TELL "[" CTHE .DOOR "]" CR CR>)>
	<RETURN .DOOR>>

<ROUTINE RT-GN-BOTTLE (TBL "OPTIONAL" (LEN 0) "AUX" PTR OBJ (BOTTLE <>))
	<COND (<ZERO? .LEN>
	       <SET LEN <GET .TBL 0>>)>
	<SET PTR <REST .TBL 2>>
	<REPEAT ()
		<COND (<G? .PTR <REST .TBL <* .LEN 2>>>
		       <RETURN>)
		      (T
		       <SET OBJ <GET .PTR 0>>)>
		<COND (<OR <AND <MC-VERB? OPEN>
				<MC-THIS-PRSO?>
				<MC-ISNOT? .OBJ ,FL-OPENED>>
			   <AND <MC-VERB? CLOSE>
				<MC-THIS-PRSO?>
				<MC-IS? .OBJ ,FL-OPENED>>
			   <AND <MC-VERB? PUT>
				<MC-THIS-PRSI?>
				<MC-IS? .OBJ ,FL-OPENED>>>
		       <COND (<MC-F? .BOTTLE>
			      <SET BOTTLE .OBJ>)
			     (T
			      <RFALSE>)>)>
		<SET PTR <REST .PTR 2>>>
	<COND (<MC-T? .BOTTLE>
	       <TELL "[" CTHE .BOTTLE "]" CR CR>)>
	<RETURN .BOTTLE>>

<ROUTINE RT-GN-PILL (TBL "OPTIONAL" (LEN 0) "AUX" PTR OBJ (PILL <>))
	<COND (<ZERO? .LEN>
	       <SET LEN <GET .TBL 0>>)>
	<SET PTR <REST .TBL 2>>
	<COND (<RT-TOUCH-VERB?>
	       <REPEAT ()
		       <COND (<G? .PTR <REST .TBL <* .LEN 2>>>
			      <RETURN>)
			     (T
			      <SET OBJ <GET .PTR 0>>)>
		       <COND (<RT-ACCESSIBLE? .OBJ>
			      <COND (<MC-F? .PILL>
				     <SET PILL .OBJ>)
				    (T
				     <RFALSE>)>)>
		       <SET PTR <REST .PTR 2>>>)>
	<COND (<MC-T? .PILL>
	       <TELL "[" CTHE .PILL "]" CR CR>)>
	<RETURN .PILL>>

<ROUTINE RT-GN-TH-CLOTHES (TBL "OPTIONAL" (LEN 0))
  ,TH-CLOTHES>

<ROUTINE RT-GN-BODY (TBL "OPTIONAL" (LEN 0) "AUX" PTR (OBJ <>))
	<COND (<ZERO? .LEN>
	       <SET LEN <GET .TBL 0>>)>
	<SET PTR <REST .TBL 2>>
	<COND (<INTBL? ,TH-CLOTHES .PTR .LEN>
	       <RETURN ,TH-CLOTHES>)>
	<REPEAT ()
	  <COND (<ZERO? .LEN>
		 <RETURN <>>)
		(<MC-IS? <SET OBJ <GET .PTR 0>> ,FL-BODYPART>
		 <RETURN .OBJ>)>
	  <SET PTR <REST .PTR 2>>
	  <DEC LEN>>>

<ROUTINE RT-GN-INTNUM (TBL "OPTIONAL" (LEN 0))
	<COND (<MC-VERB? WAIT WAIT-FOR>
	       <RETURN ,TH-INTNUM>)
	      (T
	       <RETURN ,TH-SAFETY-DEPOSIT-BOX>)>>

<ROUTINE RT-GN-ETHERIUM (TBL "OPT" (LEN 0))
  <COND (<MC-VERB? SMELL INHALE> ,TH-ETHERIUM-GAS)
	(<MC-VERB? MUNG OPEN LOOK-INSIDE> ,TH-ETHERIUM-AMPOULE)>>

<ROUTINE RT-GN-TOWER (TBL "OPTIONAL" (LEN 0))
	,LG-TOWER>