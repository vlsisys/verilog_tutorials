
#GCC		= gcc
#FLAGS	= 
GCC		= riscv64-unknown-linux-gnu-gcc
FLAGS	= -march=rv32i -mabi=ilp32
DOT_C	= $(notdir $(wildcard *.c))
DOT_I	= $(patsubst %.c, %.i, $(DOT_C))
DOT_S	= $(patsubst %.c, %.s, $(DOT_C))
DOT_O	= $(patsubst %.c, %.o, $(DOT_C))
NODOT	= $(patsubst %.c, %, $(DOT_C))

all:	gcc_e gcc_s gcc_c gcc_o

gcc_e:
	$(GCC)	-E $(DOT_C) -o $(DOT_I)

gcc_s:
	$(GCC)	$(FLAGS) -S $(DOT_I) -o $(DOT_S)

gcc_c:
	$(GCC)	$(FLAGS) -c $(DOT_S) -o $(DOT_O)

gcc_o:
	$(GCC)	$(FLAGS) $(DOT_O) -o $(NODOT)

gcc_all:
	$(GCC)	$(FLAGS) -o $(NODOT) $(DOT_C) --save-temps
#gcc_e:
#	$(GCC)	-S $(DOT_I) -o $(DOT_S)

clean:
	rm -rf $(DOT_I) $(DOT_S) $(DOT_O) $(NODOT)
