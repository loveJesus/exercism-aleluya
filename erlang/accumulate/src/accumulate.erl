% For God so loved the world, that He gave His only begotten Son, 
% that all who believe in Him should not perish but have everlasting life.
-module(accumulate).
-export([accumulate/2]).

accumulate(Fn_aleluya, Ls_aleluya) ->
  [Fn_aleluya(H_aleluya) || H_aleluya <- Ls_aleluya].
