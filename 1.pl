caso_a :-
    f(X, a) = f(f(Y, b), Y),
    write('X = '), writeln(X),
    write('Y = '), writeln(Y).

caso_b :-
    f(suc(z), X, z) = f(X, Y, X),
    write('X = '), writeln(X),
    write('Y = '), writeln(Y).

caso_c :-
    g(X) = f(Y),
    write('X = '), writeln(X),
    write('Y = '), writeln(Y).

caso_d :-
    g(f(X), X) = g(Y, f(h(a))),
    write('X = '), writeln(X),
    write('Y = '), writeln(Y).

caso_e :-
    f(X) = X,
    write('X = '), writeln(X).


%f(X,a) = f(f(Y,b),Y).
%X -> f(Y,b)
%f(X,a) = f(X,Y).
%Y -> a, X -> f(a,b)
%f(f(a,b),a) = f(f(a,b),a).

%f(suc(z),X,z) = f(X,Y,X).
%X -> suc(z)
%Y -> suc(z)
%suc(z) = z %false

%g(X) = f(Y).
%X -> a
%Y -> a
%false, because g/1 and f/1 are different functors.

%g(f(X),X) = g(Y,f(h(a))).
%Y -> f(X)
%X -> f(h(a)), Y -> f(f(h(a)))
%g(f(f(h(a))),f(h(a))) = g(f(f(h(a))),f(h(a))).

%f(X) = X.
%X -> f(X)
%f(f(X)) = f(X)
%f(f(f(X))) = f(f(X))
%false, because this leads to an infinite loop of substitutions.