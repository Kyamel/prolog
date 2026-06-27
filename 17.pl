eval(t, t).
eval(f, f).

eval(lnot(E), V) :-
    eval(E, VE),
    lnot_val(VE, V),
    !.

eval(land(E1, E2), V) :-
    eval(E1, V1),
    eval(E2, V2),
    land_val(V1, V2, V),
    !.

eval(lor(E1, E2), V) :-
    eval(E1, V1),
    eval(E2, V2),
    lor_val(V1, V2, V),
    !.

lnot_val(t, f).
lnot_val(f, t).

land_val(t, t, t).
land_val(t, f, f).
land_val(f, t, f).
land_val(f, f, f).

lor_val(t, t, t).
lor_val(t, f, t).
lor_val(f, t, t).
lor_val(f, f, f).