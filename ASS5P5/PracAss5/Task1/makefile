a.out: driver.o task1.o
	gcc driver.o task1.o -o a.out -lm -g -m64 -static

driver.o: driver.c
	gcc -c driver.c -o driver.o

task1.o: task1.asm
	yasm -f elf64 -g dwarf2 task1.asm -o task1.o
	
clean:
	rm a.out driver.o task1.o

run: a.out
	./a.out
