% Ex. 17

remove1(X,[X|L1],L1).
remove1(X,[Y|L1],[Y|L2]) :- remove1(X,L1,L2).

insere(X,L1,L) :- remove1(X,L,L1).

% ?- insere(a,[b,c,d],L).
% L = [a, b, c, d];
% L = [b, a, c, d];
% L = [b, c, a, d];
% L = [b, c, d, a];
% false