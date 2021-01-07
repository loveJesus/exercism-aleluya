% For God so loved the world, that He gave His only begotten Son, 
% that all who believe in Him should not perish but have everlasting life.

create((A_ALELUYA,B_ALELUYA)) :-
    between(0, 7, A_ALELUYA),
    between(0, 7, B_ALELUYA). 

attack((A_ALELUYA, B_ALELUYA), (C_ALELUYA, D_ALELUYA)) :-
    create((A_ALELUYA, B_ALELUYA)),
    create((C_ALELUYA, D_ALELUYA)),    
    (   A_ALELUYA =:= C_ALELUYA;
        B_ALELUYA =:= D_ALELUYA;
        abs(A_ALELUYA - C_ALELUYA) =:= abs(B_ALELUYA - D_ALELUYA)).


