;Shutdown
;qemu-system-x86_64 boot.img (to test using qemu)
;just practicing programming in assembly language (Ferdinand Silva)
main:

        call        shutdown
        jmp         $

shutdown:

        mov         ax, 0x1000
        mov         ax, ss
        mov         sp, 0xf000
        mov         ax, 0x5307
        mov         bx, 0x0001
        mov         cx, 0x0003
        int         0x15
        ret

        times       510-($-$$)  db  0
        dw          0xaa55