; "clock constants"

; "offsets into time tables"

<CONSTANT K-SEC 0>			; "sec"
<CONSTANT K-MIN 1>			; "min"
<CONSTANT K-HRS 2>			; "hrs"
<CONSTANT K-DAY 3>			; "day"
<CONSTANT K-DOW-BASE 12>		; "Known to be Sunday (dow = 0)"

; "alarm constants"

<CONSTANT K-A-RSIZE   30>	; "size of alarm routine table in words"
<CONSTANT K-A-TWDTH   4>	; "size of alarm time table entry in bytes"
<CONSTANT K-A-TSIZE	<* ,K-A-TWDTH 30>>	; "size of alarm time table in bytes"


; "event constants"

; "clock globals"

<GLOBAL GL-CLOCK-WAIT:FLAG  <>>				; "flag to inhibit clock update"
<GLOBAL GL-CLOCK-STOP:FLAG  <>>				; "flag to stop    clock update"

<CONSTANT GL-TIME:TABLE ; "pri game time table"
	<TABLE  (BYTE)
		0		; "sec 00-59"
		0		; "min 00-59"
		0 		; "hrs 00-23"
		0 		; "day 01-31">>

<CONSTANT GL-TEMP-TIME:TABLE <ITABLE ,K-A-TWDTH (BYTE) 0>>
; "table to hold time temporarily"

<CONSTANT GL-TIME-PARM:TABLE <ITABLE ,K-A-TWDTH (BYTE) 0>>
; "Parameter table to all time routines"

<CONSTANT GL-TIME-UPDT-INC:TABLE			; "next time inc is kept here"
	<TABLE (BYTE)
		0		; "sec"
		0		; "min"
		0		; "hrs"
		0 		; "day">>

<CONSTANT GL-TIME-UPDT-DEF:TABLE			; "default time inc is kept here"
	<TABLE (BYTE)
		0		; "sec"
		0		; "min"
		0		; "hrs"
		0 		; "day">>

<CONSTANT GL-DAY-NAME:TABLE					; "long and short day names"
	<PTABLE
		"Sunday"	; "offset of  0"
		"Monday"
		"Tuesday"
		"Wednesday"
		"Thursday"
		"Friday"
		"Saturday"
		"Sun"										; "offset of  7"
		"Mon"
		"Tue"
		"Wed"
		"Thu"
		"Fri"
		"Sat"
		"Sunday   "								; "offset of 14"
		"Monday   "
		"Tuesday  "
		"Wednesday"
		"Thursday "
		"Friday   "
		"Saturday "
	>
>

; "alarm globals"

<GLOBAL GL-ALARM-WAIT:FLAG  <>>			; "flag to inhibit alarm check"
<GLOBAL GL-ALARM-STOP:FLAG  <>>			; "flag to stop    alarm check"
<GLOBAL GL-ALARM-EXEC:FLAG  <>>			; "flag to show an alarm is executing"

<CONSTANT GL-A-ROUT:TABLE <ITABLE ,K-A-RSIZE 0>>	; "table of routines"
<CONSTANT GL-A-TIME:TABLE <ITABLE ,K-A-TSIZE (BYTE) 0>>
; "table of times (6 words)"

; "event globals"

; "support routines use by clock/event/alarm"

; "RT-COPY-TIME"
; "Copy time table 1 to time table 2"

<ROUTINE RT-COPY-TIME (TBL1 TBL2)
	<COPYT .TBL1 .TBL2 ,K-A-TWDTH>>

; "RT-NORM-TIME"

