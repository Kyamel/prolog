nat(L) :-
    nat_aux(1, L).

nat_aux(N, [N]).

nat_aux(N, [N|XS]) :-
    N1 is N + 1,
    nat_aux(N1, XS).