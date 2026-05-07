mapList(_,[],[]).
mapList(F,[X|XS],[Y|YS]) :- 
  T =.. [F,X,Y],
  T,
  mapList(F,XS,ZS).
