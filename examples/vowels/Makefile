include ../../OMicroB/etc/Makefile.conf

TARGETS = vowels.byte vowels.c vowels.elf vowels.avr vowels.hex

all: $(TARGETS)

$(TARGETS): vowels.ml
	$(BIN)/omicrob -v vowels.ml -mlopts lwt/lwt.cma,lwt/unix/lwt_unix.cma,-I,lwt,-I,lwt/unix -stack-size 256 -heap-size 1000

flash: vowels.hex
	$(BIN)/omicrob -flash -sudo $<

simul: vowels.elf
	./$< '../../OMicroB/bin/omicrob_pin_simulator' '../../OMicroB/bin/omicrob_circuit_simulator circuit.txt'


clean:
	ocamlbuild -clean
	@rm -f *.cmo *.cmi
	@rm -rf *.elf.dSYM
	@rm -f $(TARGETS)
