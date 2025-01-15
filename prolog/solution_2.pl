% Solution script for the task 'pour' (data/training/d4f3cd78.json)

:- dynamic stored_bounds/4.

output_colour(Row,Column,Colour):-
    input_colour(Row, Column, grey),
    !,
    Colour = grey.
output_colour(Row,Column,Colour):-
    in_square((Row, Column)),
    !,
    Colour = teal.
output_colour(Row,Column,Colour):-
    input_colour(R, C, black),
    num_grey_adjacent_tiles((R, C), 2),
    findall((X1, Y1), ((X1 is R, Y1 is C - 1, in_square((X1, Y1)));
                      (X1 is R, Y1 is C + 1, in_square((X1, Y1)));
                      (X1 is R + 1, Y1 is C, in_square((X1, Y1)));
                      (X1 is R - 1, Y1 is C, in_square((X1, Y1)))), Blues
                      ),
    Blues = [(BX, BY)],
    DX is R - BX, DY is C - BY,
    Direction = (DX, DY),
    draw_line((R, C), Direction, (Row, Column)),
    Colour = teal.

unzip3([], [], [], []).
unzip3([(X, Y, Z) | Rest], [X | Xs], [Y | Ys], [Z | Zs]):-
    unzip3(Rest, Xs, Ys, Zs).

bounds(MinX, MaxX, MinY, MaxY) :-
    stored_bounds(MinX, MaxX, MinY, MaxY), 
    !.
bounds(MinX, MaxX, MinY, MaxY) :-
    which_coloured(Colours),
    unzip3(Colours, Xs, Ys, _),
    min(Xs, MinX),
    max(Xs, MaxX),
    min(Ys, MinY),
    max(Ys, MaxY),
    asserta(stored_bounds(MinX, MaxX, MinY, MaxY)).

in_square((X, Y)) :-
    bounds(MinX, MaxX, MinY, MaxY),
    X < MaxX, X > MinX,
    Y < MaxY, Y > MinY.

num_grey_adjacent_tiles((X, Y), Grey):-
    X1 is X + 1, X2 is X - 1, Y1 is Y + 1, Y2 is Y - 1,
    is_grey(X, Y2, G1),
    is_grey(X, Y1, G2),
    is_grey(X1, Y, G3),
    is_grey(X2, Y, G4),
    Grey is G1 + G2 + G3 + G4.

is_grey(X, Y, 1) :-
    input_colour(X, Y, grey),
    !.
is_grey(_, _, 0).

draw_line((X, Y), _, (X, Y)).
draw_line((X, Y), (D, D1), Square):-
    row(X),
    col(Y),
    NewX is X + D,
    NewY is Y + D1,
    draw_line((NewX, NewY), (D, D1), Square).