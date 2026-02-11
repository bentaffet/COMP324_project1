(*!tests!
 *
 * { "output": ["122"] }
 *
 *)

let f x y = x + y ;;

let rec fact n = if n <= 1 then 1 else n * fact (n - 1) ;;


f (fact 5) (fact 2) ;;