;macro, include, struct and syscall uname
;just practicing programming in assembly language (Ferdinand Silva)
%include "include.inc"

            global      _start
            section     .text

_start:
            call        uname

            ;sysname
            print_info  sname, 13, sysname
            ;nodename
            print_info  nname, 11, nodename
            ;release
            print_info  rname, 9, release
            ;version
            print_info  vname, 9, version
            ;machine
            print_info  mname, 9, machine

            jmp         exit