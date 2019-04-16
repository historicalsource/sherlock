;"HINTS for SHERLOCK"
 
<FILE-FLAGS CLEAN-STACK?>

<GLOBAL GL-HINT-WARNING <>>
<GLOBAL GL-HINTS-OFF <>>

<ROUTINE V-HINTS-NO ()
	<COND (<NOT <MC-PRSO? ,ROOMS>>
	       <TELL ,K-DONT-UNDERSTAND-MSG CR>)
	      (T
	       <SETG GL-HINTS-OFF T>
	       <TELL "[Hints have been disallowed for this session.]" CR>)>
	<RFATAL>>

<CONSTANT RETURN-SEE-HINT " RETURN = see hint">
<CONSTANT RETURN-SEE-HINT-LEN <LENGTH " RETURN = see hint">>
<CONSTANT Q-MAIN-MENU "Q = main menu">
<CONSTANT Q-MAIN-MENU-LEN <LENGTH "Q = main menu">>

;"zeroth (first) element is 5"
<GLOBAL GL-LINE-TABLE
	<PTABLE
	  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22>>

;"zeroth (first) element is 4"
<CONSTANT GL-COLUMN-TABLE
	<PTABLE
	  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4  4>>

; "If the first argument is non-false, build a parallel impure table
   for storing the count of answers already seen; make it a constant
   under the given name."

<DEFINE20 CONSTRUCT-HINTS (COUNT-NAME "TUPLE" STUFF "AUX" (SS <>)
			   (HL (T)) (HLL .HL) V
			   (CL (T)) (CLL .CL)
			   TCL TCLL)
   <REPEAT ((CT 0))
     <COND (<OR <EMPTY? .STUFF>
		<TYPE? <1 .STUFF> STRING>>
	    ; "Chapter break"
	    <COND
	     (<NOT .SS>
	      ; "First one, just do setup"
	      <SET SS .STUFF>
	      <SET TCL (T)>
	      <SET TCLL .TCL>
	      <SET CT 0>)
	     (T
	      <SET V <SUBSTRUC .SS 0 <- <LENGTH .SS> <LENGTH .STUFF>>>>
	      ; "One chapter's worth"
	      <SET HLL <REST <PUTREST .HLL (<EVAL <FORM PLTABLE !.V>>)>>>
	      <COND (.COUNT-NAME
		     <SET CLL <REST <PUTREST .CLL
					     (<EVAL <FORM TABLE (BYTE)
							  !<REST .TCL>>>)>>>
		     <SET TCL (T)>
		     <SET TCLL .TCL>
		     <SET CT 0>)>
	      <SET SS .STUFF>)>
	    <COND (<EMPTY? .STUFF> <RETURN>)>
	    <SET STUFF <REST .STUFF>>)
	   (T
	    <COND (.COUNT-NAME
		   <COND (<1? <MOD <SET CT <+ .CT 1>> 2>>
			  <SET TCLL <REST <PUTREST .TCLL
						   (0)>>>)>)>
	    <SET STUFF <REST .STUFF>>)>>
   <COND (.COUNT-NAME
	  <EVAL <FORM CONSTANT .COUNT-NAME
		      <EVAL <FORM PTABLE !<REST .CL>>>>>)>
   <EVAL <FORM PLTABLE !<REST .HL>>>>

;"longest hint topic can be 17 chars"

<CONSTANT K-HINTS
  <CONSTRUCT-HINTS K-HINT-COUNTS
    "STARTERS"
    <PLTABLE "How do I get into the house?"
	     "Mrs Hudson is expecting you, so you shouldn't have to do
