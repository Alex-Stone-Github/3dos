OUTPUT_FORMAT(binary)
INPUT(
    obj/boot.o
    obj/stage2.o
    )
OUTPUT(bin/os.img)
SECTIONS {
    . = 0x7c00;
    .boot : {
        *(.boot);
        . = 510;
        SHORT(0xaa55);
    }
    .text : {
        *(.text);
    }
    /* This gets rid of any extra sections ld wants to sneak into my binary - it only took an hour of debugging to find this out*/
    /DISCARD/ : {*(*)}
}