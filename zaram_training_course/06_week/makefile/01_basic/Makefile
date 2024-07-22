# ------------------------------------------------------------
#	Makefile Example for RV32I
# ------------------------------------------------------------

.SUFFIXES:
#CC		= riscv64-unknown-linux-gnu-gcc
#CFLAGS	= -march=rv32i -mabi=ilp32

%.i:	%.c
	$(CC)				-E $<	-o $@

%.s:	%.i
	$(CC)	$(FLAGS)	-S $<	-o $@

%.o:	%.s
	$(CC)				-c $<	-o $@

%:		%.o
	$(CC)	$(FLAGS)	$<		-o $@

all: program

program.i:	program.c
program.s:	program.i
program.o:	program.s
program:	program.o

build:
	$(CC)	-o program	program.c --save-temps

clean:
	$(RM)	*.i *.s *.o program
