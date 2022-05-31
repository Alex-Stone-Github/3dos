.code16
.section .boot

/* Some macro to print things */
.macro .printer text
        mov $0xe, %ah
        mov \text, %si
    update\@:
        lodsb
        int $0x10
        cmp $0x0, %al
        je done\@
        jmp update\@
    done\@:
.endm


main:
    .printer $hello
    .printer $other
    jmp .


hello: .asciz "Hello, World!"
other: .asciz "Hello, World Number 2!"

