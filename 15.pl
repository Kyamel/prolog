:- use_module(library(clpfd)).

num2(A, B, N) :-
    A #\= 0,
    N #= 10*A + B.

tabuleiro(Vars) :-
    Vars = vars{
        a:A, b:B, c:C,
        d:D, e:E, f:F,
        g:G, h:H,
        i:I, j:J, k:K,
        l:L, m:M, n:N,
        o:O, p:P, q:Q
    },

    Digits = [
        A,B,C,
        D,E,F,
        G,H,
        I,J,K,
        L,M,N,
        O,P,Q
    ],

    Digits ins 0..9,

    % 7 × A = BC
    num2(B, C, BC),
    7 * A #= BC,

    % D × E = 40
    D * E #= 40,

    % 0 + 2 = F
    0 + 2 #= F,

    % G + H = 7
    G + H #= 7,

    % IJ - K = 2 + H
    num2(I, J, IJ),
    IJ - K #= 2 + H,

    % C × L = 15
    C * L #= 15,

    % I × LM = N
    num2(L, M, LM),
    I * LM #= N,

    % K × 5 = OP
    num2(O, P, OP),
    K * 5 #= OP,

    % O ÷ Q = 9
    % Em CLPFD é melhor escrever divisão como multiplicação:
    O #= 9 * Q,

    labeling([], Digits).

teste(K, O, P, Q) :-
    [K,O,P,Q] ins 0..9,
    O #\= 0,
    Q #\= 0,
    OP #= 10*O + P,
    K * 5 #= OP,
    O #= 9 * Q,
    labeling([], [K,O,P,Q]).