<ROUTINE RT-NORM-TIME (TIME-TABLE "AUX" TEMP M-LEN)
   ; "normalize seconds"
   <SET TEMP <GETB .TIME-TABLE ,K-SEC>>
   <PUTB .TIME-TABLE ,K-SEC <MOD .TEMP 60>>
   ; "This is the new minutes value"
   <SET TEMP <+ <GETB .TIME-TABLE ,K-MIN> </ .TEMP 60>>>
   ; "normalize minutes"
   <PUTB .TIME-TABLE ,K-MIN <MOD .TEMP 60>>
   <SET TEMP <+ <GETB .TIME-TABLE ,K-HRS> </ .TEMP 60>>>
   ; "normalize hours"
   <PUTB .TIME-TABLE ,K-HRS <MOD .TEMP 24>>
   ; "Update day of month"
   <PUTB .TIME-TABLE ,K-DAY <+ <GETB .TIME-TABLE ,K-DAY>
			       <SET TEMP </ .TEMP 24>>>>
   ; "normalize day, month, and year (including leap years)"
   ; "Given that the game takes place in the middle of June in 1887,
      this is a complete waste of time..."
   ;<REPEAT ()
     <SET M-LEN <GETB ,GL-MONTH-LEN <GETB .TIME-TABLE ,K-MON>>>
     <COND (<NOT <EQUAL? <GETB .TIME-TABLE ,K-MON> 2>>
	    T)
	   (<ZERO? <MOD <GETB .TIME-TABLE ,K-YRS> 100>>
	    T)
	   (<ZERO? <MOD <GETB .TIME-TABLE ,K-YRS> 4>>
	    <INC M-LEN>)>
     <SET TEMP <GETB .TIME-TABLE ,K-DAY>>
     <COND (<G? .TEMP .M-LEN>
	    <PUTB .TIME-TABLE ,K-DAY <- .TEMP .M-LEN>>
	    <PUTB .TIME-TABLE ,K-MON <+ <GETB .TIME-TABLE ,K-MON> 1>>
	    <SET TEMP <GETB .TIME-TABLE ,K-MON>>
	    <COND (<G? .TEMP 12>
		   <PUTB .TIME-TABLE ,K-MON <- .TEMP 12>>
		   <PUTB .TIME-TABLE ,K-YRS
			 <+ <GETB .TIME-TABLE ,K-YRS> 1>>)>)
	   (T <RETURN>)>>>

; "clock routines"

; "RT-CLOCK-INC-SET.  Made a macro that calls RT-DO-CLOCK-SET"

<ROUTINE RT-DO-CLOCK-SET (TBL HRS MIN SEC
		       "OPTIONAL" (DAY 0))
	<PUTB .TBL ,K-SEC .SEC>
	<PUTB .TBL ,K-MIN .MIN>
	<PUTB .TBL ,K-HRS .HRS>
 	<PUTB .TBL ,K-DAY .DAY>
 	.TBL>

; "RT-CLOCK-DEF-SET.  Moved to MACROS"

; "RT-CLOCK-SET.  MOVED TO MACROS"

; "RT-CLOCK-INC"

<ROUTINE RT-CLOCK-INC ()
	<COND (<MC-T? ,GL-CLOCK-WAIT>
	       <SETG GL-CLOCK-WAIT <>>
	       <RFALSE>)
	      (<MC-T? ,GL-CLOCK-STOP>
	       <RFALSE>)>
	; "add gl-time-updt-inc to gl-time"
	<REPEAT ((N 0))
	  <PUTB ,GL-TIME .N
		<+ <GETB ,GL-TIME .N>
		   <GETB ,GL-TIME-UPDT-INC .N>>>
	  <COND (<G? <SET N <+ .N 1>>
		     <- ,K-A-TWDTH 1>> <RETURN>)>>
	; "copy gl-time-updt-def into gl-time-updt-inc"
	<COPYT ,GL-TIME-UPDT-DEF ,GL-TIME-UPDT-INC ,K-A-TWDTH>
	; "normalize the time in gl-time"
	<RT-NORM-TIME ,GL-TIME>>

; "RT-PARM-SET MOVED TO MACROS"

; "RT-CLOCK-CMP"
; "Returns -1 if arg time < current time."
; "Returns  0 if arg time = current time."
; "Returns  1 if arg time > current time."

<ROUTINE RT-CLOCK-CMP (HRS MIN SEC "OPTIONAL" (DAY 0)
		       "AUX" TMP)
	<COND (<ZERO? .DAY>
	       T)
	      (<G? .DAY <SET TMP <GETB ,GL-TIME ,K-DAY>>>
	       <RETURN 1>)
	      (<L? .DAY .TMP>
	       <RETURN -1>)>
	<COND (<G? .HRS <SET TMP <GETB ,GL-TIME ,K-HRS>>>
	       <RETURN 1>)
	      (<L? .HRS .TMP>
	       <RETURN -1>)
	      (<G? .MIN <SET TMP <GETB ,GL-TIME ,K-MIN>>>
	       <RETURN 1>)
	      (<L? .MIN .TMP>
	       <RETURN -1>)
	      (<G? .SEC <SET TMP <GETB ,GL-TIME ,K-SEC>>>
	       <RETURN 1>)
	      (<L? .SEC .TMP>
	       <RETURN -1>)
	      (T
	       <RETURN 0>)>>

