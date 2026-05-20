lookup([par(X, Y)|_], X, Y).

lookup([_|Resto], X, Y) :-
    lookup(Resto, X, Y).