# SPDX-License-Identifier: GPL-2.0
KASAN_SANITIZE_actions-common.o := n
KASAN_SANITIZE_actions-arm.o := n
KASAN_SANITIZE_actions-thumb.o := n
obj-$(CONFIG_KPROBES)		+= core.o actions-common.o checkers-common.o
obj-$(CONFIG_ARM_KPROBES_TEST)	+= test-kprobes.o
test-kprobes-objs		:= test-core.o

ifdef CONFIG_THUMB2_KERNEL
obj-$(CONFIG_KPROBES)		+= actions-thumb.o checkers-thumb.o
test-kprobes-objs		+= test-thumb.o
else
obj-$(CONFIG_KPROBES)		+= actions-arm.o checkers-arm.o
obj-$(CONFIG_OPTPROBES)		+= opt-arm.o
test-kprobes-objs		+= test-arm.o
endif

# don't warn about intentionally bogus instructions
CFLAGS_test-arm.o		+= -Wa,--no-warn
CFLAGS_test-thumb.o		+= -Wa,--no-warn
