% Ex. 5

aPar --> [].
aPar --> e,aPar,e.

e --> [a].


% ?- aPar(X,[]).
% X = [] ;
X = [a, a] ;
% X = [a, a, a, a] ;
% X = [a, a, a, a, a, a] ;
% X = [a, a, a, a, a, a, a, a] ;
% X = [a, a, a, a, a, a, a, a, a|...] ;
% . . .
