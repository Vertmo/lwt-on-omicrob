open Avr

let g = PIN22

let () =
  pin_mode g OUTPUT; digital_write g LOW;
  let waiter, wakener = Lwt.wait () in
  Lwt.wakeup wakener 42
