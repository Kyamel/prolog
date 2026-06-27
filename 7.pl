mersenne(N, P) :-
    N is 2^P - 1.

num(X,U) :- U > 0, Z is U -1, num(X,Z).
num(X,Z).

mersenne2(0,0)
mersenne2(N,P) :- num(P,N),N is 2^P -1,!.
