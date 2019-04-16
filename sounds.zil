"SOUNDS for SHERLOCK"

;"SOUND sound-id,[action],[volume]"

<REPLACE-DEFINITION SOUND-CODE

<GLOBAL SOUND-QUEUED? <>> ;"N = non-looping sound running"
<GLOBAL LOOPING? -1> ;"-1 = sound never seen, 0 = no looping, N = looping sound
			partially replaces SOUND-FLAG 0"
<GLOBAL SOUND-ON? T> ;"T = sound on; F = sound off; partially replaces S-F 0"
<GLOBAL LOOP-VOL 0>  ;"replaces SOUND-FLAG second element"
;<GLOBAL SOUND-FLAG <TABLE -1 0>> ;"first element -1 = sound never seen
				 		  0 = sound off
						  1 = sound on
					more than 1 = looping sound"

<ROUTINE SOUNDS (N "OPT" (OP ,S-START) (VOL 8) (NUM 1) RTN)
	 ;<COND (<ZERO? .OP> <SET OP ,S-START>)> ;"arg. never passed as 0"
	 <COND (<AND <L? ,LOOPING? 0>
		     <EQUAL? .OP ,S-START>>
		<SETG LOOPING? 0>
		<TELL CR
"[Use $SOUND to toggle sound usage on and off.]" CR>)>
	 <COND (<AND <==? .OP ,S-INIT>
		     <OR ,SOUND-QUEUED?
			 ,LOOPING?>>
		<RTRUE>)>
	 <COND ;(<EQUAL? .N ,S-ARMOR>	;"other 'default' settings"
		<SET NUM 2>)
	       (<==? .N ,S-CROWD>	;"fine tuning volumes"
		<SET VOL 6>)
	       (<==? .N ,S-BADVIOL>
		<SET VOL 6>)>
	 <COND (<EQUAL? .N ,S-CROWD ,S-BOATING ,S-SNORE>  ;"looping sounds"
		<COND (<==? .OP ,S-START>
		       <SETG LOOPING? .N>
		       <SETG LOOP-VOL .VOL> 
		       ;<PUT ,SOUND-FLAG 1 <+ <* .N 16> .VOL>>
		       <SET NUM -1>)
		      (<==? .OP ,S-STOP>
		       <SETG LOOPING? 0>)>
		<COND (,SOUND-QUEUED?
		       <RTRUE>)>)
	       (T
		<COND (<F? .RTN>
		       <SET RTN ,CHECK-LOOPING>)>)>
	 <COND (,SOUND-ON?
		;<PUT ,SOUND-FLAG 0 1>
		;<PUT ,SOUND-FLAG 1 0>
		<COND (<EQUAL? .OP ,S-START>
		       <COND (<N==? .N ,S-CROWD ,S-BOATING ,S-SNORE>
			      <SETG SOUND-QUEUED? .N>)>
		       <SOUND .N .OP <BOR <LSH .NUM 8> .VOL> .RTN>)
		      (T
		       <SOUND .N .OP>)>)>
	 <RTRUE>>

<ROUTINE CHECK-LOOPING ()
    <SETG SOUND-QUEUED? <>>
    <COND (<G? ,LOOPING? 0>
	   <SOUNDS ,LOOPING? ,S-START ,LOOP-VOL>)>
    <RTRUE>>

<GLOBAL CAB-RAMP 0>

;<ROUTINE RT-S-WHISTLE-TWICE ()
    <SETG CAB-RAMP 2>
    <RT-S-CAB-ARRIVES>>

<ROUTINE RT-S-CAB-ARRIVES ()
    <COND (<==? ,CAB-RAMP 0>
	   <SOUNDS ,S-HORSE ,S-START 4>)
	  (T
	   <SETG CAB-RAMP <- ,CAB-RAMP 1>>
	   <SOUNDS ,S-HORSE ,S-START <- 2 ,CAB-RAMP> 1 RT-S-CAB-ARRIVES>)>>

