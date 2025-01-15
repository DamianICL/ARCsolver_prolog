% Solution script for the task 'lines' (data/training/0a938d79.json)

output_colour(Row,Column,Colour):-
     row(Row),
     col(Column),
     which_coloured(Starts),
     distance_apart(Starts, Step),
     line_colour(Starts, Row, Column, Step, Colour).

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

line_colour([(X, Y, C), (X1, Y1, C1)], _, Column, _, black) :-
    is_col([(X, Y, C), (X1, Y1, C1)]),
    Column < min(Y, Y1),
    !.
line_colour([(X, Y, C), (X1, Y1, C1)], _, Column, Step, C) :-
    is_col([(X, Y, C), (X1, Y1, C1)]),
    0 is (Column - Y) mod (Step * 2),
    !.
line_colour([(X, Y, C), (X1, Y1, C1)], _, Column, Step, C1) :-
    is_col([(X, Y, C), (X1, Y1, C1)]),
    0 is (Column - Y1) mod (Step * 2),
    !.
line_colour([(X, Y, C), (X1, Y1, C1)], _, _, _, black) :-
    is_col([(X, Y, C), (X1, Y1, C1)]),
    !.
line_colour([(X, Y, C), (X1, Y1, C1)], Row, _, _, black) :-
    \+ is_col([(X, Y, C), (X1, Y1, C1)]),
    Row < min(X, X1),
    !.
line_colour([(X, Y, C), (X1, Y1, C1)], Row, _, Step, C) :-
    \+ is_col([(X, Y, C), (X1, Y1, C1)]),
    0 is (Row - X) mod (Step * 2),
    !.
line_colour([(X, Y, C), (X1, Y1, C1)], Row, _, Step, C1) :-
    \+ is_col([(X, Y, C), (X1, Y1, C1)]),
    0 is (Row - X1) mod (Step * 2),
    !.
line_colour(_, _, _, _, black).