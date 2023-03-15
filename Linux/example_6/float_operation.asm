;floating point operation sample code
;just practicing programming in assembly language (Ferdinand Silva)
        global		main
        extern		printf

        section		.text
main:
        call		float_operation
        mov         rdi, str
        sub		    rsp, 8	;align stack (double is 8 bytes)
        mov		    al, 1	;count of xmm passed to printf (1 register which is xmm0)
        call		printf
        add		    rsp, 8	;cleanup stack
        jmp		    exit

float_operation:
        movsd		xmm0, [flt]
        mulsd		xmm0, xmm0	;multiply flt to itself
        ret

exit:
        mov		    rax, 0x3c
        mov		    rdi, 0
        syscall

        section		.data
str:	db		    "The value is: %f", 0xa, 0
flt:	dq		    6519.765
