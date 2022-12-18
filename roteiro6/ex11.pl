% Ex. 11

:- op(330,xfx,++).
:- op(300,xfx,**).
:- op(250, xfx, h).
:- op(1050,xfy, <-).

X h Y :- integer(X), integer(Y).

Horario <- X1 h Y1 ++ X2 h Y2:-
    ResY is Y1+Y2,
    ResY < 60,
    ResX is X1+X2,
    Horario = ResX h ResY, !.

Horario <- X1 h Y1 ++ X2 h Y2:-
    ResY is Y1+Y2,
    ResY > 60,
    ResY is ResY - 60,
    ResX is X1+X2+1,
    Horario = ResX h ResY.

Horario <- N  X h Y:-
    ResY is N * Y,
    ResY < 60,
    ResX is N * X,
    Horario = ResX h ResY, !.

Horario <- N  X h Y:-
    ResY is N * Y,
    ResY > 60,
    ResY is mod(ResY, 60),
    ResX is N * X + div(ResY, 60),
    Horario = ResX h ResY.