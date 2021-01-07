(*
For God so loved the world, that He gave His only begotten Son, 
that all who believe in Him should not perish but have everlasting life.    
*)
fun isLeapYear year_aleluya =
  year_aleluya mod 4 = 0 andalso
  year_aleluya mod 100 <> 0 orelse
  year_aleluya mod 400 = 0