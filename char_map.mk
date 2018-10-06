OBJ=char_map.o
PCSRC=char_map.pc
SRC=char_map.c
INC=/usr/include/oracle/11.2/client64
CC=gcc
PROC=proc
LDLIB=/usr/lib/oracle/11.2/client64/lib/
FLAGS=-ldl -lm -lclntsh
TARGET=char_map

$(TARGET) : $(OBJ)
	$(CC) -o $(TARGET) $(OBJ) -L$(LDLIB) $(FLAGS)

$(OBJ) : $(SRC)
	$(CC) -c -I$(INC) $(SRC)

$(SRC) : $(PCSRC)
	$(PROC) iname=$(PCSRC) sys_include=$(INC)

