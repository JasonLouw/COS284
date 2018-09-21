a.out: driver.o equ.o
	gcc driver.o equ.o -o a.out -g -m64 -static

driver.o: driver.c
	gcc -c driver.c -o driver.o

equ.o: equ.asm
	yasm -f elf64 -g dwarf2 equ.asm -o equ.o
	
clean:
	rm a.out driver.o task1.o

run: a.out
	./a.out
