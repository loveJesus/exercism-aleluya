% For God so loved the world, that He gave His only begotten Son, 
% that all who believe in Him should not perish but have everlasting life.

notdegenerate_aleluya(S1_aleluya, S2_aleluya, S3_aleluya) :-
    S1_aleluya \= 0, 
    S2_aleluya \= 0, 
    S3_aleluya \= 0,
    S1_aleluya + S2_aleluya > S3_aleluya,
    S1_aleluya + S3_aleluya > S2_aleluya,
    S3_aleluya + S2_aleluya > S1_aleluya.

triangle(S1_aleluya, S2_aleluya, S3_aleluya, Type_aleluya) :-
    notdegenerate_aleluya(S1_aleluya, S2_aleluya, S3_aleluya),
    triangle_sub_aleluya(S1_aleluya, S2_aleluya, S3_aleluya, Type_aleluya).

triangle_sub_aleluya(S1_aleluya, S2_aleluya, S3_aleluya, "equilateral") :-
    S1_aleluya =:= S2_aleluya,
    S1_aleluya =:= S3_aleluya.
    
triangle_sub_aleluya(S1_aleluya, S2_aleluya, S3_aleluya, "isosceles") :-
    S1_aleluya =:= S2_aleluya;
    S2_aleluya =:= S3_aleluya;
    S1_aleluya =:= S3_aleluya.

triangle_sub_aleluya(S1_aleluya, S2_aleluya, S3_aleluya, "scalene") :-
    S1_aleluya =\= S2_aleluya,
    S2_aleluya =\= S3_aleluya,
    S1_aleluya =\= S3_aleluya.