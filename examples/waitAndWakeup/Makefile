include ../../OMicroB/etc/Makefile.conf

TARGETS = waitAndWakeup.byte waitAndWakeup.c waitAndWakeup.elf waitAndWakeup.avr waitAndWakeup.hex

all: $(TARGETS)

$(TARGETS): waitAndWakeup.ml
	$(BIN)/omicrob -v waitAndWakeup.ml -mlopts lwt/lwt.cma,lwt/unix/lwt_unix.cma,-I,lwt,-I,lwt/unix -stack-size 256 -heap-size 1000

flash: waitAndWakeup.hex
	$(BIN)/omicrob -flash -sudo $<

simul: waitAndWakeup.elf
	./$< '../../OMicroB/bin/omicrob_pin_simulator' '../../OMicroB/bin/omicrob_circuit_simulator circuit.txt'


clean:
	ocamlbuild -clean
	@rm -f *.cmo *.cmi
	@rm -rf *.elf.dSYM
	@rm -f $(TARGETS)
