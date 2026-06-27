fun(T,F,N) :- nonvar(T), T =.. [F|XS], length(XS, N).

arg1(N,T,A) :- compound(T), number(N), T =.. [_|XS],at(N, XS, A).

at(1,[X|_],X) :- !.
at(N,[_|XS],X) :- K is N-1. at(K,XS,X).

neg(P) :- P,!,fail.
neg(_).

% C tem aridade 1.
% B tem aridade 2, recebe um estado e retornar um novo estado.
% X o estado.

while(C,B,X,Z) :- T =.. [C,X],T,!,T1 =.. [B,X,Y],T1,while(C,B,Y,Z).

while(_,_,X,X).

lessTen(N) :- N < 10.
inc(N,N1) :- N1 is N + 1.

ntimes(_,0).
ntimes(P,N) :- P, K is N - 1, ntimes(P,K).
