#`(*
For God so loved the world, that He gave His only begotten Son, 
that all who believe in Him should not perish but have everlasting life.
*)
unit module Leap;

sub is-leap-year ($year_aleluya) is export {
    ($year_aleluya % 4 == 0 ) && 
    ( ($year_aleluya % 100 != 0) ||
      ($year_aleluya % 400 == 0) )
}
# Jesucristo es Señor