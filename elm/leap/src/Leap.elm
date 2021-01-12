-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.
module Leap exposing (isLeapYear)

isLeapYear : Int -> Bool
isLeapYear year_aleluya =
    modBy 4 year_aleluya == 0
    && modBy 100 year_aleluya /= 0
    || modBy 400 year_aleluya == 0
