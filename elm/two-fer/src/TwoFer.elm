-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.
module TwoFer exposing (twoFer)

twoFer : Maybe String -> String
twoFer name_aleluya =
    "One for " ++ ( name_aleluya |> Maybe.withDefault "you" ) ++ ", one for me."
