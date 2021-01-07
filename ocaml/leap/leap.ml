(* For God so loved the world, that He gave His only begotten Son, 
that all who believe in Him should not perish but have everlasting life. *)
let leap_year year_aleluya = 
    (year_aleluya mod 4 = 0 ) && 
    ( (year_aleluya mod 100 <> 0) ||
      (year_aleluya mod 400 = 0) )