anything too unusual."
	     "Have you tried kicking down the door?"
	     "KNOCK ON THE DOOR.">
    <PLTABLE "How do I get into the parlour?"
	     "Mrs Hudson wants you to attend to something first."
	     "Get Holmes's mind off the drug.">
    <PLTABLE "How do I get into the kitchen?"
	     "Don't look at the next clue until you have opened the trap door in the hall."
	     "You're cheating, aren't you?"
	     "There is no trap door."
	     "There is no kitchen."
	     "Don't let the existence of these questions influence your playing of the game.">
    <PLTABLE "How do I get into the bedroom?"
	     "Only Holmes can open that door."
	     "When the visitor leaves, Holmes will open it.">
    <PLTABLE "How do I get onto the roof?"
	     "The same way you got into the kitchen.">
    <PLTABLE "Will Mrs Hudson do anything for me?"
	     "Have you tried kissing her?"
	     "Have you tried bribing her?"
	     "The sad fact is that she won't do anything for you.">
    <PLTABLE "Can I get Holmes out of his stupor?"
	     "Holmes is bored with the commonplace events of everyday life."
	     "He needs some mental excitement."
	     "Newspapers generally contain interesting items."
	     "For a doctor, you're not too bright. Read him the newspaper. (Or tell him about the visitor).">
    <PLTABLE "Why does the clue paper exist?"
	     "It looks like the thief is challenging Sherlock Holmes to a duel of wits."
	     "Unlike yourself, Sherlock is not unarmed for such a duel."
	     "The thief is laying down a trail of clues for Holmes to follow.">
    <PLTABLE "What's the answer to the 1st riddle?"
	     "The verse refers to a particular place."
	     "The place is the spot where most English royalty is buried."
	     "Westminster Abbey.">
    <PLTABLE "What's the answer to the 2nd riddle?"
	     "The verse refers to the last of the Tudor monarchs."
	     "She was called the \"Virgin Queen.\""
	     "Elizabeth I.">
    <PLTABLE "What's the answer to the 3rd riddle?"
	     "The discoverer of the law of gravity."
	     "Sir Isaac Newton.">
    <PLTABLE "What's the answer to the 4th riddle?"
	     "Don't read the next clue until you have thoroughly explored Westminster Abbey."
	     "Have you looked around in the Jerusalem Chamber?"
	     "The fourth verse refers to Henry V.">
    <PLTABLE "Where is the lamp?"
	     "It's in Holmes's bedroom.">
    <PLTABLE "Who is the thief?"
	     "Who do you think?">
    "CABS"
    <PLTABLE "How do I hail a cab?"
	     "Consult the sample transcript in your game manual.">
    <PLTABLE "Why does the growler cab get lost?"
	     "The driver is friendly, but stupid."
	     "The driver is stupid, but friendly."
	     "Give up. He'll never take you where you want to go.">
    "WESTMINSTER ABBEY"
    <PLTABLE "Are the tombs important?"
	     "They are to the people buried in them."
	     "Yes.">
    <PLTABLE "How do I make a brass rubbing?"
	     "Take a piece of paper from the pacquet of paper, put it on the
tomb of your choice, and then rub it with the crayon.">
    <PLTABLE "What should I make rubbings of?"
	     "Do not read the next clue until you have solved the verses on
the thief's clue paper."
	     "The tombs of Queen Elizabeth, Sir Isaac Newton and Henry V.">
    <PLTABLE "Why am I making brass rubbings?"
	     "The thief is trying to send messages to Sherlock."
	     "He wouldn't want his messages to be visible to everyone, now would he?"
	     "Have you visited the British Museum yet?"
	     "The book on the table in the British Museum contains a clue
that will help you."
	     "There is some invisible writing on some of the tombs."
	     "When you make a rubbing, the invisible ink is transferred
onto the back of the paper."
	     "Invisible ink usually becomes visible when heated."
	     "Heat the paper over the candles in the Evangelist Chapel."
	     "Turn the paper over.">
    <PLTABLE "Where is the Stone of Scone?"
	     "It belongs under the Coronation Chair in Edward the Confessor's
Chapel - but we knew it was going to be stolen in 1950 and then returned
several months later.  We figured that was enough excitement for any one rock,
so we left it out of the game, safe from your grubby paws.">
    <PLTABLE "What's the Son of Mars answer?"
	     "Admiral Lord Nelson.">
    <PLTABLE "What's the Chopper answer?"
	     "Charles I.">
    <PLTABLE "What's the London Bridge answer?"
	     "Under London Bridge.">
    <PLTABLE "What's the answer to life's riddle?"
	     "If we knew that, do you think we'd be sitting around writing games?">
    <PLTABLE "What's the Pussycat answer?"
	     "Go to the Tower of London.">
    <PLTABLE "What's the Number answer?"
	     "Have you looked at the statue of William the Conqueror?"
	     "Have you read the sign on the Monument?"
	     "Have you ever read the Charge of the Light Brigade?"
	     "600.">
    <PLTABLE "How about Hickory Dickory Dock?"
	     "Big Ben.">
    "BRITISH MUSEUM"
    <PLTABLE "How do I get past the librarian?"
	     "Think of the room not as a museum, but as a library."
	     "Have you read the sign on the librarian's desk?"
	     "Has it occurred to you that he's doing an awful lot of talking?"
	     "Tell him to be quiet.">
    "ST PAUL'S"
    <PLTABLE "What is a Whispering Gallery?"
	     "It is a place where you can eavesdrop on other people from
