.PHONY: clean all

.PRECIOUS: *.o

all: in_out kill2 struct_macro_uname

clean:
	@rm -fv in_out.o kill2.o struct_macro_uname.o
	@rm -fv in_out kill2 struct_macro_uname

%.o: %.asm
	nasm -f elf64 $<

%: %.o
	ld -o $@ $<