# Host-side PCIe FRA tools. Plain C99 + libm, no external dependencies.

CC      ?= cc
CFLAGS  ?= -O2 -std=c99 -Wall -Wextra -Wpedantic
LDLIBS  := -lm

BINS    := fra_bar_test fra_cli
COMMON  := fra_pcie.o

.PHONY: all clean test install-udev

all: $(BINS)

fra_bar_test: fra_bar_test.o $(COMMON)
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

fra_cli: fra_cli.o $(COMMON)
	$(CC) $(CFLAGS) -o $@ $^ $(LDLIBS)

%.o: %.c fra_pcie.h
	$(CC) $(CFLAGS) -c -o $@ $<

# Convenience: the BAR smoke test plus the gateware loopback self-test.
test: all
	./fra_bar_test
	./fra_cli selftest

install-udev:
	sudo ./scripts/fra-pcie-setup.sh

clean:
	rm -f $(BINS) *.o
