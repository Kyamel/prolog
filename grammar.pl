% GLC - Gramaticas livres de contexto

%prod(sentenca,[sujeito, verbo]).
%prod(sujeito,[o,nome]).
%prod(nome,[coelho]).
%prod(nome,[lobo]).
%prod(verbo,[corre]).
prod(p,[]).
prod(p,[a,p,a]).
prod(p,[b,p,b]).

step(X,Y) :- 
  append(Left,[Lhs|Right],X),
  prod(Lhs,Rhs),
  append(Left,Rhs,Tmp),
  append(Tmp,Right,Y).

der(X,Y) :-
  step(X,Y).
der(X,Y) :-
  step(X,Z), der(Z,Y).
   
step2(X,Y,XS) :-
   append(Left,[Lhs|Right],X),
   XS = prod(Lhs,Rhs),
   XS,
   append(Left,Rhs,Tmp),
   append(Tmp,Right,Y).

der2(X,Y,[P]) :- 
   step2(X,Y,P).
der2(X,Y,P|PS) :- 
   step2(X,Z,P),
   der2(Z,Y,PS).


