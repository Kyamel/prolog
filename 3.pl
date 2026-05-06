same(X,Y) :-
    X = Y.

same(X,Y) :-
    ground(X),
    ground(Y),
    X == Y.