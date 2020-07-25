;Basic input/output sample code
;just practicing programming in assembly language (Ferdinand Silva)
            section         .data
string1:    db              "Enter a string:", 0xa
string2:    db              "The value is:", 0xa
            section         .bss
input:      resb            0x64            

            global          _start
            section         .text
_start:
            mov             r15, string1
            mov             r14, 0x10
            call            print
            call            readline
            mov             r15, string2
            mov             r14, 0xe
            call            print
            mov             r15, input
            mov             r14, 0x64
            call            print
            jmp exit

readline:
            mov             rax, 0
            mov             rdi, 0
            mov             rsi, input
            mov             rdx, 0x64
            syscall
            ret

print:
            mov             rax, 1
            mov             rdi, 1
            mov             rsi, r15
            mov             rdx, r14
            syscall
            ret

exit:
            mov             rax, 0x3c
            mov             rdi, 0
            syscall