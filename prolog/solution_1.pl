% Solution script for the task 'lines' (data/training/0a938d79.json)

output_colour(Row,Column,Colour):-
     row(Row),
     col(Column),
     which_coloured(Starts),
     is_col(Starts),
     !,
     distance_apart(Starts, Step),
     Starts = [(X, Y, C), (X1, Y1, C1)],
     line_colour([(Y, C), (Y1, C1)], Column, Step, Colour).

output_colour(Row,Column,Colour):-
     row(Row),
     col(Column),
     which_coloured(Starts),
     distance_apart(Starts, Step),
     row_colour(Starts, Row, Step, Colour).

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

line_colour([(X, _), (X1, _)], X2, _, Colour) :-
    X2 < min(X, X1),
    !,
    Colour = black.
line_colour([(X, C), _], X2, Step, Colour) :-
    0 is (X2 - X) mod (Step * 2),
    !,
    Colour = C.
line_colour([_, (X1, C1)], X2, Step, Colour) :-
    0 is (X2 - X1) mod (Step * 2),
    !,
    Colour = C1.
line_colour(_, _, _, black).