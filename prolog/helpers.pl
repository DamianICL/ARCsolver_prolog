% Solution script for part a) of the coursework.

all_rows(Rs):-
    setof(Rows, X^Y^input_colour(Rows, X, Y), Rs),
    !.

all_cols(Cs):-
    setof(Col, input_colour(_, Col, _), Cs),
    !.

% This is a dummy predicate. You should fill in as instructed in the coursework spec
row(R):-
    all_rows(Rs),
    member(R, Rs).

% This is a dummy predicate. You should fill in as instructed in the coursework spec
col(C):-
    all_cols(Cs),
    member(C, Cs).

nrows(NR):-
    all_rows(Rs),
    length(Rs, NR).

ncols(NC):-
    all_cols(Cs),
    length(Cs, NC).

min([], _):-
    false.

min(L, Min):-
    sort(L, [Min | _]).

max([X | XS], Max) :-
    max_acc([X | XS], X, Max).

max_acc([], CurrentMax, CurrentMax).

max_acc([X | XS], CurrentMax, Max) :-
    NewMax is max(X, CurrentMax),
    max_acc(XS, NewMax, Max).