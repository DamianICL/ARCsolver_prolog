% Solution script for part a) of the coursework.
                     
all_rows(Rs):-          
    setof(R, X^Y^input_colour(R, X, Y), Rs).

all_cols(Cs):-
    setof(C, X^Y^input_colour(X, C, Y), Cs).

row(R):-
    input_colour(R, 0, _).

col(C):-
    input_colour(0, C, _).

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

% Returns a list of squares which are not coloured black
which_coloured(Coloured) :-
    setof((X, Y, Colour), (input_colour(X, Y, Colour), Colour \= black), Coloured).