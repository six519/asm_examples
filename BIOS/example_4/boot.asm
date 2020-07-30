;generate 720k bootdisk, loading stage2 (sector 2 of disk) from bootsector
[org 0x7c00]

;resets floppy drive
reset:
        xor         ax, ax
        int         0x13
        jc          reset
        mov         ax, 0x07e0
        mov         es, ax
        xor         bx, bx

;read floppy sector 2
floppy:
        mov         ah, 0x2
        mov         al, 0x1
        mov         ch, 0x0
        mov         cl, 0x2
        mov         dh, 0x0
        int         0x13
        jc          floppy
        jmp         0x07e0:0x0000 ;jump to address (0x07e0<<4)+0x0000 = 0x07e00 physical address

        times       510 - ($ - $$) db 0
        dw          0xAA55