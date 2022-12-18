% Ex. 07

:- op(790, xfx, h).
X h Y :- integer(X), integer(Y).

soma_hora(X h Y, Z h W, Resultado):- 
	ResY is Y + W,
    ResY < 60,
    ResX is X + Z,
    Resultado = ResX h ResY, !.
soma_hora(X h Y, Z h W, Resultado):-
    ResY is Y + W,
    ResY > 60,
    ResY is ResY - 60,
    ResX is X+Z+1,
    Resultado = ResX h ResY.