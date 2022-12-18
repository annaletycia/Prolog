% Ex. 8

:- op(790, xfx, h).
X h Y :- integer(X), integer(Y).

mult_hora(N, Z h W, Resultado):- 
	ResW is N * W,
    ResW < 60,
    ResZ is N * Z,
    Resultado = ResZ h ResW, !.

mult_hora(N, Z h W, Resultado):- 
    ResW is N * W,,
    ResW > 60,
    ResW is mod(ResW, 60),
    ResZ is N * X + div(ResW, 60),
    Resultado = ResZ h ResW.