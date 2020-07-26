;macro, include, struct and syscall uname
;just practicing programming in assembly language (Ferdinand Silva)
%macro print_info 3
            mov         r13, %1
            mov         r14, %2
            call        print
            mov         r13, utsname + %3
            mov         r14, 24
            call        print
            mov         r13, NEW_LINE
            mov         r14, 1
            call        print
%endmacro

            section     .data
SYS_EXIT:   equ         60
SYS_UNAME:  equ         63
SYS_WRITE:  equ         1
STD_IN:     equ         1
NEW_LINE:   db          10
sname:      db          "System Name: "
nname:      db          "Node Name: "
rname:      db          "Release: "
vname:      db          "Version: "
mname:      db          "Machine: "

struc UTSNAME
    sysname:    resb 64
    nodename:   resb 64
    release:    resb 64
    version:    resb 64
    machine:    resb 64   
endstruc

utsname:    istruc      UTSNAME
    at sysname, db ""
    at nodename, db ""
    at release, db ""
    at version, db ""
    at machine, db ""
iend
            section     .text

uname:
            mov         rax, SYS_UNAME
            mov         rdi, utsname
            syscall
            ret

print:
            mov         rax, SYS_WRITE
            mov         rdi, STD_IN
            mov         rsi, r13
            mov         rdx, r14
            syscall
            ret

exit:
            mov         rax, SYS_EXIT
            mov         rdi, 0
            syscall