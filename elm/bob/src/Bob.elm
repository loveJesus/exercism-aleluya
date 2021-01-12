-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.   
module Bob exposing (hey)
import String
import List

type TrimmedStringAleluya = TrimmedAleluya String

trim_string_aleluya : String -> TrimmedStringAleluya
trim_string_aleluya str_aleluya = TrimmedAleluya (String.trim str_aleluya)

get_last_trimmed_char_aleluya : TrimmedStringAleluya -> Char
get_last_trimmed_char_aleluya tstr_aleluya =
    case tstr_aleluya of
        TrimmedAleluya str_aleluya ->
            str_aleluya
            |> String.reverse
            |> String.toList
            |> List.head
            |> Maybe.withDefault ' '

is_empty_trimmed_string_aleluya : TrimmedStringAleluya -> Bool
is_empty_trimmed_string_aleluya tstr_aleluya =
    case tstr_aleluya of
        TrimmedAleluya str_aleluya ->
            str_aleluya == ""

is_shouting_trimmed_string_aleluya tstr_aleluya =
    case tstr_aleluya of
        TrimmedAleluya str_aleluya ->
            (((String.toUpper str_aleluya) == str_aleluya) 
            && ((String.toLower str_aleluya) /= str_aleluya) )

is_question_trimmed_string_aleluya tstr_aleluya =
    get_last_trimmed_char_aleluya tstr_aleluya == '?'

hey : String -> String
hey p_remark_aleluya =
    let trimmed_remark_aleluya = trim_string_aleluya p_remark_aleluya in 

    if  is_empty_trimmed_string_aleluya trimmed_remark_aleluya then
        "Fine. Be that way!"

    else if is_shouting_trimmed_string_aleluya trimmed_remark_aleluya then
        if is_question_trimmed_string_aleluya trimmed_remark_aleluya then
            "Calm down, I know what I'm doing!"
        else
            "Whoa, chill out!"

    else if is_question_trimmed_string_aleluya trimmed_remark_aleluya then  
        "Sure."

    else
        "Whatever."
    
