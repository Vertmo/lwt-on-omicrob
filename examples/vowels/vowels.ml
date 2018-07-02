open Lwt
open Avr
open LiquidCrystal

let word () = Lwt.return "arduino"

let vowels = ['a';'e';'i';'o';'u';'y']

let r = PIN24 and g = PIN22 and y = PIN26

let lcd = create4bitmode PIN32 PIN33 PIN34 PIN35 PIN36 PIN37

let startPins = Lwt.join [Lwt.return (pin_mode r OUTPUT);
                          Lwt.return (pin_mode g OUTPUT);
                          Lwt.return (pin_mode y OUTPUT)]

let startLcd s =
  lcdBegin lcd 16 2;
  print lcd s;
  setCursor lcd 0 1;
  Lwt.return ()

let explode s =
  let rec exp i l =
    if i < 0 then l else exp (i - 1) (s.[i] :: l) in
  exp (String.length s - 1) []

let countVowels s =
  let n = List.length (List.filter (fun c -> List.mem c vowels) s) in
  (* print lcd ("V:"^(string_of_int n)^" "); *)
  if n mod 2 = 0 then digital_write g HIGH else ();
  Lwt.return ()

let countConsonants s =
  let n = List.length (List.filter (fun c -> not (List.mem c vowels) && (not (c = ' '))) s) in
  (* print lcd ("C:"^(string_of_int n)^" "); *)
  if n mod 2 = 0 then digital_write r HIGH else ();
  Lwt.return ()

let count s = Lwt.join [countVowels (explode s); countConsonants (explode s)]

let yellowLed() = Lwt.return (digital_write y HIGH)

(* Led verte allumée si le nb de voyelle et pair et rouge allumée si le nb de consonnes est pair *)
let () =
  Lwt_main.run (startPins >>= word >>= (fun s -> Lwt.join[startLcd s; count s]) >>= yellowLed)
