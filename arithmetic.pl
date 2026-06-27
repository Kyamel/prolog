nat(z).
nat(suc(z)) :- nat(N).

add(z, N2 , N2).
add(suc(X), N2, suc(R)) :- add(X, N2, R).

sub(X, Y, Z) :- add(Z, Y, X).

mult(z, _, z).
mult(suc(X), Y, R) :- mult(X, Y, R1),
                 	add(Y, R1, R).

divi(X, Y, Z) :- mult(Y, Z, X).

natToInt(z, 0).
natToInt(suc(N), I) :- natToInt(N, I1), I is I1 + 1.
