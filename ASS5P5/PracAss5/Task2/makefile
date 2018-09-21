a.out: driver.o task2.o
	gcc driver.o task2.o -o a.out -g -m64 -static

driver.o: driver.c
	gcc -c driver.c -o driver.o

task2.o: task2.asm
	yasm -f elf64 -g dwarf2 task2.asm -o task2.o
	
clean:
	rm a.out driver.o task1.o

run: a.out
	./a.out
