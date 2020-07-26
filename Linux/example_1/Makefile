.PHONY: clean all

.PRECIOUS: *.o

all: in_out

clean:
	@rm -fv in_out.o
	@rm -fv in_out

%.o: %.asm
	nasm -f elf64 $<

%: %.o
	ld -o $@ $<