major([X|XS], Maior) :-
    number(X),
    major_aux(XS, X, Maior).

major_aux([], Maior, Maior).

major_aux([X|XS], GreaterSoFar, Maior) :-
    number(X),
    X > GreaterSoFar,
    !,
    major_aux(XS, X, Maior).

major_aux([X|XS], GreaterSoFar, Maior) :-
    number(X),
    major_aux(XS, GreaterSoFar, Maior).

% Or we can use the if-then-else approach to avoid the cut:
/*
major_aux([X|XS], GreaterSoFar, Maior) :-
    number(X),
    (
        X > GreaterSoFar ->
        NewGreater = X
    ;
        NewGreater = GreaterSoFar
    ),
    major_aux(XS, NewGreater, Maior).
*/
