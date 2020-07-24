;same as `kill -n 9 <PID>` command in Linux
;just practicing programming in assembly language (Ferdinand Silva)
            section     .data
SYS_EXIT:   equ         60
SYS_KILL:   equ         62
SYS_WRITE:  equ         1
SIGKILL:    equ         9
STD_IN:     equ         1
INVALID:    db          "Usage: kill2 <PID>", 10

            global      _start
            section     .text
_start:
            pop         rcx
            cmp         rcx, 2
            jne         invalid_cmd
            pop         r14
            pop         rsi
            call        str_to_int
            mov         r15, rax
            call        killprocess
            jmp         exit 

;;str_to_int by: 0xAX
str_to_int:
            xor         rax, rax
            mov	        rcx, 10
next:
            cmp	        [rsi], byte 0
            je          return_str
            mov         bl, [rsi]
            sub         bl, 48
            mul         rcx
            add         rax, rbx
            inc         rsi
            jmp         next

return_str:
            ret

killprocess:
            mov         rax, SYS_KILL
            mov         rdi, r15
            mov         rsi, SIGKILL
            syscall
            ret

print:
            mov         rax, SYS_WRITE
            mov         rdi, STD_IN
            mov         rsi, r13
            mov         rdx, 20
            syscall
            ret

invalid_cmd:
            mov         r13, INVALID
            call        print

exit:
            mov         rax, SYS_EXIT
            mov         rdi, 0
            syscall