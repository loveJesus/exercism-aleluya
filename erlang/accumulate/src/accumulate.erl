% For God so loved the world, that He gave His only begotten Son, 
% that all who believe in Him should not perish but have everlasting life.
-module(accumulate).
-export([accumulate/2]).

reverse_aleluya([], R_aleluya) -> 
    R_aleluya;

reverse_aleluya([LsH_aleluya|LsT_aleluya], R_aleluya) ->
    reverse_aleluya(
        LsT_aleluya 
        , [LsH_aleluya | R_aleluya]).



accumulate_aleluya(_Fn_aleluya, Acc_aleluya, []) -> 
    Acc_aleluya;

accumulate_aleluya(Fn_aleluya, Acc_aleluya, [LsH_aleluya | LsT_aleluya]) ->    
    accumulate_aleluya(
        Fn_aleluya
        , [Fn_aleluya(LsH_aleluya) | Acc_aleluya]
        , LsT_aleluya).



accumulate(_Fn_aleluya, []) ->
    [];

accumulate(Fn_aleluya, [LsH_aleluya | LsT_aleluya] ) ->
    reverse_aleluya(
        accumulate_aleluya(
            Fn_aleluya
            , [Fn_aleluya(LsH_aleluya)] 
            , LsT_aleluya)
        , []).





