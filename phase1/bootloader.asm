[org 0x7C00]

start:
    ; Print a basic message using BIOS interrupt
    mov si, message
    mov ah, 0x0E

print_loop:
    lodsb
    cmp al, 0
    je hang
    int 0x10
    jmp print_loop

hang:
    jmp $

message db "Ashwamedh OS Test Boot", 0

times 510 - ($ - $$) db 0
dw 0xAA55
