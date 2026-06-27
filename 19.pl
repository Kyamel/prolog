factors(N, XS) :-
    N > 0,
    factors(N, 2, XS).

factors(1, _, []) :- !.

factors(N, K, [K|XS]) :-
    N > 1,
    K =< N,
    0 is N mod K,
    !,
    D is N // K,
    factors(D, K, XS).

factors(N, K, XS) :-
    N > 1,
    K =< N,
    K1 is K + 1,
    factors(N, K1, XS).

prime(N) :-
    integer(N),
    N > 1,
    factors(N, XS),
    XS = [N].