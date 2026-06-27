nil.
tree(8,
    tree(3,
        tree(1, nil, nil),
        tree(6, nil, nil)
    ),
    tree(10,
        nil,
        tree(14, nil, nil)
    )
).

altura(nil, 0).

altura(tree(_, Esq, Dir), H) :-
    altura(Esq, HE),
    altura(Dir, HD),
    Maior is max(HE, HD),
    H is Maior + 1.

balanceada(nil).

balanceada(tree(_, Esq, Dir)) :-
    altura(Esq, HE),
    altura(Dir, HD),
    Dif is abs(HE - HD),
    Dif =< 1,
    balanceada(Esq),
    balanceada(Dir).


balanceadaFast(T) :-
    altura_balanceada(T, _).

altura_balanceada(nil, 0).

altura_balanceada(tree(_, Esq, Dir), H) :-
    altura_balanceada(Esq, HE),
    altura_balanceada(Dir, HD),
    Dif is abs(HE - HD),
    Dif =< 1,
    H is max(HE, HD) + 1.


unflatten(leaf(X), [X]).

unflatten(tree(R, E, D), List) :-
    append(Left, [R|Right], List),
    unflatten(E, Left),
    unflatten(D, Right).

eval(leaf(X), X, X).
eval(tree(R, E, D), Value, Eq) :-
    eval(E, _, EqE),
    eval(D, _, EqD),
    Eq =.. [R, EqE, EqD],
    Value is Eq.