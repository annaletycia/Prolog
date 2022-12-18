% Ex. 6

% Defina um operador para indicar horarios. Por exemplo, para indicar

% (a) duas horas e quinze minutos, o Prolog deveria aceitar o termo 2 h 15.
% (b)  1 hora e cinquenta minutos, o Prolog deveria aceitar o termo 1 h 50.

:- op(300, xfx, h).

X h Y :- integer(X), integer(Y).

% ?- 1 h 50.
% true

% ?- 2 h 15.
% true
