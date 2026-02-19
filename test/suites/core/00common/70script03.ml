(*!tests!
 *
 * { "output": ["true"] }
 *
 *)


let rec f x =
  if x <= 0 then 0
  else f (x - 1) + 1
;;


let a = 3 in
let b = 5 in
let c = f a in
let d = f b in
if c > d then false else true ;;


