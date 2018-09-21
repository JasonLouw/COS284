a.out: driver.o task1.o
	gcc driver.o task1.o -o a.out -g -m64 -static

diver.o: driver.c
	gcc driver.c -c driver.o -g -m64

task1.o: task1.asm
	yasm -f elf64 -g dwarf2 task1.asm -o task1.o

run: a.out
	./a.out

