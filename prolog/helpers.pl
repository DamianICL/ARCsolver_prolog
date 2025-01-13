% Solution script for part a) of the coursework.

all_rows(Rs):-
    setof(Rows, X^Y^input_colour(Rows, X, Y), Rs).

all_cols(Cs):-
    setof(Col, X^Y^input_colour(X, Col, Y), Cs).

row(R):-
    all_rows(Rs),
    member(R, Rs).

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

which_coloured(Colours):-
    setof((X, Y, Colour) , (input_colour(X, Y, Colour), Colour \= black), Colours).

edge_row((X, _, _)) :-
    all_rows(Rows),
    max(Rows, Max),
    (X = 0 ; X = Max).

is_col([(X, Y, _), (X1, Y1, _)]):-
    Y \= Y1,
    edge_row((X, Y, black)),
    edge_row((X1, Y1, black)).

distance_apart([(X, Y, _), (X1, Y1, _)], Distance):-
    (edge_row((X, Y, black)), edge_row((X1, Y1, black))),
    !,
    Distance is abs(Y - Y1).

distance_apart([(X, _, _), (X1, _, _)], Distance):-
    Distance is abs(X-X1).

column_colour([(_, Y, _), (_, Y1, _)], Y2, _, Colour):-
    Y2 < min(Y, Y1),
    !,
    Colour = black.
column_colour([(_, Y, C), (_, _, _)], Y2, Step, Colour):-
    0 is (Y2 - Y) mod (Step * 2),
    !,
    Colour = C.
column_colour([_, (_, Y1, C1)], Y2, Step, Colour):-
    0 is (Y2 - Y1) mod (Step * 2),
    !,
    Colour = C1.
column_colour(_, _, _, black).

row_colour([(X, _, _), (X1, _, _)], X2, _, Colour) :-
    X2 < min(X, X1),
    !,
    Colour = black.
row_colour([(X, _, C), _], X2, Step, Colour) :-
    0 is (X2 - X) mod (Step * 2),
    !,
    Colour = C.
row_colour([_, (X1, _, C1)], X2, Step, Colour) :-
    0 is (X2 - X1) mod (Step * 2),
    !,
    Colour = C1.
row_colour(_, _, _, black).

unzip3([], [], [], []).
unzip3([(X, Y, Z) | Rest], [X | Xs], [Y | Ys], [Z | Zs]) :-
    unzip3(Rest, Xs, Ys, Zs).

in_square((X, Y)) :-
    which_coloured(Colours),
    unzip3(Colours, Xs, Ys, _),
    max(Xs, MaxX),
    max(Ys, MaxY),
    min(Xs, MinX),
    min(Ys, MinY),
    X < MaxX,
    Y < MaxY,
    X > MinX,
    Y > MinY.

num_grey_adjacent_tiles((X, Y), Grey):-
    findall((X1, Y1), ((X1 is X, Y1 is Y - 1, input_colour(X1, Y1, grey));
                      (X1 is X, Y1 is Y + 1, input_colour(X1, Y1, grey));
                      (X1 is X + 1, Y1 is Y, input_colour(X1, Y1, grey));
                      (X1 is X - 1, Y1 is Y, input_colour(X1, Y1, grey))), Greys
                      ),
    length(Greys, Grey).

in_line((X, Y), _, (X, Y)).

in_line((X, Y), (D, D1), Square):-
    row(X),
    col(Y),
    NewX is X + D,
    NewY is Y + D1,
    in_line((NewX, NewY), (D, D1), Square).