app_name = float_operation

.PHONY: clean all

.PRECIOUS: *.o

all: $(app_name)

clean:
	@rm -fv $(app_name).o
	@rm -fv $(app_name)

%.o: %.asm
	nasm -felf64 $<

%: %.o
	gcc -no-pie $< -o $@
