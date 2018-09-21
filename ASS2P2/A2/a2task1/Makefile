make:
	yasm -f elf64 -g dwarf2 -l task.lst *.asm 
	
link: make
	ld -o task *.o
	
run: link
	./task
	
clean:
	rm -f *.lst task *.o
	
