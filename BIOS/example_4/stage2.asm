;generate 720k bootdisk, loading stage2 (sector 2 of disk) from bootsector
[org 0x0000]

main:
        mov         ah, 0x0e
        mov         al, 'S'
        int         0x10
        mov         al, 't'
        int         0x10
        mov         al, 'a'
        int         0x10
        mov         al, 'g'
        int         0x10
        mov         al, 'e'
        int         0x10
        mov         al, '2'
        int         0x10

        jmp         $