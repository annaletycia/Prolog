% Ex. 1

membro(X,[X|_]).
membro(X,[_|T]):-
		membro(X,T).

% [trace] ?- membro(a,[1,2,a,b]).
%   Call: (10) membro(a, [1, 2, a, b]) ? creep
%   Call: (11) membro(a, [2, a, b]) ? creep
%   Call: (12) membro(a, [a, b]) ? creep
%   Exit: (12) membro(a, [a, b]) ? creep
%   Exit: (11) membro(a, [2, a, b]) ? creep
%   Exit: (10) membro(a, [1, 2, a, b]) ? creep
% true 

% [trace]  ?- membro(z,[1,2,a,b]).
%   Call: (10) membro(z, [1, 2, a, b]) ? creep
%   Call: (11) membro(z, [2, a, b]) ? creep
%   Call: (12) membro(z, [a, b]) ? creep
%   Call: (13) membro(z, [b]) ? creep
%   Call: (14) membro(z, []) ? creep
%   Fail: (14) membro(z, []) ? creep
%   Fail: (13) membro(z, [b]) ? creep
%   Fail: (12) membro(z, [a, b]) ? creep
%   Fail: (11) membro(z, [2, a, b]) ? creep
%   Fail: (10) membro(z, [1, 2, a, b]) ? creep
% false

% Em todos os casos, a recursao termina por uma porta de saida com sucesso(exit), quando eh possivel emparelhar as clausulas desejadas, ou por uma porta por falha (fail), quando o predicado nao eh satisfeito e nao ha outra opcao de emparelhamento.

% Ex. 2

intercala1([],[],[]).
intercala1([X],[],[X]).
intercala1([],[Y],[Y]).
intercala1([X|L1], [Y|L2], [X,Y|L3]) :- intercala1(L1,L2,L3). 

% ?- intercala1([a,b,c],[1,2,3],X).
% X = [a, 1, b, 2, c, 3] .

% ?- intercala1([fu,ba,yip,yup],[glub,glab,glib,glob],Res).
% Res = [fu, glub, ba, glab, yip, glib, yup, glob] ;

% Ex. 3

intercala2([],[],[]).
intercala2([X],[],[X]).
intercala2([],[Y],[Y]).
intercala2([X|L1],[Y|L2],[[X,Y]|L3]) :- intercala2(L1,L2,L3).

% ?- intercala2([a,b,c],[1,2,3],X).
% X = [[a,1], [b,2], [c,3]]

% ?- intercala2([fu,ba,yip,yup],[glub,glab,glib,glob],Res).
% Res = [[fu,glub], [ba,glab], [yip,glib], [yup,glob]]

% Ex. 4 

intercala3([],[],[]).
intercala3([X],[],[junta(X)]).
intercala3([],[Y],[junta(Y)]).
intercala3([X|L1],[Y|L2],[junta(X,Y)|L3]) :- intercala3(L1,L2,L3).

% ?- intercala3([a,b,c],[1,2,3],X).
% X = [junta(a, 1), junta(b, 2), junta(c, 3)]

% ?- intercala3([fu,ba,yip,yup],[glub,glab,glib,glob],Res).
% Res = [junta(fu, glub), junta(ba, glab), junta(yip, glib), junta(yup, glob)]

% Ex. 5

subconjunto(_,[]).
subconjunto([X|L1], L2) :- member(X,L2), subconjunto(L1, L2).
subconjunto([X|L1], [_|L2]) :- member(X,L2), subconjunto([X|L1], L2).

% Ex. 6

superconjunto(_,[]).
superconjunto(L2,[X|L1]) :- member(X,L2), superconjunto(L2,L1).
superconjunto([_|L2],[X|L1]) :- member(X,L2), superconjunto(L2,[X|L1]).

% Ex. 7

concatena([], L, L).
concatena([H|L1], L2, [H|L3]):- concatena(L1, L2, L3).

duplicada(Lista) :- concatena(X,X,Lista).

% Ex. 8

concatena1([], L, L).
concatena1([H|L1], L2, [H|L3]):- concatena1(L1, L2, L3).

palindromo([_]).
palindromo([H|L]) :- concatena1(Pre,[H],L),
		   palindromo(Pre).

% Ex. 9 Como o Prolog responde as seguintes consultas?

% 1)
% ?- X = 3*4.
% X = 3*4.
% Nesse caso, a "3*4" eh apenas um termo Prolog, tal que * eh o funtor e 3 e 4 os argumentos, por isso nenhuma conta eh realizada.

% 2)
% ?- X is 3*4.
% X = 12.
% Nesse caso a variavel X recebe o resultado de 3 multiplicado por 4, que eh 12.

% 3)
% ?- 4 is X.
% ERROR: Arguments are not sufficiently instantiated
% Um erro eh apresentado pois a maneira correta eh a variavel vir antes do "is".

% 4) 
% ?- X = Y.
% X = Y.
% Prolog unifica X e Y, instanciando se for o caso alguma variavel em X e Y.

% 5)
% ?- 3 is 1+2.
% true.
% Prolog realiza a soma 1+2 e compara o resultado dela com 3, constatando a igualdade.

% 6)
% ?- 3 is +(1,2).
% true.
% A conta +(1,2) eh equivalente a 1+2, que resulta 3 e portanto a igualdade eh verdadeira.