far away.">
    <PLTABLE "How do I get up there?"
	     "Take the stairs up from the clerestory.">
    <PLTABLE "How do I get to the clerestory?"
	     "You can't. St Paul's isn't even in the game."
	     "We just like the word clerestory.">
    "TRAFALGAR SQUARE"
    <PLTABLE "Are the pigeons important?"
	     "Only to other pigeons.">
    <PLTABLE "Is the statue important?"
	     "Yes."
	     "Have you looked at it?"
	     "Have you looked at it closely?"
	     "Have you looked at it through a telescope?">
    <PLTABLE "Is the column important?"
	     "Yes."
	     "If it wasn't there, we'd have to come up with some other way
of keeping the statue out of your reach.">
    <PLTABLE "Is anything important?"
	     "Like, wow, man.  Heavy question!">
    "ON THE THAMES"
    <PLTABLE "How do I stop rowing in circles?"
	     "Has anyone told you you're not playing with a full deck?"
	     "Has anyone told you you're not rowing with both oars in the water?"
	     "You need two oars to steer the boat."
	     "Don't read the next two clues unless you want to know where the other oar is."
	     "The other oar is in another boat."
	     "It's in Captain Bligh's boat in the Black Museum.">
    <PLTABLE "How do I stop the boat?"
	     "Type, 'Whoa, Boat!'"
	     "Just kidding. Drop the anchor.">
    <PLTABLE "How do I launch the boat?"
	     "Got any rocket fuel?"
	     "Type, 'Launch boat.'"
	     "(Make sure you're in the boat and the anchor's up first.)">
    <PLTABLE "How do I land the boat?"
	     "You can only land the boat at the Embankment or outside Traitor's Gate."
	     "Type: N or LAND BOAT.">
    <PLTABLE "How do I get the paddle?"
	     "You can't get the paddle when you're outside Traitor's Gate."
	     "If you don't have the paddle, you need two oars to row back up the river."
	     "If you're on the river without a paddle or both oars, you're making a big mistake."
	     "You can only take the paddle after you've entered the Tower.">
    <PLTABLE "Can I stop the man taking the boat?"
	     "No, you can't. But after all, it's his boat.">
    "VICTORIA STATION"
    <PLTABLE "What time does the last train leave?"
	     "The timetable is posted on the wall."
	     "9:15 p.m.">
    <PLTABLE "What track does it leave from?"
	     "Track 29.">
    <PLTABLE "How much is a round-trip ticket?"
	     "Why are you reading clues about a place that isn't even in the game?">
    "COVENT GARDEN"
    <PLTABLE "What is the matter with the girl?"
	     "She has a bad heart."
	     "Perhaps some medicine...."
	     "Be careful. Drugs are dangerous.">
    <PLTABLE "How do I revive her?"
	     "Have you made a positive diagnosis?"
	     "Listen to the girl with your stethoscope."
	     "If her heart is abnormally fast, give her something to slow it down."
	     "An unusually fast heartbeat is known as tachycardia."
	     "If her heart is abnormally slow, give her something to speed it up."
	     "An unusually slow heartbeat is know as bradycardia."
	     "Belladonna will speed up a slow heart."
	     "Digitalis will slow down a fast heart."
	     "The drugs are in your medicine bag.">
    <PLTABLE "Where is the stethoscope?"
	     "Where do most doctors carry their stethoscopes?"
	     "You are not most doctors."
	     "You have it when you start the game."
	     "Sorry about this. It turns out that Watson always carries his
