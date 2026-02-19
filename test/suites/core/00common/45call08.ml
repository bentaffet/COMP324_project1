(*!tests!
 *
 * { "output": ["25"] }
 *
 *)

let square_sum x y =
  let square z = z * z in
  square x + square y
in
square_sum 3 4 ;;