-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.
module Pangram (isPangram) where
import Data.Char

letters_aleluya :: String

letters_aleluya = ['a' .. 'z']

isPangram :: String -> Bool

isPangram text_aleluya =
    let cleanText_aleluya = map toLower text_aleluya in
    all (`elem` cleanText_aleluya) letters_aleluya 