<ROUTINE RT-S-CAB-LEAVES ()
    <COND (<OR <F? ,SOUND-QUEUED?>
	       <==? ,SOUND-QUEUED? ,S-HORSE>>
	   <SETG CAB-RAMP 2>
	   <RT-S-CAB-GOES>)>>

<ROUTINE RT-S-CAB-GOES ()
    <COND (<==? ,CAB-RAMP 0>
	   <SOUNDS ,S-HORSE ,S-START 1>)
	  (T
	   <SETG CAB-RAMP <- ,CAB-RAMP 1>>
	   <SOUNDS ,S-HORSE ,S-START <* <+ ,CAB-RAMP 1> 2> 1 RT-S-CAB-GOES>)>> 

<ROUTINE END-FANFARE ()
	 <SETG SOUND-QUEUED? <>>
	 <KILL-SOUNDS>>

<ROUTINE KILL-SOUNDS ()
	 <COND (<N==? ,SOUND-QUEUED? ,S-FANFARE>
		<SETG SOUND-QUEUED? <>>
		<SOUNDS 0 ,S-STOP>
		;<SOUNDS 0 ,S-CLEANUP>)>
	 <RTRUE>>

<SYNTAX $SOUND = V-$SOUND>

<ROUTINE V-$SOUND ()
	;<SET X <GET ,SOUND-FLAG 1>>
	;<SET Y <GET ,SOUND-FLAG 0>>
	<COND (<L? ,LOOPING? 0>
	       <SETG LOOPING? 0>)>
	<TELL "Sound ">
	<COND (,SOUND-ON?
	       <SETG SOUND-QUEUED? <>>
	       <KILL-SOUNDS>
	       <SETG SOUND-ON? <>>
	       ;<COND (<N==? .Y 1> <PUT ,SOUND-FLAG 1 .Y>)
		     (ELSE <PUT ,SOUND-FLAG 1 0>)>
	       <TELL "off." CR>)
	      (T
	       <TELL "on." CR>
	       <SETG SOUND-ON? T>
	       <CHECK-LOOPING>)>>

;"sound operations"
<CONSTANT S-INIT 1>
<CONSTANT S-START 2>
<CONSTANT S-STOP 3>
<CONSTANT S-CLEANUP 4>

;"sound ids		(sounds marked with a * are looping sounds)"
<CONSTANT S-BEEP 1>
<CONSTANT S-BOOP 2>
<CONSTANT S-ARMOR 3>	;"33K armor squeaking - worn, removed, moving"
<CONSTANT S-BADVIOL 4>	;"39K Watson playing violin"
<CONSTANT S-BARK 5>	;" 7K dog barking"
<CONSTANT S-BOATING 6>	;"54K * background water sounds (while in boat)"
<CONSTANT S-CLOCK 7>	;"47K Big Ben striking close up (long ring)"
<CONSTANT S-CROWD 8>	;"61K * crowd noises"
<CONSTANT S-FANFARE 9>	;"57K trumpets for ending"
<CONSTANT S-GROWL 10>	;"51K dog growling"
<CONSTANT S-HEART1 11>	;"14K slow heartbeat" ;"3 hearts share same sound code"
<CONSTANT S-HEART2 12>	;"14K medium heartbeat"
<CONSTANT S-HEART3 13>	;"14K fast heartbeat"
<CONSTANT S-HORSE 14>	;"40K sounds of cab moving"
<CONSTANT S-VIOLIN 15>	;"48K Holmes playing violin"
<CONSTANT S-SNORE 16>	;"50K * snoring in Diogenes club" 
<CONSTANT S-FARBEN 17>  ;"    Big Ben at a distance (short ring)"
;<CONSTANT S-WHISTLE 18> ;"  K Whistle for calling cabs"

;"unused sounds - S-SPLASH S-BIRDIE"
;"WANTED - S-WHISTLE"

> ;"end of REPLACE-DEFINITION SOUND-CODE"
