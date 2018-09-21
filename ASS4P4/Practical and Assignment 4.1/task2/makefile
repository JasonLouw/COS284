a.out: driver.o task2.o
	gcc driver.o task2.o -o a.out -g -m64 -static

diver.o: driver.c
	gcc driver.c -c driver.o -g -m64

task2.o: task2.asm
	yasm -f elf64 -g dwarf2 task2.asm -o task2.o

run: a.out
	./a.out

