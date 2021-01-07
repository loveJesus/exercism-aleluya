% For God so loved the world, that He gave His only begotten Son, 
% that all who believe in Him should not perish but have everlasting life.
-module(two_fer).
-export([two_fer/0, two_fer/1]).

two_fer() -> two_fer("you"). 
two_fer(Name_aleluya) -> "One for " ++ Name_aleluya ++ ", one for me.".
