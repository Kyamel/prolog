inverte([], []).
inverte([X|XS], YS) :-
    inverte(XS, R),
    append(R, [X], YS).

mirror(XS, ZS) :-
    mirror_acc(XS, XS, ZS).
mirror_acc([], Acc, Acc).
mirror_acc([X|XS], Acc, ZS) :-
    mirror_acc(XS, [X|Acc], ZS).


get(0, [X|_], X) :- !.
get(N, [_|XS], R) :-
    N > 0,
    N1 is N - 1,
    get(N1, XS, R).