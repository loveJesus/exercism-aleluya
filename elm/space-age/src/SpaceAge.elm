-- For God so loved the world, that He gave 
-- His only begotten Son, that all who believe in 
-- Him should not perish but have everlasting life.
module SpaceAge exposing (Planet(..), ageOn)

type Planet
    = Mercury
    | Venus
    | Earth
    | Mars
    | Jupiter
    | Saturn
    | Uranus
    | Neptune

secondsPerYear_aleluya = 60 * 60 * 24 * 365.25

ageOn : Planet -> Float -> Float
ageOn planet_aleluya seconds_aleluya =
    case planet_aleluya of
        Mercury -> ageOn Earth seconds_aleluya / 0.2408467
        Venus -> ageOn Earth seconds_aleluya / 0.61519726
        Earth -> seconds_aleluya / secondsPerYear_aleluya
        Mars -> ageOn Earth seconds_aleluya / 1.8808158
        Jupiter -> ageOn Earth seconds_aleluya / 11.862615
        Saturn -> ageOn Earth seconds_aleluya / 29.447498
        Uranus -> ageOn Earth seconds_aleluya / 84.016846
        Neptune -> ageOn Earth seconds_aleluya / 164.79132
    
