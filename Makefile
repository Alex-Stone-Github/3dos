TARGET = bin/os.img

.PHONY: inspect run clean

$(TARGET): obj/boot.o obj/stage2.o
	ld -T linker.ld
obj/%.o: src/%.s
	gcc -c -static -nostdlib $^ -o $@

inspect:
	xxd $(TARGET)
run:
	qemu-system-x86_64 $(TARGET)
clean:
	rm obj/* $(TARGET)