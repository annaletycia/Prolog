% Ex. 18

remove1(X,[X|L1],L1).
remove1(X,[Y|L1],[Y|L2]) :- remove1(X,L1,L2). 
insere1(X,L1,L) :- remove1(X,L,L1).

permutacao([],[]).
permutacao(P,[X|L]) :- permutacao(L1,L),
    			insere1(X,L1,P).

% (a) Quais os anagramas da palavra amor?

% ?- permutacao(P,[a,m,o,r]).
% P = [a, m, o, r];
% P = [m, a, o, r];
% P = [m, o, a, r];
% P = [m, o, r, a];
% P = [a, o, m, r];
% P = [o, a, m, r];
% P = [o, m, a, r];
% P = [o, m, r, a];
% P = [a, o, r, m];
% P = [o, a, r, m];
% P = [o, r, a, m];
% P = [o, r, m, a];
% P = [a, m, r, o];
% P = [m, a, r, o];
% P = [m, r, a, o];
% P = [m, r, o, a];
% P = [a, r, m, o];
% P = [r, a, m, o];
% P = [r, m, a, o];
% P = [r, m, o, a];
% P = [a, r, o, m];
% P = [r, a, o, m];
% P = [r, o, a, m];
% P = [r, o, m, a]

% (b) Carlos e Rose tem tres filhos: Sergio, Adriano e Fabiola. Eles querem tirar uma foto de recordacao na qual todos aparecam lado a lado. Quais sao as diferentes fotos que poderao ser registradas?

