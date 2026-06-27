
% estados

% estado(LocMacaco, LocBananas, LocCaixa, ChaoOrCaixa,PossuiBananas)


action(pegar, 
  e(LB,LB,LB,chao,nao), 
  e(LB,LB,LB,cx,tem)).
action(subir, 
  e(A,A,LB,chao,T), 
  e(A,A,LB,cx,T)).
action(empurrar(A,B), 
  e(A,A,LB,chao,T), 
  e(B,B,LB,chao,T)).
action(mover(A,B), 
  e(A,LC,LB,chao,T), 
  e(B,LC,LB,chao,T)).

solve(e(_,_,_,_,tem),[]).
solve(S,[A|AS]) :-
  action(A,S,S1),
  solve(S1,AS).

solveBFS(XS,P) :- member(plan(P,e(_,_,_,_,tem)),XS).
solveBFS([plan(AS,S)|SS],P) :-
  findall(plan([A|AS],S1), action(A,S,S1), XS),
  append(SS,XS,ZS),
  solveBFS(ZS,P).
