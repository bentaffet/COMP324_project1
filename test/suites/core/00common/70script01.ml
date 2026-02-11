(*!tests!
 *
 * { "output": ["true"] }
 *
 *)

let f x y = if x = y then true else false ;;

let rec fact n = if n <= 1 then 1 else n * fact (n - 1) ;;


f (fact 5) (fact 5) ;;