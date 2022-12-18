% Ex 3

% Usando = e \+

nu(X,Y):-
	\+ X = Y.

% b) Usando apenas =

nu(X,Y):-
	X = Y, !, fail.
nu(_, _).

% c) Usando corte e fail

nu(X,Y):-
	nonvar(X), var(Y), !, fail.
nu(X,X):- !, fail.
nu(_,_).