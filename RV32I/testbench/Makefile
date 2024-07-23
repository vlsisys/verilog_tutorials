# ==================================================
#	[ VLSISYS Lab. ]
#	* Author		: Woong Choi (woongchoi@sm.ac.kr)
#	* Filename		: Makefile
#	* Description	: 
# ==================================================

# --------------------------------------------------
#	Common Environment
# --------------------------------------------------
PRJ_PATH	=	/home/woong/projects/verilog_tutorials/RV32I

# --------------------------------------------------
#	RTL Path & Top Design Name
# --------------------------------------------------
CPU_TYPE	=	singlecycle
RTL_PATH	=	$(PRJ_PATH)/core
RTL_NAME	=	riscv_top
RTL_SRCS	=	$(wildcard $(RTL_PATH)/common/*.v)	
RTL_SRCS	+=	$(wildcard $(RTL_PATH)/$(CPU_TYPE)/*.v)	

# --------------------------------------------------
#	Verilator
# --------------------------------------------------
VRL_INCDIR	=	/usr/share/verilator/include
VRL_FLAGS	=	-I$(RTL_PATH)/common
VRL_FLAGS	+=	-I$(RTL_PATH)/$(CPU_TYPE)

# --------------------------------------------------
#	C++ Compile
# --------------------------------------------------
CXX_FLAGS	=	-I ${VRL_INC} -I ${VRL_INC}/vltstd
CXX_SRCS	=	$(wildcard *.cpp)
CXX_OBJS	=	$(CPP_SRCS:.cpp=.o)
	
# --------------------------------------------------
#	RISC-V Test
# --------------------------------------------------
TEST_PATH	=	$(PRJ_PATH)/testbench
TEST_VECS	=	$(basename $(wildcard $(TEST_PATH)/*.S))

disp:
	clear;
	@echo	"PRJ_PATH	: $(PRJ_PATH)	";
	@echo	"CPU_TYPE	: $(CPU_TYPE)	";
	@echo	"RTL_PATH	: $(RTL_PATH)	";
	@echo	"RTL_NAME	: $(RTL_NAME)	";
	@echo	"RTL_SRCS	: $(RTL_SRCS)	";
	@echo	"VRL_INCDIR	: $(VRL_INCDIR)	";
	@echo	"VRL_FLAGS	: $(VRL_FLAGS)	";
	@echo	"CXX_FLAGS	: $(CXX_FLAGS)	";
	@echo	"CXX_SRCS	: $(CXX_SRCS)	";
	@echo	"CXX_OBJS	: $(CXX_OBJS)	";
	@echo	"TEST_PATH	: $(TEST_PATH)	";
	@echo	"TEST_VECS	: $(TEST_VEC)	";
