mersenne(N, P) :-
    integer(N),
    N > 0,
    MaxP is N - 1,
    gera_p(1, MaxP, P),
    N =:= 2**P - 1.

gera_p(P, MaxP, P) :-
    P =< MaxP.

gera_p(Atual, MaxP, P) :-
    Atual < MaxP,
    Prox is Atual + 1,
    gera_p(Prox, MaxP, P).