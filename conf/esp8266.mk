# Configuration for compiling to an ESP8266 from a UNIX system

# We are on a Unix system so we assume a Single Unix compatible 'make'
# utility, and Unix defaults.
include conf/Unix.mk

# We override the build directory.
BUILD = esp8266

# C compiler, linker, and static library builder.
TOOLCHAIN_PREFIX := xtensa-lx106-elf-
CC := $(TOOLCHAIN_PREFIX)gcc
CFLAGS = -W -Wall -g -Os -Wpointer-arith -Wl,-EL -nostdlib -mlongcalls -mno-text-section-literals -ffunction-sections -fdata-sections -Werror -free -fipa-pta
CFLAGS += -D__ets__ -DICACHE_FLASH -DESP8266 -DBR_SLOW_MUL15=1 -DPGM_READ_UNALIGNED=0
CFLAGS += -fno-jump-tables -fno-tree-switch-conversion
LD := $(TOOLCHAIN_PREFIX)ld
AR := $(TOOLCHAIN_PREFIX)ar

# We compile only the static library.
DLL = no
TOOLS = no
TESTS = no
