.PHONY: clean all

.PRECIOUS: *.o

all: in_out_extern

clean:
	@rm -fv in_out_extern.o
	@rm -fv in_out_extern

%.o: %.asm
	nasm -f elf64 $<

%: %.o
	gcc -no-pie -o $@ $<