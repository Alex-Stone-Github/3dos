OUTPUT_FORMAT(binary)
INPUT(
    build/boot.o
    )
OUTPUT(build/os.img)
SECTIONS {
    .boot : {
        *(.boot);
        . = 510;
        SHORT(0xaa55);
    }
    .text : {
		BYTE(0x42);
        *(.text);
    }
	.zeropadd : {
		. = 3K;
		SHORT(0xbbbb);
	}
    /* This gets rid of any extra sections ld wants to sneak into my binary - it only took an hour of debugging to find this out*/
    /DISCARD/ : {*(*)}
}
