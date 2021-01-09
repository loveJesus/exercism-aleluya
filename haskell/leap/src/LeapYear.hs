-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.
module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool

isLeapYear year_aleluya = 
    (mod year_aleluya 4 == 0) && 
    (mod year_aleluya 100 /= 0) || 
    (mod year_aleluya 400 == 0)
