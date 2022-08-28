.section .boot
.code16

// try to load and jump to second stage
mov $0x2, %ah
mov $0x2, %al
mov $0x1, %ch
mov $0x1, %dh
mov $0x1000, %bx
int $0x13

// print char
mov $0xe, %ah
mov ($0x1000), %al
int $0x10



// print HI as a failure
mov $0xe, %ah
mov $0x48, %al
int $0x10
mov $0x49, %al
int $0x10
jmp .


.section .text
// second stage stuff
// print bye as success
mov $0xe, %ah
mov $0x42, %al
int $0x10
mov $0x59, %al
int $0x10
mov $0x45, %al
int $0x10
jmp .
