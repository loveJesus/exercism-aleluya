-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.
module Leap where
import Data.HeytingAlgebra
import Data.Eq
import Data.EuclideanRing

isLeapYear :: Int -> Boolean
isLeapYear year_aleluya =
    (year_aleluya `mod` 4 == 0 ) &&
    (year_aleluya `mod` 100 /= 0 ) ||
    (year_aleluya `mod` 400 == 0 )