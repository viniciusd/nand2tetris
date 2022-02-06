// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Initialize memory
@R0
M=0
@R1
M=0
@KBD
M=0
(LOOP)
	@KBD
	D=M
	@KEYDOWN
	D;JNE // If key pressed, go to KEYDOWN
	@R0
	M=0 // Let us store the "white" pixel in R0
	@COLORING
	0;JMP
	(KEYDOWN)
		@R0
		M=-1 // Let us store the "black" pixel in R0
	(COLORING)
		@8191 // The screen has got 8192 successive words
		D=A
		@i
		M=D // Initialize i at end of screen (i.e. SCREEN+8191)
		(INNERLOOP)
			@i
			D=M // Fetch the value of i into D
			@SCREEN
			D=A+D // Get the screen word we will change
			@R1
			M=D // Store the screen location
			@R0
			D=M // Fetch color
			@R1
			A=M // Go to screen location
			M=D // Paint!
			@i
			M=M-1 // i--
			D=M // Let us check the value of i...
			@INNERLOOP
			D;JGE // If i >= 0, keep it going
	@LOOP
	0;JMP
