:- use_module(library(clpfd)).

rainhas(Qs,N) :-
    length(Qs, N),
    Qs ins 1..N,
    all_distinct(Qs),
    diagonais_seguras(Qs),
    labeling([], Qs).

diagonais_seguras([]).
diagonais_seguras([Q|Qs]) :-
    diagonais_seguras(Qs, Q, 1),
    diagonais_seguras(Qs).

diagonais_seguras([], _, _).
diagonais_seguras([Q2|Qs], Q1, Dist) :-
    Q1 #\= Q2 + Dist,
    Q1 #\= Q2 - Dist,
    Dist1 #= Dist + 1,
    diagonais_seguras(Qs, Q1, Dist1).