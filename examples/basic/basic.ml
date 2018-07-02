open Avr
open Lwt

let calcul n = Lwt.return (n + 1)

let r = PIN24 and g = PIN22 and y = PIN26

let choice () =
  (Lwt.choose [Lwt.return 1; Lwt.return 2])

let led n =
  Lwt.return (if n = 2 then digital_write r HIGH else digital_write g HIGH)

let () =
  pin_mode r OUTPUT; pin_mode g OUTPUT; pin_mode y OUTPUT;
  Lwt_main.run (choice () >>= calcul >>= led)
