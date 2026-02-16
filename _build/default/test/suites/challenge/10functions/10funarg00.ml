(*!tests!
 *
 * { "output":    ["5"] }
 *
 *)

let f = fun g x -> g x in f (fun y -> y) 5 ;;

