% ----------------------------
% Simulador de Máquina de Turing
% ----------------------------

final_state(qhalt).

% Exemplo: soma 1 a um número em unário.
% 111 vira 1111.

trans(q0, 1, q0, 1, right).
trans(q0, blank, qhalt, 1, stay).

% Um passo da máquina.
step(
    config(State, tape(Left, Current, Right)),
    config(NewState, NewTape)
) :-
    trans(State, Current, NewState, Write, Move),
    move(Move, tape(Left, Write, Right), NewTape).

% Movimento para a direita.
move(right, tape(Left, Current, [R|Right]), tape([Current|Left], R, Right)).
move(right, tape(Left, Current, []), tape([Current|Left], blank, [])).

% Movimento para a esquerda.
move(left, tape([L|Left], Current, Right), tape(Left, L, [Current|Right])).
move(left, tape([], Current, Right), tape([], blank, [Current|Right])).

% Movimento parado.
move(stay, Tape, Tape).

% Execução até estado final.
run(config(State, Tape), config(State, Tape)) :-
    final_state(State).

run(Config, FinalConfig) :-
    step(Config, NextConfig),
    run(NextConfig, FinalConfig).