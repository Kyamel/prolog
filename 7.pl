mersenne(N, P) :-
    N is 2^P - 1.

num(X,U) :- U > 0, Z is U -1, num(X,Z).
num(X,Z).

mersenne2(0,0)
mersenne2(N,P) :- num(P,N),N is 2^P -1,!.
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
