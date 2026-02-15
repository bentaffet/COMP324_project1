(*!tests!
 *
 * { "output": ["1"] }
 *
 *)

let rec f x = if x <= 0 then 1 else f (x - 2) ;;
f 3 ;;

