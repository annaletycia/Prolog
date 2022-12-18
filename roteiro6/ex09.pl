% Ex. 9

:- op(300,xfx,++).
:- op(200, xfx, h).

X h Y :- integer(X), integer(Y).

X h Y ++ Z h W :- integer(X), integer(Y), integer(Z), integer(W).

% ?- 3 h 20 ++ 4 h 10.
% true