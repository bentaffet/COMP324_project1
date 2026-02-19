(*!tests!
 *
 * { "output": ["false"] }
 *
 *)

let check_bounds x =
  let min_val = 0 in
  let max_val = 10 in
  x >= min_val && x <= max_val
in
check_bounds 12 ;;