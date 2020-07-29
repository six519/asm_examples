;print string
;qemu-system-x86_64 boot.img (to test using qemu)
;just practicing programming in assembly language (Ferdinand Silva)
[org 0x7c00]

        mov         bx, text1
        call        print_string
        jmp         $

print_string:
        pusha
start:
        mov         al, [bx]
        cmp         al, 0
        je          ok

        mov         ah, 0x0e
        
        int         0x10
        add         bx, 1
        jmp         start

ok:
        popa
        ret

text1:
        db          "This is a test", 0

        times       510-($-$$)  db  0
        dw          0xaa55