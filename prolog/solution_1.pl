% Solution script for the task 'lines' (data/training/0a938d79.json)

output_colour(Row,Column,Colour):-
     row(Row),
     col(Column),
     which_coloured(Starts),
     is_col_pattern(Starts),
     distance_apart(Starts, Step),
     Starts = [(X, Y, C), (X1, Y1, C1)],
     line_colour([(Y, C), (Y1, C1)], Column, Step, Colour).
output_colour(Row,Column,Colour):-
     row(Row),
     col(Column),
     which_coloured(Starts),
     \+ is_col_pattern(Starts), 
     distance_apart(Starts, Step),
     Starts = [(X, Y, C), (X1, Y1, C1)],
     line_colour([(X, C), (X1, C1)], Row, Step, Colour).

% Is true only if the square is either on the top or bottom row
is_row_edge((X, _, _)) :-
    all_rows(Rows),
    max(Rows, Max),
    (X = 0 ; X = Max).

is_col_pattern([(X, Y, _), (X1, Y1, _)]):-
    Y \= Y1,
    is_row_edge((X, Y, black)),
    is_row_edge((X1, Y1, black)).

distance_apart([(X, Y, _), (X1, Y1, _)], Distance):-
    (is_row_edge((X, Y, black)), is_row_edge((X1, Y1, black))),
    Distance is abs(Y - Y1).
distance_apart([(X, _, _), (X1, _, _)], Distance):-
    Distance is abs(X-X1).

% Determines which colour the vertical/horizontal line should be
line_colour([(X, _), (X1, _)], X2, Step, black) :-
    X2 < min(X, X1),
    \+ ( 0 is (X2 - X) mod (Step*2)
       ; 0 is (X2 - X1) mod (Step*2) ).
line_colour([(X, C), (X1, C1)], X2, Step, C) :-
    \+ (X2 < min(X, X1); 0 is (X2 - X1) mod (Step*2)),
    0 is (X2 - X) mod (Step*2).
line_colour([(X, C), (X1, C1)], X2, Step, C1) :-
    \+ (X2 < min(X, X1) ; 0 is (X2 - X) mod (Step*2)),
    0 is (X2 - X1) mod (Step*2).
line_colour(_, _, _, black).