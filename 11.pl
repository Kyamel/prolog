somaDigitsS([], [], []).
somaDigitsS([X|XS], [Y|YS], [Z|ZS]) :-
    Z is X + Y,
    somaDigitsS(XS, YS, ZS).


mirror(XS, ZS) :-
    mirror_acc(XS, [], ZS).
mirror_acc([], Acc, Acc).
mirror_acc([X|XS], Acc, ZS) :-
    mirror_acc(XS, [X|Acc], ZS).


somaDigits(XS, YS, ZS) :-
    mirror(XS, RXS),
    mirror(YS, RYS),
    soma_rev(RXS, RYS, 0, RZS),
    mirror(RZS, ZS).

soma_rev([], [], 0, []) :- !.
soma_rev([], [], Carry, [Carry]) :-
    Carry > 0.
soma_rev([X|XS], [], Carry, [Z|ZS]) :-
    Soma is X + Carry,
    Z is Soma mod 10,
    NovoCarry is Soma // 10,
    soma_rev(XS, [], NovoCarry, ZS).
soma_rev([], [Y|YS], Carry, [Z|ZS]) :-
    Soma is Y + Carry,
    Z is Soma mod 10,
    NovoCarry is Soma // 10,
    soma_rev([], YS, NovoCarry, ZS).
soma_rev([X|XS], [Y|YS], Carry, [Z|ZS]) :-
    Soma is X + Y + Carry,
    Z is Soma mod 10,
    NovoCarry is Soma // 10,
    soma_rev(XS, YS, NovoCarry, ZS).