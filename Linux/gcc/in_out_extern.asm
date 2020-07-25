;Basic input/output using extern printf & read
;just practicing programming in assembly language (Ferdinand Silva)
            global          main
            extern          printf, read
            section         .data
string1:    db              "Enter a string:", 0xa, 0
string2:    db              "The value is: %s", 0xa, 0
            section         .bss
input:      resb            0x64            

            section         .text
main:
            mov             rdi, string1
            xor             rax, rax
            call            printf
            mov             rdi, 0
            mov             rsi, input
            mov             rdx, 0x64
            call            read
            mov             rdi, string2
            mov             rsi, input
            xor             rax, rax
            call            printf
            jmp exit

exit:
            mov             rax, 0x3c
            mov             rdi, 0
            syscall