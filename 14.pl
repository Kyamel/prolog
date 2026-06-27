coincide([W1], [W2]) :-
    !,
    W1 == W2.
coincide([_|W1], [_|W2]) :-
    !,
    coincide(W1,W2).

coincide(W1, W2) :-
    \+ is_list(W1),
    \+ is_list(W2),
    W1 =.. U,
    W2 =.. V,
    coincide(U, V).

coincide1(wrd3(_, _, X), wrd3(_, _, Y)) :-
    X == Y.