include ../../OMicroB/etc/Makefile.conf

TARGETS = basic.byte basic.c basic.elf basic.avr basic.hex

all: $(TARGETS)

$(TARGETS): basic.ml
	$(BIN)/omicrob -v basic.ml -mlopts lwt/lwt.cma,lwt/unix/lwt_unix.cma,-I,lwt,-I,lwt/unix -stack-size 256 -heap-size 1000

flash: basic.hex
	$(BIN)/omicrob -flash -sudo $<

simul: basic.elf
	./$< '../../OMicroB/bin/omicrob_pin_simulator' '../../OMicroB/bin/omicrob_circuit_simulator circuit.txt'


clean:
	ocamlbuild -clean
	@rm -f *.cmo *.cmi
	@rm -rf *.elf.dSYM
	@rm -f $(TARGETS)
