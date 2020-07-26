.PHONY: clean all

.PRECIOUS: *.o

all: asm_and_c

clean:
	@rm -fv asm_and_c.o
	@rm -fv asm_and_c

%.o: %.asm
	nasm -f elf64 $<

%: %.o
	gcc -o $@ $< kill.c