% 7)
% ?- 3 is X+2.
% ERROR: Arguments are not sufficiently instantiated
% As variaveis contidas na expressao devem estar instanciadas com numeros, o que nao eh o caso, por isso a mensagem de erro. 

% 8)
% ?- X is 1+2.
% X = 3.
% Prolog realiza primeiro a soma e depois instancia o resultado em X, tal que X resulta 3. 

% 9)
% ?- 1+2 is 1+2.
% false.
% Nao eh possivel utilizar o operador "is" nesse caso, se o objetivo era realizar uma valiacao aritmetica, o correto seria "1+2 =:= 1+2". 
 

% 10)
% ?- is(X,+(1,2)).
% X = 3.
% Primeiro eh realizada a soma entre 1 e 2 e depois X recebe o resultado da operacao.

% 11)
% ?- 3+2 = +(3,2).
% true.
% A unificacao eh possivel, visto que nao ha variaveis a serem instanciadas e o resultado de ambas as operacoes sejam iguais, 3+2 e +(3,2) resultam em 5.

% 12)
% ?- *(7,5)  = 7*5.
% true.
% A unificacao eh possivel, visto que nao ha variaveis a serem instanciadas e o resultado de ambas as operacoes sejam iguais, *(7,5) e 7*5 resultam em 35.

% 13)
% ?- *(7,+(3,2))  = 7*(3+2).
% true.
% A unificacao eh possivel, visto que nao ha variaveis a serem instanciadas e o resultado de ambas as operacoes sejam iguais, *(7,+(3,2)) e 7*(3+2) em 35.

% 14)
% ?- *(7,(3+2)) = 7*(3+2).
% true.
% A unificacao eh possivel, visto que nao ha variaveis a serem instanciadas e o resultado de ambas as operacoes sejam iguais, *(7,(3+2)) e 7*(3+2) em 35.

% 15)
% ?- *(7,(3+2)) = 7*(+(3,2)).
% true.
% A unificacao eh possivel, visto que nao ha variaveis a serem instanciadas e o resultado de ambas as operacoes sejam iguais, *(7,(3+2)) e 7*(+(3,2)) em 35.

% Ex. 10

incrementa(X,Y) :- Y is X+1.

% ?- incrementa(4,5).
% true

% ?- incrementa(4,6).
% false

% Ex. 11

soma(X,Y,Z) :- Z is X+Y.

% ?- soma(4,5,9).
% true

% ?- soma(4,6,12).
% false

% Ex. 12

somaUm([],[]).
somaUm([X|L1],[Y|L2]) :- Y is X+1, somaUm(L1,L2).

% ?- somaUm([1,2,7,2],X).
% X = [2,3,8,3].

% Ex. 13

min(X,Y,X) :- X < Y.
min(X,Y,Y) :- X >= Y.

minAcum(X,[X],X).
minAcum(_,[X,Y|L1],Menor) :- minAcum(_, [Y|L1], MenorL1),
    			     min(X, MenorL1, Menor).

% Ex. 14

multiEsc(_,[],[]).
multiEsc(Y,[X|L1],[Z|L2]) :- Z is Y*X, 
			    multiEsc(Y,L1,L2).

% ?- multiEsc(3,[2,7,4],Resultado).
% Resultado = [6,21,12]

% Ex. 15

prodEsc([X],[Y],W) :- W is X*Y.
prodEsc([X|L1],[Y|L2],Z) :- prodEsc([X],[Y],W),
    			    prodEsc(L1,L2,V),
    			    Z is W+V.

% Ex. 16 

remove(X,[X|L1],L1).
remove(X,[Y|L1],[Y|L2]) :- remove(X,L1,L2). 

% ?- remove(a,[a,b,a,c,a],L).
% L = [b, a, c, a];
% L = [a, b, c, a];
% L = [a, b, a, c];
% false

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

% Ex. 18

remove(X,[X|L1],L1).
remove(X,[Y|L1],[Y|L2]) :- remove(X,L1,L2). 
insere1(X,L1,L) :- remove(X,L,L1).

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

% ?- permutacao(P,[sergio,adriano,fabiola]).


% Ex. 19

fat(0,1).
fat(N,Fat) :- N>0,
    		N1 is N-1,
    		fat(N1,Fat1),
    		Fat is N * Fat1. 

npermutacoes([],0).
npermutacoes([_|L1],P) :- npermutacoes(L1,Y1),
    						 W is Y1 + 1,
    						fat(W,Fat),
    						 P is Fat+0.

% Ex. 20

combinacao(0,_,[]).
combinacao(N,[X|Xs],[X|Ys]):- N>0,
			      N1 is N - 1,
			      combinacao(N1,Xs,Ys).
combinacao(N,[_|Xs], Ys):- N>0,
			   combinacao(N,Xs,Ys).

% (a) Uma escola possui 10 alunos atletas a1, a2,..., a10. Quais as diferentes equipes que podem ser formadas com 5 alunos?

% ?- combinacao(5,[a1,a2,a3,a4,a5,a6,a7,a8,a9,a10],C).

% (b)

%

% Ex. 23

remove(X,[X|L1],L1).
remove(X,[Y|L1],[Y|L2]) :- remove(X,L1,L2). 
insere(X,L1,L) :- remove(X,L,L1).

permutacao([],[]).
permutacao(P,[X|L]) :- permutacao(L1,L),
    			insere(X,L1,P).
