r(10000).
r(5000).
r(1000).


res(r(V), V) :-
    r(V).

res(seq(R1, R2), V) :-
    res(R1, V1),
    res(R2, V2),
    V is V1 + V2.

res(par(R1, R2), V) :-
    res(R1, V1),
    res(R2, V2),
    V is V1 * V2 / (V1 + V2).
