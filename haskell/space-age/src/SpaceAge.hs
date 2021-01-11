-- For God so loved the world, that He gave His only begotten Son, 
-- that all who believe in Him should not perish but have everlasting life.
module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet_aleluya seconds_aleluya =
    let seconds_per_year_aleluya = 60 * 60 * 24 * 365.25 in
    let years_aleluya = seconds_aleluya / seconds_per_year_aleluya in
    years_aleluya / case planet_aleluya of
        Mercury -> 0.2408467
        Venus -> 0.61519726
        Earth -> 1.0
        Mars -> 1.8808158
        Jupiter -> 11.862615
        Saturn -> 29.447498
        Uranus -> 84.016846
        Neptune -> 164.79132