; "RT-CLOCK-JMP"

<ROUTINE RT-CLOCK-JMP (HRS MIN SEC "OPTIONAL" (DAY 0))
	<RT-CLOCK-INC-SET .HRS .MIN .SEC .DAY>
	<RT-CLOCK-INC>
	<RT-ALARM-CHK
		<COND (<MC-VERB? WAIT WAIT-FOR>
		       2)
		      (T 1)>>
	<SETG GL-CLOCK-WAIT T>>

; "RT-CLK-NTI-MSG"

<ROUTINE RT-CLK-NTI-MSG ("OPTIONAL" (FMT 7) "AUX" HRS MIN SEC MSD MER
			 (AM-PM? 0))
	<SET HRS <GETB ,GL-TIME ,K-HRS>>
	<SET MIN <GETB ,GL-TIME ,K-MIN>>
	<SET SEC <GETB ,GL-TIME ,K-SEC>>
	<COND (<BAND .FMT ,K-NTI-HH>
	       <COND (<BAND .FMT ,K-NTI-MT>
		      <SET MSD "0">)
		     (<EQUAL? .HRS 0>
		      <SET HRS <+ .HRS 12>>
		      <SET MSD " ">
		      <SET AM-PM? 1>)
		     (<L? .HRS 12>
		      <SET MSD " ">
		      <SET AM-PM? 1>)
		     (<EQUAL? .HRS 12>
		      <SET MSD " ">
		      <SET AM-PM? 2>)
		     (T
		      <SET HRS <- .HRS 12>>
		      <SET MSD " ">
		      <SET AM-PM? 2>)>
	       <COND (<==? .AM-PM? 1>
		      <COND (<BAND .FMT ,K-NTI-SM>
			     <SET MER " AM">)
			    (T
			     <SET MER " a.m.">)>)
		     (<==? .AM-PM? 2>
		      <COND (<BAND .FMT ,K-NTI-SM>
			     <SET MER " PM">)
			    (T
			     <SET MER " p.m.">)>)
		     (T
		      <SET MER " ">)>
	       <COND (<L? .HRS 10>
		      <TELL .MSD>)>
	       <TELL N .HRS>)>
	<COND (<BAND .FMT ,K-NTI-MM>
	       <COND (<BAND .FMT ,K-NTI-HH>
		      <TELL ":">)>
	       <COND (<L? .MIN 10>
		      <TELL "0">)>
	       <TELL N .MIN>)>
	<COND (<BAND .FMT ,K-NTI-SS>
	       <COND (<OR <BAND .FMT ,K-NTI-HH>
			  <BAND .FMT ,K-NTI-MM>>
		      <TELL ":">)>
	       <COND (<L? .SEC 10>
		      <TELL "0">)>
	       <TELL N .SEC>)>
	<COND (<BAND .FMT ,K-NTI-HH>
	       <TELL .MER>)>>

; "RT-CLK-DOW-MSG"

<ROUTINE RT-CLK-DOW-MSG ("OPTIONAL" (FMT 1) "AUX" DOW WDOW)
	<SET DOW <MOD <- <GETB ,GL-TIME ,K-DAY> ,K-DOW-BASE> 7>>
	<COND (<BAND .FMT ,K-DOW-DW>
	       <COND (<BAND .FMT ,K-DOW-EN>
		      <SET WDOW <GET ,GL-DAY-NAME <+ .DOW 14>>>)
		     (<BAND .FMT ,K-DOW-SN>
		      <SET WDOW <GET ,GL-DAY-NAME <+ .DOW  7>>>)
		     (T
		      <SET WDOW <GET ,GL-DAY-NAME .DOW>>)>
	       <TELL .WDOW>)>>

; "alarm routines"

; "RT-ALARM-SET?"

<ROUTINE RT-ALARM-SET? (RTN "AUX" (R-PTR 0) T-PTR)
  <REPEAT ()
    <COND (<EQUAL? .R-PTR ,K-A-RSIZE>
	   <RFALSE>)
	  (<EQUAL? .RTN <GET ,GL-A-ROUT .R-PTR>>
	   <SET T-PTR <* .R-PTR ,K-A-TWDTH>>
	   <RT-COPY-TIME <REST ,GL-A-TIME .T-PTR> ,GL-TIME-PARM>
	   <RTRUE>)
	  (T
	   <INC R-PTR>)>>>

