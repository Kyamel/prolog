perfectSquare(N) :-
    integer(N),
    N > 0,
    S is sqrt(N),
    S * S =:= N.