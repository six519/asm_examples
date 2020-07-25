.PHONY: clean all

.PRECIOUS: *.o

all: in_out kill2

clean:
	@rm -fv in_out.o kill2.o
	@rm -fv in_out kill2

%.o: %.asm
	nasm -f elf64 $<

%: %.o
	ld -o $@ $<