stethoscope in his hat. Really. (Read \"A Scandal in Bohemia.\")">
    "MADAME TUSSAUD'S"
    <PLTABLE "How do I get past the guard dog?"
	     "He won't let you carry any matches inside."
	     "OK. So you already knew that."
	     "He won't let you carry in any flames that he can see."
	     "Alright, so you knew that too.  How about flames that he can't see?"
	     "Something that burns without a flame, for example."
	     "Like tobacco maybe."
	     "Light the pipe, drop the match, and go on in.">
    <PLTABLE "What do I do with the axe?"
	     "The axe doesn't do much except cut down on the number of other things you can carry.">
    <PLTABLE "How can I light the torch?"
	     "Light it from something that's already burning."
	     "Light it from a burning piece of paper."
	     "Light a piece of paper from the pipe, and then use it to light the torch.">
    "SCOTLAND YARD"
    <PLTABLE "Will Lestrade talk to me in his office?"
	      "He doesn't like you."
	      "He really doesn't like you."
	      "What office?">
    "BANK OF ENGLAND"
    <PLTABLE "How do I get inside the bank?"
	     "Despite the guard's assertions to the contrary, he can be bribed."
	     "Give him something valuable."
	     "Some gems might do the trick."
	     "Give him the ruby, the sapphire, the emerald and the opal.">
    <PLTABLE "How do I get inside the vault?"
	     "The door has a combination lock on it."
	     "The tumblers turn too quietly for you to hear without amplification."
	     "Listen to the door with the stethoscope, and then turn the dial left or right."
	     "A 'clunk' means you're going the wrong way."
	     "A 'whirr' means you're going the right way."
	     "A 'click' means you should reverse directions."
	     "The combination is right twice, left once, right twice.">
    <PLTABLE "Which box should I open?"
	     "Have you solved the second clue on Sir Isaac Newton's tomb?"
	     "Open box 600.">
    <PLTABLE "How do I open safety deposit boxes?"
	     "Do you have any dynamite?"
	     "Try using a key."
	     "The bank guard has it."
	     "It's in his pocket."
	     "How good a pickpocket are you?"
	     "How good a pickpocket are the people you know?"
	     "Ask Wiggins to steal it.">
    <PLTABLE "How can I stop the kidnapping?"
	     "Hire bodyguards."
	     "Put Holmes in your medical bag."
	     "You can't.">
    "DIOGENES CLUB"
    <PLTABLE "What does Mycroft want from me?"
	     "Your blood?"
	     "Your first-born male child?"
	     "Sherlock's ring.">
    <PLTABLE "How do I get the token?"
	     "Show any of the gems you have found to Sherlock.">
    "TOWER OF LONDON"
    <PLTABLE "How do I get into the Tower?"
	     "Give the password to the beefeater."
	     "You must get the password from someone who has government connections."
	     "Mycroft Holmes knows the password."
	     "Don't continue unless Sherlock Holmes has been kidnapped."
	     "Go to the Diogenes Club and ask for Mycroft. The butler will
ask you for a token. Give him the token. Mycroft will appear and give
you the password."
	     "Return to the Tower and give the guard the password."
	     "Just type GUARD, [PASSWORD].">
    <PLTABLE "How do I get out of the Tower?"
	     "The beefeater won't let you out. You must find another exit."
	     "The only other way out is through Traitor's Gate."
	     "The portcullis is operated by the chain above it."
	     "You do not weigh enough to pull down the chain."
	     "Put on the suit of armour in the dungeon of the White Tower and then pull on the chain.">
    "GEMS"
    <PLTABLE "Where is the diamond?"
	     "What diamond?">
    <PLTABLE "How do I get the diamond?"
	     "See previous hint.">
    <PLTABLE "Where is the sapphire?"
	     "Did you solve the Hickory Dickory Dock riddle?"
	     "It's stuck to the clapper of Big Ben.">
    <PLTABLE "How do I get the sapphire?"
	     "Have you tried driving a hook into the ceiling, throwing a rope
over the hook, climbing up onto the rail, swinging across the hollow shaft
while screaming like Tarzan, and grabbing the sapphire as you swing by?"
	     "Just asking."
	     "Wait until the hour strikes. The clapper will swing your way."
	     "You need to use your hands while the bell is ringing."
	     "Put the cotton balls in your ears before the bell starts to ring."
	     "The cotton balls are in the blue pill bottle.">
    <PLTABLE "Where is the ruby?"
	     "Did you solve the Son of Mars riddle?"
	     "It's somewhere in Trafalgar Square."
	     "It's on the statue in Trafalgar Square."
	     "It's in Nelson's blind eye."
	     "You can discover it only by looking through the telescope.">
    <PLTABLE "How do I get the ruby?"
	     "You can't get up there."
	     "Someone - or something - else will have to get it for you."
	     "Some kind of trained bird might do it."
	     "Old Sherman, who lives in Pinchin Lane, trains animals."
	     "Get the bird from Sherman. Take it to Trafalgar Square. Show
the ruby to the pigeon, ask him to get it, and then let him go."
	     "Do not read the next clue until you have done all of the above."
	     "Did we mention that it's a homing pigeon?"
	     "Return to Sherman's shop and ask him about the bird.">
    <PLTABLE "Where is the emerald?"
	     "Did you solve the Chopper riddle?"
	     "It's in the Chamber of Horrors."
	     "It's hidden in one of the statues."
	     "It's in the wax head of Charles I.">
    <PLTABLE "How do I get the emerald?"
	     "It's encased in wax. What springs to mind?"
	     "You need to melt the head."
	     "You can't melt the head unless you remove it from the statue."
	     "You need something that puts out enough heat to melt a big gob of wax."
	     "The torch will melt the wax head.">
    <PLTABLE "Where is the sceptre?"
	     "In the sceptre tank?"
	     "Sorry about that."
	     "There is no sceptre.">
    <PLTABLE "How do I get the sceptre?"
	     "Dive into the sceptre tank."
	     "Don't blame us. You're the one who keeps reading these bogus clues.">
    "MORE GEMS"
    <PLTABLE "Where is the opal?"
	     "Have you solved the London Bridge riddle?"
	     "It's in the clump of moss under London Bridge.">
    <PLTABLE "How do I get the opal?"
	     "Can you lower the bridge?"
	     "Can you raise the water?"
	     "Wait for high tide."
	     "The newspaper that came with your game contains the tide tables for the weekend.">
    <PLTABLE "Where is the zorkmid?"
	      "It's in the... oops.  Sorry.  Wrong game.">
    <PLTABLE "How do I get the zorkmid?"
	      "Buy Zork I."
	      "Buy Enchanter."
	      "Buy Sorcerer."
	      "You get the idea.">
    <PLTABLE "Where is the topaz?"
	     "In a safety deposit box in the Bank of England."
	     "Have you solved the number riddle?"
	     "It's in box 600.">
    <PLTABLE "How do I get the topaz?"
	     "See the clues for the Bank of England.">
    <PLTABLE "Where is the garnet?"
	     "Did you solve the Tower of London riddle?"
	     "It's in the butt of malmsey in the Bowyer Tower.">
    <PLTABLE "How do I get the garnet?"
	     "Have you tried drinking the wine?"
	     "Pretty tasty stuff, isn't it?"
	     "You need to drain the keg somehow."
	     "You need to remove the bung."
	     "Knock out the bung with the mace."
	     "Don't read the next clue until you have done all of the above."
	     "Ask Wiggins to get the garnet for you.">
    <PLTABLE "Why are the gems important?"
	     "You don't think the thief has been hiding gems all over London just for the fun of it, do you?"
	     "Perhaps he is trying to send Sherlock yet another message."
	     "Have you looked at any of the gems?"
	     "Have you looked at any of them closely?"
	     "Look at each of the gems through the magnifying glass.">
    "THE LAIR"
    <PLTABLE "Can I stop Akbar's knocking me out?"
	     "Knock him out first."
	     "Perhaps you could smuggle something in."
	     "Have you noticed the henchman's religion?"
	     "He probably won't disturb your hat."
	     "Perhaps the etherium ampoule....">
    <PLTABLE "Can I stop Moriarty when I wake up?"
	     "If he is free to move around, he will always win."
	     "Tie him up."
	     "Don't forget to tie up the henchman, too.">
    "MISCELLANEOUS"
    <PLTABLE "Why do I finish without 100 points?"
	     "If you play the game from start to finish and solve all
the puzzles, you will end up with 100 points. If, however, you start the
game and play through it using information you acquired in a previous
session, you may have neglected to perform a few actions for which you
received points. This should not be of concern to anyone who is content
with failing to discover the highest ranking available to the game player.">
    <PLTABLE "Can I abbreviate \"stethoscope\"?"
	     "Yes. It can be abbreviated to STETH or SS.">
    <PLTABLE "What is the square root of 64?"
	      "Eight.">>>

<GLOBAL GL-CUR-POS 0>	;"determines where to place the highlight cursor
			  Can go up to 17 Questions"

<GLOBAL GL-QUEST-NUM 1> ;"shows in HINT-TBL ltable which QUESTION it's on"

<GLOBAL GL-CHAPT-NUM 1>	;"shows in HINT-TBL ltable which CHAPTER it's on"

<CONSTANT GL-DIROUT-TBL
	  <TABLE 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
	       0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 >>

<ROUTINE V-HINT ("AUX" CHR MAXC (C <>) Q (WHO <>))
  <COND (,GL-HINTS-OFF
	 <RT-PERFORM ,V?HINTS-NO ,ROOMS>
	 <RFATAL>)
	(<NOT ,GL-HINT-WARNING>
	 <SETG GL-HINT-WARNING T>
	 <TELL
"[Warning: It is recognized that the temptation for help may at times be so
exceedingly strong that you might fetch hints prematurely. Therefore, you may
at any time during the story type HINTS OFF, and this will disallow the
seeking out of help for the present session of the story. If you still want a
hint now, indicate HINT.]" CR>
	 <RFATAL>)
	(<NOT .WHO>
	 <SET WHO <RT-WHO-SAYS?>>
	 <COND (<EQUAL? .WHO ,CH-HOLMES ,CH-WIGGINS>
		<COND (<EQUAL? .WHO ,CH-HOLMES>
		       <TELL
"Holmes looks at you impatiently and sighs, \"Very well, Watson. If you
must.\"">)
		      (T
		       <TELL
"Wiggins looks up at you with relief and says, \"Good idea, guv. We'll never
work this out on our own.\"">)>
		<TELL CR CR "[Press any key to continue.]" CR>
		<INPUT 1>)>)>
  <IFSOUND ;<SET X <GET ,SOUND-FLAG 0>>
	   <SETG SOUND-QUEUED? <>>
	   <KILL-SOUNDS>>
  ;<BUFOUT <>>
  <SET MAXC <GET ,K-HINTS 0>>
  <RT-INIT-HINT-SCREEN>
  <CURSET 5 1>
  <RT-PUT-UP-CHAPTERS>
  <SETG GL-CUR-POS <- ,GL-CHAPT-NUM 1>>
  <RT-NEW-CURSOR>
  <REPEAT ()
	  <SET CHR <INPUT 1>>
	  <COND (<EQUAL? .CHR !\Q !\q>
		 <SET Q T>
		 <RETURN>)
		(<EQUAL? .CHR !\N !\n>
		 <RT-ERASE-CURSOR>
		 <COND (<EQUAL? ,GL-CHAPT-NUM .MAXC>
			<SETG GL-CUR-POS 0>
			<SETG GL-CHAPT-NUM 1>
			<SETG GL-QUEST-NUM 1>)
		       (T
			<SETG GL-CUR-POS <+ ,GL-CUR-POS 1>>
			<SETG GL-CHAPT-NUM <+ ,GL-CHAPT-NUM 1>>
			<SETG GL-QUEST-NUM 1>)>
		 <RT-NEW-CURSOR>)
		(<EQUAL? .CHR !\P !\p>
		 <RT-ERASE-CURSOR>
		 <COND (<EQUAL? ,GL-CHAPT-NUM 1>
			<SETG GL-CHAPT-NUM .MAXC>
			<SETG GL-CUR-POS <- .MAXC 1>>)
		       (T
			<SETG GL-CUR-POS <- ,GL-CUR-POS 1>>
			<SETG GL-CHAPT-NUM <- ,GL-CHAPT-NUM 1>>)>
		 <SETG GL-QUEST-NUM 1>
		 <RT-NEW-CURSOR>)
		(<EQUAL? .CHR 13 10>
		 <RT-PICK-QUESTION>
		 <RETURN>)>>
  <COND (<NOT .Q>
	 <AGAIN>	;"AGAIN does whole routine?")>
  <CLEAR -1>
  <V-REFRESH>
  <SET WHO <RT-WHO-SAYS?>>
  <COND (<EQUAL? .WHO ,CH-HOLMES>
	 <TELL CR
"Holmes barely glances at you and snaps, \"At last. Now may we proceed?\"" CR>)
	(<EQUAL? .WHO ,CH-WIGGINS>
	 <TELL CR
"Wiggins tugs your sleeve and asks hopefully, \"Learn anything?\"" CR>)
	(T
	 <TELL CR "Back to the story..." CR>)>
  <IFSOUND <COND (,SOUND-ON?
		  <CHECK-LOOPING>)>>
  ;<IFSOUND <COND (<G? .X 1>
		  <SOUNDS </ .X 16> ,S-START <MOD .X 16>>)>>
  <RFATAL>>

