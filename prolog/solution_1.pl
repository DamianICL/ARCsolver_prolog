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