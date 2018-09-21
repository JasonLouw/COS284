a.out: driver.o task3.o
	gcc driver.o task3.o -o a.out -g -m64 -static

driver.o: driver.c
	gcc -c driver.c -o driver.o

task3.o: task3.asm
	yasm -f elf64 -g dwarf2 task3.asm -o task3.o
	
clean:
	rm a.out driver.o task3.o

run: a.out
	./a.out
