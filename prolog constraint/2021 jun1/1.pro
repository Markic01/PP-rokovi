

resetka(Vars) :-
    Vars = [X13,X23,X33,X12,X22,X32,X11,X21,X31],
    [X23,X12,X32,X21] :: 2..2..8,
    [X13,X33,X22,X11,X31] :: 1..2..9,
    alldifferent(Vars),
    labeling(Vars),
    write(X13),write(' '),write(X23),write(' '),write(X33),nl,
    write(X12),write(' '),write(X22),write(' '),write(X32),nl,
    write(X11),write(' '),write(X21),write(' '),write(X31),nl,
    !.
