hello :- write('Ola mundo').

hello2 :- member(X, [1, 2, 3, 4]), write(X), nl, fail.

ler :- read(X), number(X), X = 0.

path(X,Y) :- adj(X,Y).
path(X,Y) :- adj(X,Z), path(Z,Y).

profMe :- read(X), X.

adj(a, b).
adj(a, c).

% pathList(X,Y,[]) :- atom(X),atom(Y), \+ adj(X,Y).
pathList(X,Y,[X,Y]) :- adj(X,Y).
pathList(X,Y,[X|ZS]) :- adj(X,Z), pathList(Z,Y,ZS).

testPath :- read(X),read(Y),atom(X),atom(Y),pathList(X,Y,LS),write(LS).

pathServer :- read(X),read(Y),process(X,Y).

process(X,Y) :- atom(X),atom(Y),!,pathList(X,Y,ZS),write(ZS),pathServer.

process(X,Y) :- write('Server down').

fileSave :- tell('saida.txt'),write('adj(a,b).'),nl,told,write('Escrito!').

fileRead :- see('saida.txt'),read(X),X,write(X),nl,seen.

% decomposicao de termos

%subs(_,_,[],[]) :- !.
subs(X,E1,[X|XS],[E1|ZS]) :- !,subs(X,E1,XS,ZS).
subs(E,E1,[X|XS],[X|ZS]) :- E \== X,!, subs(E,E1,XS,ZS).

replaceVar(varName, Val, Exp, Expr) :- Exp = .. [OP,EE,ED],replV(OP,EE,ED,VarName,Val,Exp).

replaceVar(_, _, Exp, Expr) :- Exp = number(Exp).

replaceVar(varName, Val, Exp, Expr).

replV(OP,EE,ED,Vr,Vl,E) :- replaceVar(Vr,Vl,EE,NEE),replaceVar(Vr,Vl,ED,NED),E =.. [OP,NEE,NED].

simplify(E,E) :- number(E); atomic(E).
simplify(E,Es) :- E -.. [OP,X,Y], number(X), number(Y),member(OP,[+,-,*,/]),!, Es is E.

simplify(E,Es) :- E -.. [OP,X,Y], simplify(X,X1),Es =.. [OP,X1,Y].

simplify(E,Es) :- E -.. [OP,X,Y], simplify(Y,Y1),Es =.. [OP,X,Y1].

simplify(*(E,+(EE,DD)),(+(*(EE,E),*(DD,E)))).
simplify(*,(+(EE,DD),E),(+,(*(EE,E),)))


