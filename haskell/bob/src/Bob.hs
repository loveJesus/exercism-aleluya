-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.
module Bob (responseFor) where
import Data.Char (isSpace, toUpper, toLower)
import Data.List (dropWhileEnd)

trim_aleluya :: String -> String

trim_aleluya = dropWhileEnd isSpace . dropWhile isSpace


responseForTrimmed_aleluya :: String -> String

responseForTrimmed_aleluya xst_aleluya 
    | xst_aleluya == "" = 
        "Fine. Be that way!"

    | map toUpper xst_aleluya == xst_aleluya &&
      map toLower xst_aleluya /= xst_aleluya = 
        if last xst_aleluya == '?' 
            then "Calm down, I know what I'm doing!"
            else "Whoa, chill out!"

    | last xst_aleluya == '?' = "Sure."

    | otherwise = "Whatever."


responseFor :: String -> String

responseFor xs_aleluya = 
    let xst_aleluya = trim_aleluya xs_aleluya in
    responseForTrimmed_aleluya (xst_aleluya)