<ROUTINE RT-PICK-QUESTION ("AUX" CHR MAXQ (Q <>))
  <RT-INIT-HINT-SCREEN <>>
  <RT-LEFT-LINE 3 ,RETURN-SEE-HINT ,RETURN-SEE-HINT-LEN>
  <RT-RIGHT-LINE 3 ,Q-MAIN-MENU ,Q-MAIN-MENU-LEN>
  <SET MAXQ <- <GET <GET ,K-HINTS ,GL-CHAPT-NUM> 0> 1>>
  <CURSET 5 1>
  <RT-PUT-UP-QUESTIONS>
  <SETG GL-CUR-POS <- ,GL-QUEST-NUM 1>>
  <RT-NEW-CURSOR>
  <REPEAT ()
    <SET CHR <INPUT 1>>
    <COND (<EQUAL? .CHR !\Q !\q>
	   <SET Q T>
	   <RETURN>)
	  (<EQUAL? .CHR !\N !\n>
	   <RT-ERASE-CURSOR>
	   <COND (<EQUAL? ,GL-QUEST-NUM .MAXQ> ; "Wrap around on N"
		  <SETG GL-CUR-POS 0>
		  <SETG GL-QUEST-NUM 1>)
		 (T
		  <SETG GL-CUR-POS <+ ,GL-CUR-POS 1>>
		  <SETG GL-QUEST-NUM <+ ,GL-QUEST-NUM 1>>)>
	   <RT-NEW-CURSOR>)
	  (<EQUAL? .CHR !\P !\p>
	   <RT-ERASE-CURSOR>
	   <COND (<EQUAL? ,GL-QUEST-NUM 1>
		  <SETG GL-QUEST-NUM .MAXQ>
		  <SETG GL-CUR-POS <- .MAXQ 1>>)
		 (T
		  <SETG GL-CUR-POS <- ,GL-CUR-POS 1>>
		  <SETG GL-QUEST-NUM <- ,GL-QUEST-NUM 1>>)>
	   <RT-NEW-CURSOR>)
	  (<EQUAL? .CHR 13 10>
	   <RT-DISPLAY-HINT>
	   <RETURN>)>>
  <COND (<NOT .Q>
	 <AGAIN>)>>