; "RT-ALARM-SET-REL"

<ROUTINE RT-ALARM-SET-REL (RTN TIME "AUX" (R-PTR 0) T-PTR)
  <REPEAT ()
    <COND (<EQUAL? .R-PTR ,K-A-RSIZE>
		       <TELL CR "*** TOO MANY ALARMS (REL) ***" CR CR>
		       <RFALSE>)>
    ;<DEBUGGING? <COND (<EQUAL? .R-PTR ,K-A-RSIZE>
		       <TELL CR "*** TOO MANY ALARMS (REL) ***" CR CR>
		       <RFALSE>)>>
    <COND (<ZERO? <GET ,GL-A-ROUT .R-PTR>>
	   <PUT ,GL-A-ROUT .R-PTR .RTN>
	   <SET T-PTR <* .R-PTR ,K-A-TWDTH>>
	   <COND (<MC-T? ,GL-ALARM-EXEC>
		  <REPEAT ((N 0))
		    <PUTB ,GL-A-TIME <+ .T-PTR .N>
		      <+ <GETB ,GL-TIME .N>
			 <GETB .TIME .N>>>
		    <COND (<G? <SET N <+ .N 1>>
			       <- ,K-A-TWDTH 1>>
			   <RETURN>)>>)
		 (T
		  <REPEAT ((N 0))
		    <PUTB ,GL-A-TIME <+ .T-PTR .N>
			  <+ <GETB ,GL-TIME .N>
			     <GETB .TIME .N>
			     <GETB ,GL-TIME-UPDT-INC .N>>>
		    <COND (<G? <SET N <+ .N 1>>
			       <- ,K-A-TWDTH 1>>
			   <RETURN>)>>)>
	   <RT-NORM-TIME <REST ,GL-A-TIME .T-PTR>>
	   <RTRUE>)
	  (T
	   <INC R-PTR>)>>>

; "RT-ALARM-SET-ABS"

<ROUTINE RT-ALARM-SET-ABS (RTN TIME "AUX" (R-PTR 0) T-PTR)
  <REPEAT ()
    <COND (<EQUAL? .R-PTR ,K-A-RSIZE>
		       <TELL CR "*** TOO MANY (ABS) ALARMS ***" CR CR>
		       <RFALSE>)>
    ;<DEBUGGING? <COND (<EQUAL? .R-PTR ,K-A-RSIZE>
		       <TELL CR "*** TOO MANY (ABS) ALARMS ***" CR CR>
		       <RFALSE>)>>
    <COND (<ZERO? <GET ,GL-A-ROUT .R-PTR>>
	   <PUT ,GL-A-ROUT .R-PTR .RTN>
	   <SET T-PTR <* .R-PTR ,K-A-TWDTH>>
	   <COPYT .TIME <REST ,GL-A-TIME .T-PTR> ,K-A-TWDTH>
	   <RTRUE>)
	  (T
	   <INC R-PTR>)>>>

; "RT-ALARM-CLR"

<ROUTINE RT-ALARM-CLR (RTN "AUX" (R-PTR 0) T-PTR)
  <REPEAT ()
    <COND (<EQUAL? .R-PTR ,K-A-RSIZE>
	   <RFALSE>)
	  (<EQUAL? .RTN <GET ,GL-A-ROUT .R-PTR>>
	   <PUT ,GL-A-ROUT .R-PTR 0>
	   <SET T-PTR <* .R-PTR ,K-A-TWDTH>>
	   <COPYT <REST ,GL-A-TIME .T-PTR> 0 ,K-A-TWDTH>)>
    <INC R-PTR>>>

; "RT-ALARM-CHK"

<GLOBAL RUN-SMELL-ETHERIUM? <>>

