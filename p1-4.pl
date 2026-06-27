unique(X, [X|XS]) :-
    \+ member(X, XS).

unique(X, [Y|XS]) :-
    dif(X, Y),
    unique(X, XS).

unique2(X, List) :-
    select(X, List, Rest),
    \+ memberchk(X, Rest).