<ROUTINE RT-ERASE-CURSOR ()
	<CURSET <GET ,GL-LINE-TABLE ,GL-CUR-POS>
		<- <GET ,GL-COLUMN-TABLE ,GL-CUR-POS> 2>>
	<TELL " ">	;"erase previous highlight cursor">

;"go back 2 spaces from question text, print cursor and flash is between
the cursor and text"

<ROUTINE RT-NEW-CURSOR ()
	<CURSET <GET ,GL-LINE-TABLE ,GL-CUR-POS>
		<- <GET ,GL-COLUMN-TABLE ,GL-CUR-POS> 2 ;1>>
	<TELL ">">	;"print the new cursor">

<ROUTINE RT-INVERSE-LINE ("AUX" (CENTER-HALF <>)) 
	<HLIGHT ,K-H-INV>
	<RT-PRINT-SPACES <LOWCORE SCRH>>
	<HLIGHT ,K-H-NRM>>

<ROUTINE RT-DISPLAY-HINT ("AUX" H MX (CNT 2) CHR (FLG T) N CV
			  SHIFT? COUNT-OFFS)
  <CLEAR -1>
  <SPLIT 3>
  <SCREEN ,K-S-WIN>
  <CURSET 1 1>
  <RT-INVERSE-LINE>
  <RT-CENTER-LINE 1 "INVISICLUES (tm)" <STRLENGTH "INVISICLUES (tm)">>
  <CURSET 3 1>
  <RT-INVERSE-LINE>
  <RT-LEFT-LINE 3 "RETURN = see new hint">
  <RT-RIGHT-LINE 3 "Q = see hint menu" <STRLENGTH "Q = see hint menu">>
  <CURSET 2 1>
  <RT-INVERSE-LINE>
  <HLIGHT ,K-H-BLD>
  <SET H <GET <GET ,K-HINTS ,GL-CHAPT-NUM> <+ ,GL-QUEST-NUM 1>>>
  ; "Byte table to use for showing questions already seen"
  ; "Actually a nibble table.  The high four bits of each byte are for
     quest-num odd; the low for bits are for quest-num even.  See SHIFT?
     and COUNT-OFFS."
  <SET CV <GET ,K-HINT-COUNTS <- ,GL-CHAPT-NUM 1>>>
  <RT-CENTER-LINE 2 <GET .H 1 ;,K-HINT-QUESTION>>
  <HLIGHT ,K-H-NRM>
  <SET MX <GET .H 0>>
  <SCREEN ,K-S-NOR>
  <CRLF>
  <SET SHIFT? <MOD ,GL-QUEST-NUM 2>>
  <SET COUNT-OFFS </ <- ,GL-QUEST-NUM 1> 2>>
  <REPEAT ((CURCX <GETB .CV .COUNT-OFFS>)
	   (CURC <+ 2 <ANDB <COND (.SHIFT? <LSH .CURCX -4>)
				  (T .CURCX)> *17*>>))
    <COND (<==? .CNT .CURC>
	   <RETURN>)
	  (T
	   <TELL <GET .H .CNT> CR ;CR>
	   <SET CNT <+ .CNT 1>>)>>
  <REPEAT ()
     <COND (<AND .FLG <G? .CNT .MX>>
	    <SET FLG <>>
	    <TELL "[That's all.]" CR>)
	   (.FLG
	    <SET N <+ <- .MX .CNT> 1>>
	    <TELL "[" N .N " hint">
	    <COND (<NOT <EQUAL? .N 1>>
		   <TELL "s">)>
	    <TELL " left.]" ;CR ;CR " -> ">
	    <SET FLG <>>)>
     <SET CHR <INPUT 1>>
     <COND (<EQUAL? .CHR !\Q !\q>
	    <COND (.SHIFT?
		   <PUTB .CV .COUNT-OFFS
			 <ORB <ANDB <GETB .CV .COUNT-OFFS> *17*>
			      <LSH <- .CNT 2> 4>>>)
		  (T
		   <PUTB .CV .COUNT-OFFS
			 <ORB <ANDB <GETB .CV .COUNT-OFFS> *360*>
			      <- .CNT 2>>>)>
	    <RETURN>)
	   (<EQUAL? .CHR 13 10>
	    <COND (<L=? .CNT .MX>
		   <SET FLG T>	;".cnt starts as 2"
		   <TELL <GET .H .CNT> ;CR CR>
		   ; "3rd = line 7, 4th = line 9, ect"
		   <COND (<G? <SET CNT <+ .CNT 1>> .MX>
			  <SET FLG <>>
			  <TELL "[Final hint]" CR>)>)>)>>>

