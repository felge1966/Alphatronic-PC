ASM = sjasmplus

SOURCES = $(filter-out native-boot-rom.asm pcget.asm,$(wildcard *.asm))
TARGETS = $(patsubst %.asm,../binaries/%.bin,$(SOURCES))

all: $(TARGETS)

# Dependency rules
$(TARGETS): ../binaries/%.bin: %.asm ta-alpha.inc
../binaries/idebootrom.bin: idebootrom.asm uartinit.inc

# Specific rule for pcget using zasm (commented out - zasm not installed)
# pcget: pcget.asm
#	zasm --z80 --asm8080 --reqcolon --dotnames -l pcget.lst -o ../binaries/pcget.bin $<

# Generic build rule
../binaries/%.bin: %.asm
	$(ASM) \
		--lstlab=sort \
		--lst=$*.lst \
		--raw=$@ \
		$<

# CPM-specific target (only cpm22 and z80-cbios-alpha)
.PHONY: cpm
cpm: ../binaries/cpm22.bin ../binaries/z80-cbios-alpha.bin

clean:
	rm -f ../binaries/*.bin *.lst *.sym

