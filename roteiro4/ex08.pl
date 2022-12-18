% Ex. 8

% (a)

disjunto([],_).
disjunto([X|L],L1):-
	\+ member(X,L1),
	disjunto(L,L1).

% (b) 

uniao([],[],_).
uniao([],X,X).
uniao(X,[],X).
uniao([L|L1],[K|K1],M):-
	member(L,M),
	member(K,M),
    uniao(L1,K1,M).

% (c)

intersecao([],_,[]).

intersecao([X|L1],L2,[X|L3]):- 
    member(X, L2), 
    intersecao(L1, L2, L3).

intersecao([_|L1],L2,L3):- 
    intersecao(L1, L2, L3).

% (d)

diferenca([], _, []).
diferenca([L|L1], K, M):-
        member(L, K),
        diferenca(L1, K, M).
diferenca([L|L2], K, [L|L3]):-
        diferenca(L2, K, L3).

