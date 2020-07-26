.PHONY: clean all

.PRECIOUS: *.o

all: kill2

clean:
	@rm -fv kill2.o
	@rm -fv kill2

%.o: %.asm
	nasm -f elf64 $<

%: %.o
	ld -o $@ $<