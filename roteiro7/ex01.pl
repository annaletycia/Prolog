% Ex. 01

% versao sem corte

max(X,Y,Y):- X=<Y.
max(X,Y,X):- X>Y.

% versao com corte verde

max1(X,Y,Y):- X=<Y, !.
max1(X,Y,X):- X>Y.

% versao com corte vermelho

max2(X,Y,Z):- X=<Y, !, Y=Z.
max2(X,_,X).

% [trace]  ?-max(10,7,10).
%   Call: (11) max(10, 7, 10) ? creep
%   Call: (12) 10>7 ? creep
%   Exit: (12) 10>7 ? creep
%   Exit: (11) max(10, 7, 10) ? creep
% true.

% [trace]  ?- max(12,34,X).
%   Call: (11) max(12, 34, _8212) ? creep
%   Call: (12) 12=<34 ? creep
%   Exit: (12) 12=<34 ? creep
%   Exit: (11) max(12, 34, 34) ? creep
% X = 34 .

% [trace]  ?- max1(5,6,6).
%   Call: (10) max1(5, 6, 6) ? creep
%   Call: (11) 5=<6 ? creep
%   Exit: (11) 5=<6 ? creep
%   Exit: (10) max1(5, 6, 6) ? creep
% true.

% [trace]  ?- max1(7,9,Y).
%   Call: (10) max1(7, 9, _2150) ? creep
%   Call: (11) 7=<9 ? creep
%   Exit: (11) 7=<9 ? creep
%   Exit: (10) max1(7, 9, 9) ? creep
% Y = 9.

% [trace]  ?- max2(11,12,11).
%   Call: (11) max2(11, 12, 11) ? creep
%   Call: (12) 11=<12 ? creep
%   Exit: (12) 11=<12 ? creep
%   Call: (12) 12=11 ? creep
%   Fail: (12) 12=11 ? creep
%   Fail: (11) max2(11, 12, 11) ? creep
%false.

% [trace]  ?- max2(9,5,Z).
%   Call: (11) max2(9, 5, _11658) ? creep
%   Call: (12) 9=<5 ? creep
%   Fail: (12) 9=<5 ? creep
%   Redo: (11) max2(9, 5, _11658) ? creep
%   Exit: (11) max2(9, 5, 9) ? creep
% Z = 9.