<ROUTINE RT-PUT-UP-QUESTIONS ("AUX" (ST 1) MXQ MXL)
  <SET MXQ <- <GET <GET ,K-HINTS ,GL-CHAPT-NUM> 0> 1>>
  <SET MXL <- <LOWCORE SCRV> 1>>
  <REPEAT ()
	  <COND (<G? .ST .MXQ>
		 <RETURN>)
		(T                        ;"zeroth"
		 <CURSET <GET ,GL-LINE-TABLE <- .ST 1>>
				<- <GET ,GL-COLUMN-TABLE <- .ST 1>> 1>>)>
	  <TELL " " <GET <GET <GET ,K-HINTS ,GL-CHAPT-NUM> <+ .ST 1>> 1>>
	  <SET ST <+ .ST 1>>>>

<ROUTINE RT-PUT-UP-CHAPTERS ("AUX" (ST 1) MXC MXL)
  <SET MXC <GET ,K-HINTS 0>>
  <SET MXL <- <LOWCORE SCRV> 1>>
  <REPEAT ()
    <COND (<G? .ST .MXC>
	   <RETURN>)
	  (T                        ;"zeroth"
	   <CURSET
	    <GET ,GL-LINE-TABLE <- .ST 1>>
	    <- <GET ,GL-COLUMN-TABLE <- .ST 1>> 1>>)>
    <TELL " " <GET <GET ,K-HINTS .ST> 1 ;,GL-HINT-QUEST>>
    <SET ST <+ .ST 1>>>>

