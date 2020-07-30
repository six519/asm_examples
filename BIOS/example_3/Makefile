.PHONY: clean all

.PRECIOUS: *.bin

all: boot.img

clean:
	@rm -fv boot.bin
	@rm -fv boot.img

%.bin: %.asm
	nasm -f bin $< -o $@

%.img: %.bin
	dd conv=notrunc if=$< of=$@