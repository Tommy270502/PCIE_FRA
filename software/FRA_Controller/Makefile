# Command-line build for the FRA_Controller bare-metal application.
#
# Vitis 2026.1 removed XSCT, so the old IDE/PowerShell flow no longer works.
# This builds the ELF directly against the checked-in standalone BSP using the
# arm-none-eabi toolchain shipped with Vitis. Flags mirror the BSP's own
# cortexa9_toolchain.cmake so the result matches what the IDE produced.
#
#   make                 # build FRA_Controller.elf
#   make VITIS=<path>    # point at a specific Vitis install
#   make clean

VITIS   ?= $(HOME)/Xilinx/2026.1/Vitis
CROSS   := $(VITIS)/gnu/aarch32/lin/gcc-arm-none-eabi/bin/arm-none-eabi-
CC      := $(CROSS)gcc
OBJCOPY := $(CROSS)objcopy
SIZE    := $(CROSS)size

BSP     := ../PCIE_FRA/ps7_cortexa9_0/standalone_ps7_cortexa9_0/bsp
SPEC    := $(BSP)/Xilinx.spec
LSCRIPT := src/lscript.ld

TARGET  := FRA_Controller.elf
SRCS    := src/main.c
OBJS    := $(SRCS:.c=.o)
DEPS    := $(OBJS:.o=.d)

ARCHFLAGS := -DSDT -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard
CFLAGS    := $(ARCHFLAGS) -MMD -MP -specs=$(SPEC) -I$(BSP)/include \
             -O2 -g -Wall -Wextra -fno-tree-loop-distribute-patterns
LDFLAGS   := $(ARCHFLAGS) -specs=$(SPEC) -Wl,-T,$(LSCRIPT) -L$(BSP)/lib
LDLIBS    := -Wl,--start-group,-lxil,-lxilstandalone,-lxiltimer,-lgcc,-lc,-lm,--end-group

.PHONY: all clean check-toolchain

all: check-toolchain $(TARGET)

check-toolchain:
	@test -x "$(CC)" || { \
	  echo "error: arm-none-eabi-gcc not found at $(CC)"; \
	  echo "       pass VITIS=<path to Vitis install>"; exit 1; }
	@test -d "$(BSP)/include" || { \
	  echo "error: BSP not found at $(BSP)"; \
	  echo "       regenerate the Vitis platform from the exported XSA first"; exit 1; }

$(TARGET): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)
	@echo
	@$(SIZE) $@

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

clean:
	rm -f $(TARGET) $(OBJS) $(DEPS)

-include $(DEPS)
