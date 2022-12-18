% Ex. 6

superconjunto(_,[]).
superconjunto(L2,[X|L1]) :- member(X,L2), superconjunto(L2,L1).
superconjunto([_|L2],[X|L1]) :- member(X,L2), superconjunto(L2,[X|L1]).

% ?- superconjunto([4,1,9,8,3], [3,1]).
% true

% ?- superconjunto([b,d,e,f], [a,b]).
% false

% ?- superconjunto([a,f,b,e], [a,b,e,f]).
% true