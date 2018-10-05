OBJ=procdemo.o
PCSRC=procdemo.pc
SRC=procdemo.c
INC=/usr/include/oracle/11.2/client64
CC=gcc
PROC=proc
LDLIB=/usr/lib/oracle/11.2/client64/lib/
FLAGS=-ldl -lm -lclntsh
TARGET=procdemo

$(TARGET) : $(OBJ)
	$(CC) -o $(TARGET) $(OBJ) -L$(LDLIB) $(FLAGS)

$(OBJ) : $(SRC)
	$(CC) -c -I$(INC) $(SRC)

$(SRC) : $(PCSRC)
	$(PROC) iname=$(PCSRC) sys_include=$(INC)

clean :
	rm -rf $(OBJ) $(SRC) $(TARGET)  *.lis

all : clean $(TARGET)	
