% Ex. 7

concatena([], L, L).
concatena([H|L1], L2, [H|L3]):- concatena(L1, L2, L3).

duplicada(Lista) :- concatena(X,X,Lista).
