% For God so loved the world, that He gave His only begotten Son, 
% that all who believe in Him should not perish but have everlasting life.
-module(leap).
-export([leap_year/1]).
leap_year(Year_aleluya) -> 
    (Year_aleluya rem 4 == 0) and (
        (Year_aleluya rem 100 /= 0) or
        (Year_aleluya rem 400 == 0)).
