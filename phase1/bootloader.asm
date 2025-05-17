[org 0x7C00]

start:
    ; Clear the screen (black background)
    mov ax, 0x0600
    mov bh, 0x0E               ; Yellow on black
    mov cx, 0x0000
    mov dx, 0x184F
    int 0x10

    ; Set up VGA memory
    mov ax, 0xB800
    mov es, ax
    mov di, (12 * 80 + 25) * 2

    ; Load message and print
    mov si, message
    call print_string

hang:
    jmp $

print_string:
print_loop:
    lodsb
    cmp al, 0
    je done
    mov ah, 0x0E
    stosw
    jmp print_loop

done:
    ret

message db ">>>  ASHWAMEDH OS IS RISING  <<<", 0

times 510 - ($ - $$) db 0
dw 0xAA55
