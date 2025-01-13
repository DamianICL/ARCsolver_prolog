% Solution script for the task 'pour' (data/training/d4f3cd78.json)

output_colour(Row,Column,Colour):-
    row(Row),
    col(Column),
    input_colour(Row, Column, grey),
    !,
    Colour = grey.

output_colour(Row,Column,Colour):-
    row(Row),
    col(Column),
    in_square((Row, Column)),
    !,
    Colour = teal.

output_colour(Row,Column,Colour):-
    row(Row),
    col(Column),
    input_colour(R, C, black),
    num_grey_adjacent_tiles((R, C), 2),
    findall((X1, Y1), ((X1 is R, Y1 is C - 1, in_square((X1, Y1)));
                      (X1 is R, Y1 is C + 1, in_square((X1, Y1)));
                      (X1 is R + 1, Y1 is C, in_square((X1, Y1)));
                      (X1 is R - 1, Y1 is C, in_square((X1, Y1)))), Blues
                      ),
    Blues = [(BX, BY)],
    DX is R - BX,
    DY is C - BY,
    Direction = (DX, DY),
    in_line((R, C), Direction, (Row, Column)),
    Colour = teal.
