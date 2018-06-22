(*let calcul = fun n ->
  Lwt.return ((n + 1) * 2)*)

let calcul n = Lwt.return (n + 1)

(* let choice = fun () ->
 *   (Lwt.choose [Lwt.return 1; Lwt.return 2]) *)

let () = ()
  (*(choice ()) >>= calcul >>= (fun n -> (Lwt.return ()))*)
