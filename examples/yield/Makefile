include ../../OMicroB/etc/Makefile.conf

TARGETS = yield.byte yield.c yield.elf yield.avr yield.hex

all: $(TARGETS)

$(TARGETS): yield.ml
	$(BIN)/omicrob -v yield.ml -mlopts lwt/lwt.cma,lwt/unix/lwt_unix.cma,-I,lwt,-I,lwt/unix -stack-size 256 -heap-size 1000

flash: yield.hex
	$(BIN)/omicrob -flash -sudo $<

simul: yield.elf
	./$< '../../OMicroB/bin/omicrob_pin_simulator' '../../OMicroB/bin/omicrob_circuit_simulator circuit.txt'


clean:
	ocamlbuild -clean
	@rm -f *.cmo *.cmi
	@rm -rf *.elf.dSYM
	@rm -f $(TARGETS)
