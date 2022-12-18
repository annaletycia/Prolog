% Ex. 4  

% Escreva um programa que define o predicado termoaterrado(+Termo)que testa se Termo ́e um termo aterrado. Termos aterrados sao termos que nao contem variaveis. Aqui estao exemplos de como o predicado deveria comportar-se:

% ?- termoaterrado(X).
% false

% ?- termoaterrado(frances(bic_mac ,le_bic_mac )).
% true

termoComplexo(X):- nonvar(X), functor(X,_,A), A > 0.

termoaterrado(X) :- nonvar(X).
termoaterrado(X) :- termoComplexo(X), termoaterrado(X).