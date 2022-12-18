% Ex. 8

% (a)


% (b) ERRADO

uniao([],X,X).
uniao(X,[],X).
uniao(L,K,M):-
	member(L,M),
	member(K,M).
----------------------------
uniao([],X,X).
uniao(X,[],X).
uniao([L|L1],[K|K1],M):-
	member(L,M),
	member(K,M),
    uniao(L1,K1,M).
uniao([],[],[]).
----------------------------
uniao([],[],_).
uniao([],X,X).
uniao(X,[],X).
uniao([L|L1],[K|K1],M):-
	member(L,M),
	member(K,M),
    uniao(L1,K1,M).

% (c)

intersecao([],_, []).
intersecao([X|L], K, M):-
	member(X, K),
	intersecao = [X|L1],
	intersecao(L, K, L1);
	(L, K, M).

% (d)

diferenca([], _, []).
diferenca([L|L1], K, M) :-
        member(L, K),
        !,
        diferenca(L1, K, M).
diferenca([L|L2], K, [L|L3]) :-
        diferenca(L2, K, L3).


% Ex. 11

fatores_primos(N,L) :- 
    N > 0,  
    fatores_primos(N,L,2).
fatores_primos(1,[],_).
fatores_primos(N,[F|L],F):-                           
   P is N div F, 
   N =:= P * F,
   fatores_primos(P,L,F).
fatores_primos(N,L,F):- 
   primos(N,F,NF), 
   fatores_primos(N,L,NF).
primos(_,2,3).
primos(N,F,NF):- 
    F * F < N,
    NF is F + 2.
primos(N,_,N).      












% Ex. 1

soma_acum(L,K):-
    somaAcc(L,0,K).

somaAcc([],_,[]).
somaAcc([X|L],Acc,[Acc1|L1]):-
	Acc1 is X+Acc,
	somaAcc(L,Acc1,L1).
	

% Ex. 2

soma_ate(0,0).
soma_ate(N,S) :- N>0,
    		N1 is N-1,
    		soma_ate(N1,S1),
    		S is N + S1. 


% Ex. 3

dec_para_bin(0,[0]).
dec_para_bin(1,[1]).
dec_para_bin(N,B):- 
    N > 1,
    X is N mod 2,
    Y is N div 2,  
    dec_para_bin(Y,B1), 
    append(B1, [X], B).

% Ex. 4

sem_repeticao([],[]).
sem_repeticao([X|L1],L):-
    member(X,L1),
    sem_repeticao(L1,L).
sem_repeticao([X|L1],[X|L]):-
    sem_repeticao(L1,L).

% Ex. 5

segmento([],_).
segmento(L, L1) :- append([_, L, _], L1).

% Ex. 6

bissexto(Ano) :-
    	Ano > 0,
        Ano mod 4 =:= 0;
        Ano mod 100 =:= 0;
        Ano mod 400 =:= 0.

% Ex. 9

ocorrencias(_,[],0).
ocorrencias(X,[X|L],N):-
    ocorrencias(X,L,N1),
    N is N1+1.
ocorrencias(X,[_|L],N1):-
    ocorrencias(X,L,N1).

% Ex. 10

ocorre([X|_],1,X).
ocorre([_|L],N,X):-
    ocorre(L,N1,X),
    N is N1+1.
