open Avr

let g = PIN22

let () =
  pin_mode g OUTPUT; digital_write g LOW;
  Lwt_main.run (Lwt_main.yield ())
