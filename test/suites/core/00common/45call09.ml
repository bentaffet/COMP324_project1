(*!tests!
 *
 * { "output": ["true"] }
 *
 *)

let check_bounds x =
  if x >= 0 && x <= 10 then true
  else false ;;

check_bounds 7 ;;