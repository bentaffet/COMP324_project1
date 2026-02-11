(*!tests!
 *
 * { "output": ["-24"] }
 *
 *)

let a = 2 in
let b = a + 2 in
let c = b * 10 in
let d = c - a in
let e = d / 2 in
let f = e + b * 2 in
let g = f - c + b in
let h = g * 3 in
let i = h + g / f + a + a * a - b in
i + 1 ;;

