.PHONY: clean all

.PRECIOUS: *.o

all: struct_macro_uname

clean:
	@rm -fv struct_macro_uname.o
	@rm -fv struct_macro_uname

%.o: %.asm
	nasm -f elf64 $<

%: %.o
	ld -o $@ $<