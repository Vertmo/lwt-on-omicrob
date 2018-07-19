open Avr
open Lwt

let r = PIN24 and g = PIN22

let activatePins () =
  Lwt.return (
    pin_mode r OUTPUT;
    pin_mode g OUTPUT;
  )

let rec flashLed l =
  Lwt.return (digital_write l HIGH; delay 500; digital_write l LOW) >>=
  Lwt_main.yield >>= (fun () -> flashLed l)

let () =
  Lwt_main.run (activatePins () >>= (fun () -> Lwt.join [flashLed g; flashLed r]))