% ?- ?- permutacao(P,[carlos,rose,sergio,adriano,fabiola]).
% P = X = [carlos, rose, sergio, adriano, fabiola] ;
% P = [carlos, rose, sergio, fabiola, adriano] ;
% P = [carlos, rose, adriano, sergio, fabiola] ;
% P = [carlos, rose, adriano, fabiola, sergio] ;
% P = [carlos, rose, fabiola, sergio, adriano] ;
% P = [carlos, rose, fabiola, adriano, sergio] ;
% P = [carlos, sergio, rose, adriano, fabiola] ;
% P = [carlos, sergio, rose, fabiola, adriano] ;
% P = [carlos, sergio, adriano, rose, fabiola] ;
% P = [carlos, sergio, adriano, fabiola, rose] ;
% P = [carlos, sergio, fabiola, rose, adriano] ;
% P = [carlos, sergio, fabiola, adriano, rose] ;
% P = [carlos, adriano, rose, sergio, fabiola] ;
% P = [carlos, adriano, rose, fabiola, sergio] ;
% P = [carlos, adriano, sergio, rose, fabiola] ;
% P = [carlos, adriano, sergio, fabiola, rose] ;
% P = [carlos, adriano, fabiola, rose, sergio] ;
% P = [carlos, adriano, fabiola, sergio, rose] ;
% P = [carlos, fabiola, rose, sergio, adriano] ;
% P = [carlos, fabiola, rose, adriano, sergio] ;
% P = [carlos, fabiola, sergio, rose, adriano] ;
% P = [carlos, fabiola, sergio, adriano, rose] ;
% P = [carlos, fabiola, adriano, rose, sergio] ;
% P = [carlos, fabiola, adriano, sergio, rose] ;
% P = [rose, carlos, sergio, adriano, fabiola] ;
% P = [rose, carlos, sergio, fabiola, adriano] ;
% P = [rose, carlos, adriano, sergio, fabiola] ;
% P = [rose, carlos, adriano, fabiola, sergio] ;
% P = [rose, carlos, fabiola, sergio, adriano] ;
% P = [rose, carlos, fabiola, adriano, sergio] ;
% P = [rose, sergio, carlos, adriano, fabiola] ;
% P = [rose, sergio, carlos, fabiola, adriano] ;
% P = [rose, sergio, adriano, carlos, fabiola] ;
% P = [rose, sergio, adriano, fabiola, carlos] ;
% P = [rose, sergio, fabiola, carlos, adriano] ;
% P = [rose, sergio, fabiola, adriano, carlos] ;
% P = [rose, adriano, carlos, sergio, fabiola] ;
% P = [rose, adriano, carlos, fabiola, sergio] ;
% P = [rose, adriano, sergio, carlos, fabiola] ;
% P = [rose, adriano, sergio, fabiola, carlos] ;
% P = [rose, adriano, fabiola, carlos, sergio] ;
% P = [rose, adriano, fabiola, sergio, carlos] ;
% P = [rose, fabiola, carlos, sergio, adriano] ;
% P = [rose, fabiola, carlos, adriano, sergio] ;
% P = [rose, fabiola, sergio, carlos, adriano] ;
% P = [rose, fabiola, sergio, adriano, carlos] ;
% P = [rose, fabiola, adriano, carlos, sergio] ;
% P = [rose, fabiola, adriano, sergio, carlos] ;
% P = [sergio, carlos, rose, adriano, fabiola] ;
% P = [sergio, carlos, rose, fabiola, adriano] ;
% P = [sergio, carlos, adriano, rose, fabiola] ;
% P = [sergio, carlos, adriano, fabiola, rose] ;
% P = [sergio, carlos, fabiola, rose, adriano] ;
% P = [sergio, carlos, fabiola, adriano, rose] ;
% P = [sergio, rose, carlos, adriano, fabiola] ;
% P = [sergio, rose, carlos, fabiola, adriano] ;
% P = [sergio, rose, adriano, carlos, fabiola] ;
% P = [sergio, rose, adriano, fabiola, carlos] ;
% P = [sergio, rose, fabiola, carlos, adriano] ;
% P = [sergio, rose, fabiola, adriano, carlos] ;
% P = [sergio, adriano, carlos, rose, fabiola] ;
% P = [sergio, adriano, carlos, fabiola, rose] ;
% P = [sergio, adriano, rose, carlos, fabiola] ;
% P = [sergio, adriano, rose, fabiola, carlos] ;
% P = [sergio, adriano, fabiola, carlos, rose] ;
% P = [sergio, adriano, fabiola, rose, carlos] ;
% P = [sergio, fabiola, carlos, rose, adriano] ;
% P = [sergio, fabiola, carlos, adriano, rose] ;
% P = [sergio, fabiola, rose, carlos, adriano] ;
% P = [sergio, fabiola, rose, adriano, carlos] ;
% P = [sergio, fabiola, adriano, carlos, rose] ;
% P = [sergio, fabiola, adriano, rose, carlos] ;
% P = [adriano, carlos, rose, sergio, fabiola] ;
% P = [adriano, carlos, rose, fabiola, sergio] ;
% P = [adriano, carlos, sergio, rose, fabiola] ;
% P = [adriano, carlos, sergio, fabiola, rose] ;
% P = [adriano, carlos, fabiola, rose, sergio] ;
% P = [adriano, carlos, fabiola, sergio, rose] ;
% P = [adriano, rose, carlos, sergio, fabiola] ;
% P = [adriano, rose, carlos, fabiola, sergio] ;
% P = [adriano, rose, sergio, carlos, fabiola] ;
% P = [adriano, rose, sergio, fabiola, carlos] ;
% P = [adriano, rose, fabiola, carlos, sergio] ;
% P = [adriano, rose, fabiola, sergio, carlos] ;
% P = [adriano, sergio, carlos, rose, fabiola] ;
% P = [adriano, sergio, carlos, fabiola, rose] ;
% P = [adriano, sergio, rose, carlos, fabiola] ;
% P = [adriano, sergio, rose, fabiola, carlos] ;
% P = [adriano, sergio, fabiola, carlos, rose] ;
% P = [adriano, sergio, fabiola, rose, carlos] ;
% P = [adriano, fabiola, carlos, rose, sergio] ;
% P = [adriano, fabiola, carlos, sergio, rose] ;
% P = [adriano, fabiola, rose, carlos, sergio] ;
% P = [adriano, fabiola, rose, sergio, carlos] ;
% P = [adriano, fabiola, sergio, carlos, rose] ;
% P = [adriano, fabiola, sergio, rose, carlos] ;
% P = [fabiola, carlos, rose, sergio, adriano] ;
% P = [fabiola, carlos, rose, adriano, sergio] ;
% P = [fabiola, carlos, sergio, rose, adriano] ;
% P = [fabiola, carlos, sergio, adriano, rose] ;
% P = [fabiola, carlos, adriano, rose, sergio] ;
% P = [fabiola, carlos, adriano, sergio, rose] ;
% P = [fabiola, rose, carlos, sergio, adriano] ;
% P = [fabiola, rose, carlos, adriano, sergio] ;
% P = [fabiola, rose, sergio, carlos, adriano] ;
% P = [fabiola, rose, sergio, adriano, carlos] ;
% P = [fabiola, rose, adriano, carlos, sergio] ;
% P = [fabiola, rose, adriano, sergio, carlos] ;
% P = [fabiola, sergio, carlos, rose, adriano] ;
% P = [fabiola, sergio, carlos, adriano, rose] ;
% P = [fabiola, sergio, rose, carlos, adriano] ;
% P = [fabiola, sergio, rose, adriano, carlos] ;
% P = [fabiola, sergio, adriano, carlos, rose] ;
% P = [fabiola, sergio, adriano, rose, carlos] ;
% P = [fabiola, adriano, carlos, rose, sergio] ;
% P = [fabiola, adriano, carlos, sergio, rose] ;
% P = [fabiola, adriano, rose, carlos, sergio] ;
% P = [fabiola, adriano, rose, sergio, carlos] ;
% P = [fabiola, adriano, sergio, carlos, rose] ;
% P = [fabiola, adriano, sergio, rose, carlos] ;
% false.