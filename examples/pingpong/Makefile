include ../../OMicroB/etc/Makefile.conf

TARGETS = pingpong.byte pingpong.c pingpong.elf pingpong.avr pingpong.hex

all: $(TARGETS)

$(TARGETS): pingpong.ml
	$(BIN)/omicrob -v pingpong.ml -mlopts lwt/lwt.cma,lwt/unix/lwt_unix.cma,-I,lwt,-I,lwt/unix -stack-size 256 -heap-size 1500

flash: pingpong.hex
	$(BIN)/omicrob -flash -sudo $<

simul: pingpong.elf
	./$< '../../OMicroB/bin/omicrob_pin_simulator' '../../OMicroB/bin/omicrob_circuit_simulator circuit.txt'


clean:
	ocamlbuild -clean
	@rm -f *.cmo *.cmi
	@rm -rf *.elf.dSYM
	@rm -f $(TARGETS)
