p(a).
p(b).

q(a).

not(G) :-
    call(G),
    !,
    fail.

not(_).

homem(joao).
homem(pedro).

mortal(X) :-
    homem(X).

/*
A negação por falha finita em Prolog considera que um objetivo negado \+ G é verdadeiro quando a tentativa
de provar G falha finitamente. Portanto, \+ G não representa a negação lógica clássica de G, mas sim a
impossibilidade de provar G com as cláusulas disponíveis no programa.

Por exemplo, dado o programa:

p(a).

A consulta \+ p(b) tem sucesso, pois p(b) não pode ser provado. Porém, a consulta \+ p(X) falha,
pois p(X) pode ser provado com X = a. Isso mostra que o not de Prolog não significa “encontre um X
para o qual p(X) é falso”, mas sim “falhe se existir alguma prova para p(X)”.

Outro exemplo é:

p(a).
p(b).
q(a).

A consulta p(X), \+ q(X) retorna X = b. Porém, \+ q(X), p(X) falha, porque q(X) é provado com X = a,
fazendo a negação falhar antes de X ser instanciado por p(X). Assim, o comportamento do not depende da
instanciação das variáveis e da ordem dos objetivos.
*/