.PHONY: inspect run clean

build/os.img: build/boot.o
	ld -T linker.ld
build/%.o: src/%.s
	gcc -c -static -nostdlib $^ -o $@

inspect:
	xxd ./build/os.img
run: build/os.img
	qemu-system-x86_64 ./build/os.img
clean:
	rm build/*
