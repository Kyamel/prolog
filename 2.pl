palavra(c,a,r,t,a).
palavra(c,a,n,i,l).
palavra(c,r,a,v,o).
palavra(t,r,a,m,a).
palavra(p,r,a,t,o).
palavra(a,r,t,e,s).
palavra(r,a,t,o,s).

testaPalavra(P1,P2,P3,P4,P5) :-
    palavra(P1, P2, P3, P4, P5).

fimComum(palavra(A,B,C,D,F), palavra(G,H,I,J,F)) :-
    palavra(A,B,C,D,F),
    palavra(G,H,I,J,F),
    palavra(A,B,C,D,F) \= palavra(G,H,I,J,F).
