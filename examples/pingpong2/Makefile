include ../../OMicroB/etc/Makefile.conf

TARGETS = pingpong2.byte pingpong2.c pingpong2.elf pingpong2.avr pingpong2.hex

all: $(TARGETS)

$(TARGETS): pingpong2.ml
	$(BIN)/omicrob -v pingpong2.ml -mlopts lwt/lwt.cma,lwt/unix/lwt_unix.cma,-I,lwt,-I,lwt/unix -stack-size 256 -heap-size 1500

flash: pingpong2.hex
	$(BIN)/omicrob -flash -sudo $<

simul: pingpong2.elf
	./$< '../../OMicroB/bin/omicrob_pin_simulator' '../../OMicroB/bin/omicrob_circuit_simulator circuit.txt'


clean:
	ocamlbuild -clean
	@rm -f *.cmo *.cmi
	@rm -rf *.elf.dSYM
	@rm -f $(TARGETS)
