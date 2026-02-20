(*!tests!
 *
 * { "output": ["5"] }
 *
 *)

let rec countdown n =
  if n <= 0 then 0
  else countdown (n - 1) + 1;;
countdown 5;;