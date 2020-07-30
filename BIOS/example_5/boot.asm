;VGA
;qemu-system-x86_64 boot.img (to test using qemu)
;just practicing programming in assembly language (Ferdinand Silva)
[org 0x7c00]

main:
        ;set to graphics mode (320x200x256)
        mov         ax, 0x13 ;al = 13h, ah = 0h
        int         0x10
        mov         ax, 0xa000
        mov         es, ax
        mov         ax, 0 ;top left corner
        mov         di, ax ;coords to put the pixel
        mov         al, 0x01 ;blue
        mov         cx, 64000 ;6400 = 320 * 200
        rep         stosb


        mov         ah, 0x0c ; change color for a single pixel
        mov         al, 0x0e ; color
        mov         bh, 0 ; page number

        ;letter T
        mov         cx, 3 ; x
        mov         dx, 3 ; y
        push        10; until x == 10 (6 repetition); 3 + 6 + 1 = 10
        call        paint_until
        mov         cx, 5 ; x
        mov         dx, 4 ; y
        push        8;
        call        paint_until
        mov         cx, 5 ; x
        mov         dx, 5 ; y
        push        8;
        call        paint_until
        mov         cx, 5 ; x
        mov         dx, 6 ; y
        push        8;
        call        paint_until
        mov         cx, 5 ; x
        mov         dx, 7 ; y
        push        8;
        call        paint_until
        mov         cx, 5 ; x
        mov         dx, 8 ; y
        push        8;
        call        paint_until


        ;letter e
        mov         cx, 12 ; x
        mov         dx, 4 ; y
        push        16;
        call        paint_until
        mov         cx, 11 ; x
        mov         dx, 5 ; y
        push        14;
        call        paint_until
        mov         cx, 16 ; x
        mov         dx, 5 ; y
        call        paint
        mov         cx, 11 ; x
        mov         dx, 6 ; y
        push        17;
        call        paint_until
        mov         cx, 11 ; x
        mov         dx, 7 ; y
        push        14;
        call        paint_until
        mov         cx, 12 ; x
        mov         dx, 8 ; y
        push        17;
        call        paint_until

        jmp         $

paint_until:
        push        bp
        mov         bp, sp

.loop:
        call        paint
        inc         cx
        cmp         cx, [bp+4]
        jne         .loop

        pop         bp
        ret         2


paint:
        int         10h ; paint pixel
        ret

        times       510-($-$$)  db  0
        dw          0xaa55