% Ex. 16 

remove(X,[X|L1],L1).
remove(X,[Y|L1],[Y|L2]) :- remove(X,L1,L2). 

% ?- remove(a,[a,b,a,c,a],L).
% L = [b, a, c, a];
% L = [a, b, c, a];
% L = [a, b, a, c];
% false