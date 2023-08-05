ORG 0x7c00
BITS 16 ;; 16 bit mode

start:
    mov ah, 0eh ;; ah is a register of the eax register
    mov al, 'A'
    mov bx, 0 ;; BH = page number, BL = foreground color (0x0F = white)
    int 0x10 ;; calling the BIOS routine -> Int 10 / AH = 0Eh = Video - Teletype Output

    jmp $ ;; keep jumping to this line, so it would not go down and execute the following code

times 510 - ($ - $$) db 0 ;; fill the rest of the sector with 0s
dw 0xAA55 ;; intel machines are little endian, so the 0xAA55 is stored as 0x55 0xAA

;; to compile this code:
;; nasm -f bin boot.asm -o boot.bin
;; to run this code:
;; qemu-system-x86_64 boot.bin
