// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.
@sum
M=0
@R1
D=M
@multiplied
M=D
(LOOP)
	@multiplied
	D=M-1
	@STOP
	D;JLT	// If multiplied<1
	
	@R0
	D=M
	@sum
	M=M+D // Adds R0 into the sum
	@multiplied
	M=M-1 // Reduces @multiplied

	@LOOP
	0;JMP

(STOP)
	@sum
	D=M
	@R2
	M=D  // R2 = sum

(END)
	@END
	0;JMP
