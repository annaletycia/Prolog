% Ex. 3  
%Escreva um predicado binario tipotermo(+Termo,?Tipo)que recebe um termo e devolve o(s)tipo(s) daquele termo(atomo, numero, contante, variavel, etc.).  Os tipos devem ser devolvidos em ordem de generalidade. O predicado deveria, por exemplo, comportar-se da seguinte forma.

%?- tipotermo(Vicente ,variavel ).
%true

%?- tipotermo(maria ,X).
%X = atomo ;
%X = constante ;
%X = termo_simples ;
%X = termo ;
%false

%?- tipotermo(vivo(zeca),X).
%X = termo_complexo ;
%X = termo ;
%false

termo_Complexo(X):- nonvar(X), functor(X,_,A), A > 0.
termo_Simples(C):- nonvar(C), functor(C,_,A), A=0.

tipotermo(Y, atomo) :- atom(Y).
tipotermo(N, numero):- integer(N); float(N).
tipotermo(Z, constante) :- atomic(Z).
tipotermo(X, variavel) :- var(X).
tipotermo(W, termo_complexo) :- termo_Complexo(W).
tipotermo(K, termo_simples):- termo_Simples(K).
tipotermo(V, termo) :- termo_Complexo(V); termo_Simples(V).
