-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.
module Bob (responseFor) where
import Data.Char (isSpace, toUpper, toLower)
import Data.List (dropWhileEnd)

-- To help functions know an already trimmed string is being parsed
newtype TrimmedAleluya = TrimmedAleluya String
unTrimmedAleluya :: TrimmedAleluya -> String
unTrimmedAleluya (TrimmedAleluya str_aleluya) = str_aleluya

trim_aleluya :: String -> TrimmedAleluya
trim_aleluya = TrimmedAleluya . dropWhileEnd isSpace . dropWhile isSpace

isEmptyTrimmed_aleluya :: TrimmedAleluya -> Bool
isEmptyTrimmed_aleluya tstr_aleluya = 
    unTrimmedAleluya tstr_aleluya == ""

isQuestionTrimmed_aleluya :: TrimmedAleluya -> Bool
isQuestionTrimmed_aleluya tstr_aleluya =
    last (unTrimmedAleluya tstr_aleluya) == '?'

isUppercaseTrimmed_aleluya :: TrimmedAleluya -> Bool
isUppercaseTrimmed_aleluya tstr_aleluya =
    let xst_aleluya = unTrimmedAleluya tstr_aleluya in
    map toUpper xst_aleluya == xst_aleluya &&
    map toLower xst_aleluya /= xst_aleluya


responseForTrimmed_aleluya :: TrimmedAleluya -> String
responseForTrimmed_aleluya tstr_aleluya 
    | isEmptyTrimmed_aleluya tstr_aleluya =
        "Fine. Be that way!"

    | isUppercaseTrimmed_aleluya tstr_aleluya =
        if isQuestionTrimmed_aleluya tstr_aleluya
            then "Calm down, I know what I'm doing!"
            else "Whoa, chill out!"

    | isQuestionTrimmed_aleluya tstr_aleluya =
        "Sure."

    | otherwise = 
        "Whatever."


responseFor :: String -> String
responseFor xs_aleluya = 
    let trimmed_aleluya = trim_aleluya xs_aleluya in
    responseForTrimmed_aleluya trimmed_aleluya

