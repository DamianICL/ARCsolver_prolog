% Solution script for part a) of the coursework.

:- dynamic stored_rows/1.
:- dynamic stored_cols/1.
:- dynamic stored_which_coloured/1.

all_rows(Rs) :-
    stored_rows(Rs), 
    !.                      
all_rows(Rs) :-            
    setof(R, X^Y^input_colour(R, X, Y), Rs),
    asserta(stored_rows(Rs)).

all_cols(Cs) :-
    stored_cols(Cs),
    !.
all_cols(Cs) :-
    setof(C, X^Y^input_colour(X, C, Y), Cs),
    asserta(stored_cols(Cs)).

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

which_coloured(Coloured) :-
    stored_which_coloured(Coloured),
    !.
which_coloured(Coloured) :-
    setof((X, Y, Colour), (input_colour(X, Y, Colour), Colour \= black), Coloured),
    asserta(stored_which_coloured(Coloured)).