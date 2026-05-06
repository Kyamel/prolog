nat(z).
nat(s(X)) :- nat(X).

soma(z,Y,Y).
soma(s(X),Y,s(Z)) :- soma(X,Y,Z).

mult(z,_,z).
mult(s(X),Y,Z) :- mult(X,Y,W),soma(Y,W,Z).

<=(z, _).
<=(s(X), s(Y)) :-
    <=(X, Y).

div(_,z,_) :- !, fail.
div(z,_,z) :- !.
div(X,Y,Z) :-
    <=(Z,X),
    mult(Z,Y,X),
    !.

isPrime(s(s(z))) :- !.  % 2 é primo
isPrime(N) :-
    N \= z,
    N \= s(z),
    isPrime(N, s(s(z))).

isPrime(N, N) :- !.

isPrime(N,D) :-
    \+ div(N,D,_),
    soma(D,s(z),R),
    isPrime(N,R).

natToInt(z, 0).
natToInt(s(N), I) :-
    natToInt(N, J),
    I is J + 1.

intToNat(0,z) :- !.
intToNat(I,s(N)) :-
    I > 0,
    J is I - 1,
    intToNat(J,N).

perfectSquare(z) :- !,fail.
perfectSquare(N) :-
    <=(S, N),
    mult(S, S, N),
    !.