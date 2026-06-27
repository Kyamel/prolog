adj(a,b).
adj(b,c).

:-dynamic adj/2.

fecho(A,[A]).
fecho(A,[A|XS]) :- adj(A,B),fecho(B,XS).

calc :- member(X,[1,2,3,4,5,6,7,8,9]), member(Y,[1,2,3,4,5,6,,7,8,9]),Z is X*Y,assert(prod(X,Y,Z)),fail.
