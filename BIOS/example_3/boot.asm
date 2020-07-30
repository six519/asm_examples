;clear screen, print color
;qemu-system-x86_64 boot.img (to test using qemu)
;just practicing programming in assembly language (Ferdinand Silva)
[org 0x7c00]

;colors
;------

;0 - black
;1 - blue
;2 - green
;3 - cyan
;4 - red
;5 - magenta
;6 - brown
;7 - light gray
;8 - dark gray
;9 - light blue
;10 - light green
;11 - light cyan 
;12 - light red
;13 - light magenta
;14 - yellow
;15 - white

main:

        call        cls
        mov         si, red_text
        mov         bl, 0x04 ;red
        call        print_string
        mov         si, magenta_text
        mov         bl, 0x05 ;magenta
        call        print_string
        mov         si, blue_green
        mov         bl, 12h ;blue background with green text
        call        print_string
        jmp         $

print_string:

.print:
        mov         ah, 0x09
        mov         cx, 0x01 ;one character
        lodsb
        cmp         al, 0x00
        je          .return
        int         0x10
        call        get_cursor_position
        inc         dl ;increment column
        call        set_cursor_position
        jmp         .print
.return
        call        get_cursor_position
        inc         dh ;increment row (newline?)
        mov         dl, 0x00 ;set column to 0
        call        set_cursor_position
        ret

cls:
        pusha
        mov         dx, 0x00
        call        set_cursor_position
        mov         ah, 0x06
        mov         al, 0x00
        mov         bh, 0x07
        mov         cx, 0x00
        mov         dh, 0x18
        mov         dl, 0x4f
        int         0x10
        popa
        ret

; bh = page number (0..7)
; dh = row
; dl = column
; ch = cursor start line
; cl = cursor bottom line
set_cursor_position:
        pusha
        mov         ah, 0x02
        mov         bh, 0x00
        int         0x10
        popa
        ret

; bh = page number
; dh = row
; dl = column
; ch = cursor start line
; cl = cursor bottom line
get_cursor_position:
        mov         ah, 0x03
        mov         bh, 0x00
        int         0x10
        ret

red_text:
        db          "Red Text", 0
magenta_text:
        db          "Magenta Text", 0
blue_green:
        db          "Blue background with Green text"

        times       510-($-$$)  db  0
        dw          0xaa55