<ROUTINE RT-ALARM-CHK ("OPTIONAL" (PARM 0)
		       "AUX" VAL (RTN -1) (R-PTR 0) (R-CNT 0)
		       T-PTR HRS MIN SEC DAY T-TIME)
  <SETG RUN-SMELL-ETHERIUM? <>>
  <COND (<MC-T? ,GL-ALARM-WAIT>
	 <SETG GL-ALARM-WAIT <>>
	 <RFALSE>)
	(<MC-T? ,GL-ALARM-STOP>
	 <RFALSE>)>
  <RT-COPY-TIME ,GL-TIME ,GL-TEMP-TIME>
  <REPEAT ()
    <COND (<EQUAL? .R-PTR ,K-A-RSIZE>
	   <COND (<EQUAL? .RTN -1>
		  <COND (,RUN-SMELL-ETHERIUM? <RETURN>)>
		  <RETURN .R-CNT>)
		 (T
		  ; "Time to run it"
		  <SET R-PTR .RTN>	; "Get the offset stored in RTN"
		  <SET RTN <GET ,GL-A-ROUT .R-PTR>>
		  <SET T-PTR <* .R-PTR ,K-A-TWDTH>>
		  <PUT ,GL-A-ROUT .R-PTR 0>
		  <SET T-TIME <ZREST ,GL-A-TIME .T-PTR>>
		  <SET SEC <GETB .T-TIME ,K-SEC>>
		  <SET MIN <GETB .T-TIME ,K-MIN>>
		  <SET HRS <GETB .T-TIME ,K-HRS>>
		  <SET DAY <GETB .T-TIME ,K-DAY>>
		  <COPYT .T-TIME 0 ,K-A-TWDTH>
		  <COND (<MC-ISNOT? ,CH-PLAYER ,FL-ASLEEP>
			 <RT-UPDATE-STATUS-LINE>)>
		  <SETG GL-ALARM-EXEC T>
		  <SET VAL <APPLY .RTN>>
		  <COND (,RUN-SMELL-ETHERIUM? <RETURN>)>
		  <SETG GL-ALARM-EXEC <>>
		  <RT-COPY-TIME ,GL-TEMP-TIME ,GL-TIME>
		  <INC R-CNT>
		  ; "If alarm time != new time, ask for key to cont."
		  <COND (<AND <MC-T? .VAL>
			      <EQUAL? <RT-CLOCK-CMP .HRS .MIN .SEC
						    .DAY> -1>>
			 <COND (<EQUAL? .PARM 1>
				<TELL "[Press any key to continue.]" CR>
				<INPUT 1>)
			       (<EQUAL? .PARM 2>
				<REPEAT ()
				  <TELL CR
					"Do you want to continue waiting?" CR
					"Please press Y or N > ">
				  <SET VAL <INPUT 1>>
				  <PRINTC .VAL>
				  <CRLF>
				  <COND
				   (<EQUAL? .VAL !\N !\n>
				    <SET RTN -1>
				    <SET R-PTR ,K-A-RSIZE>
				    <RT-CLOCK-SET .HRS .MIN .SEC
						  .DAY>
				    <RETURN>)
				   (<EQUAL? .VAL !\Y !\y>
				    <RETURN>)>>)>)>
		  ; "Reset and start loop again."
		  <COND (<EQUAL? .RTN -1>
			 <AGAIN>)>
		  <SET RTN -1>
		  <SET R-PTR 0>
		  <AGAIN>)>)>
    <COND (<MC-T? <GET ,GL-A-ROUT .R-PTR>>
	   <SET T-PTR <* .R-PTR ,K-A-TWDTH>>
	   <SET SEC <GETB ,GL-A-TIME <+ .T-PTR ,K-SEC>>>
	   <SET MIN <GETB ,GL-A-TIME <+ .T-PTR ,K-MIN>>>
	   <SET HRS <GETB ,GL-A-TIME <+ .T-PTR ,K-HRS>>>
	   <SET DAY <GETB ,GL-A-TIME <+ .T-PTR ,K-DAY>>>
	   <COND (<OR <AND <MC-T? .PARM>
			   <EQUAL? <RT-CLOCK-CMP .HRS .MIN .SEC
						 .DAY> -1>>
		      <AND <MC-F? .PARM>
			   <EQUAL? <RT-CLOCK-CMP .HRS .MIN .SEC
						 .DAY> -1 0>>>
		  <RT-CLOCK-SET .HRS .MIN .SEC .DAY>
		  <SET RTN .R-PTR>)>)>
    <INC R-PTR>>
  <COND (,RUN-SMELL-ETHERIUM?
	 <RT-SMELL-ETHERIUM?>
	 .R-CNT)>>
