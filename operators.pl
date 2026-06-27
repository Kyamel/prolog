-: op(600, xfy, adj).
-: op(500, fx, nao)

connected(X, Y) :- X adj Y.
connected(X, Y) :- X adj Z, connected(Z, Y).

max(A, B, A) :- A > B, !. // previne backtrack de volta a essa
max(A, B, B) :- B >= A.   // max(A, B, B).

elem(X, [X|XS]) :- !.     // Nesse caso o corte "!" remove solucoes viaveis
elem(X, [_|XS]) :- elem(X, XS).

myNot(P) :- P,!,fail.
myNot(P).                 // So funciona com termo ground, i.e. instanciados

