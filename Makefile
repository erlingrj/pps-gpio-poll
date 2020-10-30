obj-m := pps-gpio-poll.o
PWD := $(shell pwd)
# Default to running kernel's build directory if KDIR not set externally
KDIR ?= "/lib/modules/$(shell uname -r)/build"
ARCH=x86_64
CONFIG_MODULE_SIG=n

all:
	$(MAKE) -C $(KDIR) ARCH=$(ARCH) M=$(shell pwd) modules

install:	
	$(MAKE) -C $(KDIR) ARCH=$(ARCH) M=$(shell pwd) modules_install
	depmod -A

clean:
	$(MAKE) -C $(KDIR) ARCH=$(ARCH) M=$(shell pwd) clean