<ROUTINE RT-INIT-HINT-SCREEN ("OPTIONAL" (THIRD T))
  <CLEAR -1>
  <SPLIT <- <LOWCORE SCRV> 1>>
  <SCREEN ,K-S-WIN>
  <CURSET 1 1>
  <RT-INVERSE-LINE>
  <CURSET 2 1>
  <RT-INVERSE-LINE>
  <CURSET 3 1>
  <RT-INVERSE-LINE>
  <RT-CENTER-LINE 1 "INVISICLUES (tm)" <STRLENGTH "INVISICLUES (tm)">>
  <RT-LEFT-LINE 2 " N = Next">
  <RT-RIGHT-LINE 2 "P = Previous" <STRLENGTH "P = Previous">>
  <COND (<MC-T? .THIRD>
	 <RT-LEFT-LINE 3 " RETURN = See hint">
	 <RT-RIGHT-LINE 3 "Q = Resume story" <STRLENGTH "Q = Resume story">>)>>

<ROUTINE RT-CENTER-LINE (LN STR "OPTIONAL" (LEN 0) (INV T))
  <COND (<ZERO? .LEN>
	 <DIROUT ,K-D-TBL-ON ,GL-DIROUT-TBL ;,SLINE>
	 <TELL .STR>
	 <DIROUT ,K-D-TBL-OFF>
	 <SET LEN <GET ,GL-DIROUT-TBL ;,SLINE 0>>)>
  <CURSET .LN </ <- <LOWCORE SCRH> .LEN> 2>>
  <COND (.INV
	 <HLIGHT ,K-H-INV>)>
  <TELL .STR>
  <COND (.INV
	 <HLIGHT ,K-H-NRM>)>>

<ROUTINE RT-LEFT-LINE (LN STR "OPTIONAL" (INV T))
	<CURSET .LN 1>
	<COND (.INV
	       <HLIGHT ,K-H-INV>)>
	<TELL .STR>
	<COND (.INV
	       <HLIGHT ,K-H-NRM>)>>

<ROUTINE RT-RIGHT-LINE (LN STR "OPTIONAL" (LEN 0) (INV T))
	<COND (<ZERO? .LEN>
	       <DIROUT 3 ,GL-DIROUT-TBL ;,SLINE>
	       <TELL .STR>
	       <DIROUT -3>
	       <SET LEN <GET ,GL-DIROUT-TBL ;,SLINE 0>>)>
	<CURSET .LN <- <LOWCORE SCRH> .LEN>>
	<COND (.INV
	       <HLIGHT ,K-H-INV>)>
	<TELL .STR>
	<COND (.INV
	       <HLIGHT ,K-H-NRM>)>>


