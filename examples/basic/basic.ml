let calcul n = Lwt.return (n + 1)

let choice () =
  (Lwt.choose [Lwt.return 1; Lwt.return 2])

let () = ()
  (*(choice ()) >>= calcul >>= (fun n -> (Lwt.return ()))*)
