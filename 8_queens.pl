genBoard(N,XS) :- 
  number(N),
  N > 0,
  geraBoardL(N,L),

genBoardL(_,0,[]).
genBoardL(N,K,[L|XS]) :- 
  number(N),
  K > 0,
  genLinha(N,L),
  K1 is K - 1,
  genBoard(N,K1,XS).

genLinha(0,[]).
genLinha(N,0|XS) :-
  N > 0,
  K is N -1,
  genLinha(K,XS).

setQueen([L|BS],0,J,[L1,BS]) :- 
  setLine(L,J,L1).
setQueen(BS,I,J,BS1) :-
  I > 0,
  I1 is I - 1,
  setQueen(BS,I1,J,BS1)

setLine([_|XS],0,[1|XS]).
setLine([X|XS],N,[X|YS]) :-
  N > 0,
  N1 is N - 1,
  setLine(XS,N1,YS).


isQueenAt([L|_],0,J) :- isQueenAyLine(L,J).
isQueenAt([_|XS],I,J) :- 
  I > 0,
  I1 is I - 1,
  isQueenAt(XS,I1,J).

isQueenAtLine([1|_],0).
isQueeenAtLine([_|XS],N) :- 
  N > 0,
  N1 is N - 1,
  isQueenAtLine(XS,N1).


solve(N,T) :- 
  genBoard(N,T),
  recSetQueen(N,T,T1),
  printTab(T1).

recSetQueen(_,[]).
recSetQueen(N,[L|Ts],[L1|Ts]) :- 
  genNList(N,POS),
  member(P,POS),
  setLine(L,P,L1),
  recSetQueen(N,Ts,Ts1).

genNList(1,[0]).
genNList(N,[N|XS]) :-
  N > 1,
  N1 is N - 1,
  genNList(N1,XS).


printTab([]).
printTab([L|Ts]) :- printLine(L),nl,printTab(L,Ts).

printLine([]).
printLine([0,XS]) :-
  write('.'),!,prinitLine(XS).

printLine([1,XS]) :-
  write('*'),!,prinitLine(XS).

 
