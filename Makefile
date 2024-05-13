.PHONY: all
all:
	make -C kernel all
	make -C kernel install
	make -C libc all
	make -C libc install
	make -C shell all
	make -C shell install

.PHONY: clean
clean:
	make -C kernel clean
	make -C libc clean
	make -C shell clean

.PHONY: clobber
clobber:
	make -C kernel clobber