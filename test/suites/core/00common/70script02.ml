(*!tests!
 *
 * { "output": ["123"] }
 *
 *)


let rec f n =
  if n <= 1 then 1
  else n * f (n - 1)
;;
let x = 5 in
let y = 3 in
let z = f x in
if z > 100 then z + y else z - y
;;