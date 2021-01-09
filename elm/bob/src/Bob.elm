-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.   
module Bob exposing (hey)
import String
import List

hey : String -> String
hey p_remark_aleluya =
    let remark_aleluya = String.trim p_remark_aleluya in 
    let last_char_aleluya = (Maybe.withDefault  ' ' 
            (List.head 
                (String.toList 
                    (String.reverse remark_aleluya)))) in
    if  remark_aleluya == "" then
        "Fine. Be that way!"
    else if  ((String.toUpper remark_aleluya) == remark_aleluya) 
        && ((String.toLower remark_aleluya) /= remark_aleluya) then
        if last_char_aleluya == '?' then
            "Calm down, I know what I'm doing!"
        else
            "Whoa, chill out!"
    else if last_char_aleluya == '?' then  
        "Sure."
    else
        "Whatever."
    
