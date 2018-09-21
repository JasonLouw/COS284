a.out: driver.o assignment4.o
	gcc driver.o assignment4.o -o a.out -g -m64 -static

diver.o: driver.c
	gcc driver.c -c driver.o -g -m64

assignment4.o: assignment4.asm
	yasm -f elf64 -g dwarf2 assignment4.asm -o assignment4.o

run: a.out
	./a.out

