sublist([], _).
sublist([X|XS], [X|YS]) :-
    sublist(XS, YS).
sublist(XS, [_|YS]) :-
    sublist(XS, YS).

sublistDet([], _).
sublistDet([X|XS], [Y|YS]) :-
    (
        X = Y ->
        sublistDet(XS, YS)
    ;
        sublistDet([X|XS], YS)
    ).


prefix([], _).
prefix([X|XS], [X|YS]) :-
    prefix(XS, YS).

sublist_contigua(XS, YS) :-
    prefix(XS, YS).
sublist_contigua(XS, [_|YS]) :-
    sublist_contigua(XS, YS).

contigueSublist(XS, YS) :-
    append(_, Rest, YS),
    append(XS, _, Rest).
