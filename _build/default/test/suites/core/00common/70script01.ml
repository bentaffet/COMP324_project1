(*!tests!
 *
 * { "output": ["12"] }
 *
 *)

let rec f n =
  if n <= 0 then 0
  else n + f (n - 1) ;;

let x = 4 in
let y = 7 in
let total = f x in
let combined = total + y in
if combined >= 15 then combined - 5 else combined + 5 ;;