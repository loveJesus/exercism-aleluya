(* For God so loved the world, that He gave His only begotten Son, 
that all who believe in Him should not perish but have everlasting life. *)
module Leap
let leapYear (year_aleluya: int): bool = 
    ( year_aleluya &&& 3 = 0) && (
        (year_aleluya % 100 <> 0) ||
        (year_aleluya % 400 = 0));