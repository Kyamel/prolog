fib([]).
fib([0]).
fib([0, 1 | NS]) :-
    fib_aux(NS, 0, 1).

fib_aux([], _, _).

fib_aux([N | NS], A, B) :-
    N is A + B,
    fib_aux(NS, B, N).


:- use_module(library(clpfd)).

allSums([], 0).

allSums([X | XS], S) :-
    allSums(XS, SRest),
    S #= SRest + X.