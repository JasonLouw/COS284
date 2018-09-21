make:
	yasm -f elf64 -g dwarf2 -l task1.lst *.asm 
	
link: make
	ld -o task1 *.o
	
run: link
	./task1
	
clean:
	rm -f *.lst task1 *.o
	
