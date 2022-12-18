% Ex. 5

subconjunto([],_).
subconjunto([X|L1], L2) :- member(X,L2), subconjunto(L1, L2).
subconjunto([X|L1], [_|L2]) :- member(X,L2), subconjunto([X|L1], L2).

% ?- subconjunto([3,1], [4,1,9,8,3]).
% true

% ?- subconjunto([a,b], [b, d, e, f]).
% false