repeat(0,_,_) :- !.
repeat(N,P,Log) :-
    integer(N),
    N > 0,
    I is N - 1,
    (   Log == log
    ->  write(I), nl
    ;   true
    ),
    P,
    repeat(I,P, Log).