<<AULA 6B>>

nesimo(0, [H|_], H).
nesimo(N, [_|T], Elem):-   N1 is N -1,
			   nesimo(N1, T, Elem)

ultimo(X,L)
ultimo(X,[X]).
ultimo(X,[_|L):- ultimo(X,L).

ultimo(X, L) :- append(_,[X],L).

somaAcum(


ocorrencias(_,[],0).
ocorrencias(X,[X|L),N):- 
	 ocorrencias(X,L,N1),
	 N is 1 + N1.
ocorrencias(X,[_,L],Y):-
	 ocorrencias(X,L,Y).

removeTodos([], _, []).
removeTodos([X|T], X, L1):- removeTodos(T,X,L1).
removeTodos([Y|T],X,[Y|L1]):- removeTodos(T,X,L1).

produto(A,B,P)
produto(0, _, 0).
produto(_, 0, 0).
produto(A,B,P):- 
	A1 is A-1,
	produto(A1,B,P1),
	P is P1 + B. 

pot(_,0,1).
pot(B,N,P):- 
	B1 is B-1,
	pot(B1,N,P1),
	P is P1 * B.

***
seleciona(L, P, Res)
seleciona([], _, _, []).
seleciona(_, [], _, []).
seleciona([X|Xs], [P|Ps], P, [X|Res]):- 
	P1 is P + 1,
	seleciona(Xs,Ps,P1,Res).
seleciona([_|Xs], Ps, P, Res):-
	P1 is P+1,
	seleciona(Xs,Ps,P1,Res). 

seleciona(L, P, Res):-
	seleciona(L, P, 1, Res).