;Boot sector example code
;just practicing programming in assembly language (Ferdinand Silva)
%macro print 1
        mov         al, %1
        int         0x10
%endmacro

        ;print ferdinand on boot
        mov         ah, 0x0e
        print       'F'
        print       'e'
        print       'r'
        print       'd'
        print       'i'
        print       'n'
        print       'a'
        print       'n'
        print       'd'

        jmp         $

        times       510-($-$$)  db  0
        dw          0xaa55