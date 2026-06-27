prefix([], _).

prefix([X|XS], [X|YS]) :-
    prefix(XS, YS).