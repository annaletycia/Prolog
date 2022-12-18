% Ex. 12

somaUm([],[]).
somaUm([X|L1],[Y|L2]) :- Y is X+1, somaUm(L1,L2).

% ?- somaUm([1,2,7,2],X).
% X = [2,3,8,3].