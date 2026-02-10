(*!tests!
 *
 * {
 *    "exception":  "UnboundVariable"
 * }
 *
 *)

let rec f x = g x ;;

f 3 ;;
