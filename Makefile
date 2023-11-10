PWD := $(shell pwd)
# ARCH ?= riscv
ARCH ?= arm64
# KDIR ?= /lib/modules/$(shell uname -r)/build
KDIR ?= $(PWD)/../rust-for-linux-e1000/build

default:
	cd src/linux && $(MAKE) KDIR=$(KDIR) $@

clean:
	cd src/linux && $(MAKE) KDIR=$(KDIR) $@

rust-analyzer:
	$(MAKE) ARCH=$(ARCH) LLVM=1 -C $(KDIR) M=$(PWD) rust-analyzer
