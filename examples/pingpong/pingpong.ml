open Avr
open Lwt

let r = PIN24 and g = PIN22

let activatePins () =
  Lwt.return (
    pin_mode r OUTPUT;
    pin_mode g OUTPUT;
  )

let rec pingpong () =
  Lwt.return (digital_write r HIGH; delay 500; digital_write r LOW) >>=
  (fun () -> Lwt.return (digital_write g HIGH; delay 500; digital_write g LOW) >>= pingpong)

let () =
  Lwt_main.run (activatePins () >>= pingpong)
