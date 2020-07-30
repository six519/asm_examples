all: disk.img

clean:
	@rm -fv boot.bin
	@rm -fv disk.img
	@rm -fv stage2.bin

boot.bin: boot.asm
	nasm -f bin boot.asm -o boot.bin

stage2.bin: stage2.asm
	nasm -f bin stage2.asm -o stage2.bin

disk.img: boot.bin stage2.bin
	dd if=/dev/zero of=disk.img bs=1024 count=720
	dd if=boot.bin of=disk.img conv=notrunc
	dd if=stage2.bin of=disk.img bs=512 seek=1 conv=notrunc