% Ex. 1

% (a) Instrua o interpretador de Prolog sobre esta situacao, usando para isto o predicado sobre/2.

objeto(a).
objeto(b).
objeto(mesa).
sobre(a,mesa).
sobre(b,a).


% (b) Expresse por meio de formulas logicas (e em seguida na notacao do Prolog) a seguinte regra de conhecimento.
% Se um objeto esta sobre outro, entao este objeto esta acima do outro.

% formula logica: 
% sobre(X,Z) -> acima_de(X,Z)
% sobre(X,Z) -> sobre(X,Y) ^ sobre(Y,Z)

% notacao prolog:

acima_de(X,Z) :- sobre(X,Z).
acima_de(X,Z) :- sobre(X,Y), sobre(Y,Z).


% (c) "B esta acima da mesa?”

% ?- acima_de(b,mesa).
%  true