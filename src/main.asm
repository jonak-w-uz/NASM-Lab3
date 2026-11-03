global _start

section .data
    array dq 3, 4, 1, 2, 5

section .bss
    suma resq 1

section .text
_start:
    mov rcx, 5
    mov rdi, 0
    jmp array_sum

add_numbers:
    mov rax, rdi
    add rax, rsi
    ret

array_sum:
    mov rsi, [array + rbx * 8]
    call add_numbers
    mov rdi, rax

    inc rbx
    loop array_sum

exit:
    mov [suma], qword rdi
    mov rax, 60            ; Numer wywolania exit.
    mov rdi, 0             ; Kod zakonczenia — sukces.
    syscall

