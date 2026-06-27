statOf([], _, 0).
statOf([X|XS], E, N) :-
    statOf(XS, E, NRest),
    (
        X == E ->
        N is NRest + 1
    ;
        N = NRest
    ).