% Ex. 10

:- op(250,xfx,**).
:- op(200, xfx, h).

X h Y :- integer(X), integer(Y).

Y ** Z h W :- integer(Y), integer(Z), integer(W).

% ?- 3 ** 4 h 10.
% true.