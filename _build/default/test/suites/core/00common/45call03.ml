(*!tests!
 *
 * { "output": ["120"] }
 *
 *)

let rec fact n = if n <= 1 then 1 else n * fact (n - 1) ;;
fact 5 ;;

