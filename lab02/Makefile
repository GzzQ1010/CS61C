#Determines the operating system by invoking the uname -s command.
UNAME_S := $(shell uname -s) 
# CC: The C compiler command, set to gcc.
CC=gcc
#LD: The linker command, also set to gcc.
LD=gcc
#CFLAGS: Compiler flags for debugging, warnings, and C standard.
CFLAGS=-ggdb -Wall -std=c99
#LDFLAGS: Linker flags, left empty but available for specifying linker options.
LDFLAGS=

#Darwin is the core Unix operating system of macOS iOS, watchOS, tvOS, iPadOS, visionOS, and bridgeOS.
ifeq ($(UNAME_S), Darwin)
    MEMCHECK=valgrind --tool=memcheck --leak-check=full --track-origins=yes --dsymutil=yes --suppressions=osx_vector.supp
endif

ifeq ($(UNAME_S), Linux)
    MEMCHECK=valgrind --tool=memcheck --leak-check=full --track-origins=yes
endif

BIT_OPS_OBJS = bit_ops.o test_bit_ops.o
BIT_OPS_PROG = bit_ops

LFSR_OBJS = lfsr.o test_lfsr.o
LFSR_PROG = lfsr

VECTOR_OBJS=vector.o vector_test.o
VECTOR_PROG=vector_test

BINARIES=$(VECTOR_PROG) $(BIT_OPS_PROG) $(LFSR_PROG)

all: $(BINARIES)

$(BIT_OPS_PROG): $(BIT_OPS_OBJS)
	$(CC) $(CFLAGS) -g -o $(BIT_OPS_PROG) $(BIT_OPS_OBJS) $(LDFLAGS)

$(LFSR_PROG): $(LFSR_OBJS)
	$(CC) $(CFLAGS) -g -o $(LFSR_PROG) $(LFSR_OBJS) $(LDFLAGS)

lfsr.c: lfsr.h
test_lfsr.c: lfsr.h

bit_ops.c: bit_ops.h
test_bit_ops.c: bit_ops.h

.c.o:
	$(CC) -c $(CFLAGS) $<

vector-memcheck: $(VECTOR_PROG)
	$(MEMCHECK) ./$(VECTOR_PROG)

clean:
	-rm -rf core *.o *~ "#"*"#" Makefile.bak $(BINARIES) *.dSYM

vector.c: vector.h
vector_test.c: vector.h
