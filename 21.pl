% auto_digital(N)
% Verdadeiro se N é um número inteiro >= 0
% e sua raiz digital aparece entre seus dígitos.

auto_digital(N) :-
    integer(N),
    N >= 0,
    digital_root(N, R),
    has_digit(N, R).

digital_root(N, N) :-
    N >= 0,
    N =< 9.
digital_root(N, R) :-
    N > 9,
    sum_digits(N, S),
    digital_root(S, R).

sum_digits(0, 0).
sum_digits(N, S) :-
    N > 0,
    Digit is N mod 10,
    Rest is N // 10,
    sum_digits(Rest, SRest),
    S is Digit + SRest.

has_digit(N, D) :-
    N >= 0,
    D >= 0,
    D =< 9,
    has_digit_aux(N, D).

has_digit_aux(N, N) :-
    N >= 0,
    N =< 9.
has_digit_aux(N, D) :-
    N > 9,
    Last is N mod 10,
    (
        Last =:= D
    ;
        Rest is N // 10,
        has_digit_aux(Rest, D)
    ).