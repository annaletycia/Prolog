%Relacionamentos familiares

% Ex 1. Estender o programa Prolog para incluir os relacionamentos mae, homem e mulher:

homem(carlos).
mulher(ana).
mulher(juliana).
mulher(joana).
pai(carlos,ana).
pai(carlos,juliana).
mae(joana,ana).
mae(joana,juliana).


% Ex 2. Escrever em Prolog as seguintes consultas:

% Quem eh pai de Ana?
% ?- pai(Y,ana).

% Quem eh pai de quem?
% ?- pai(Y,X).

% Quem eh o avo de Ana?
% ?- pai(Y,ana),pai(X,Y).


% Ex 3. Escrever em Prolog as seguintes consultas:

% Quem sao os netos de Joao?
% ?- pai(joao,Y),pai(Y,X).

% Juliana e Ana tem o mesmo pai?
% ?- pai(Z,ana),pai(Z,juliana).
% "Z = carlos." entao elas tem o mesmo pai.


% Ex 4. Escreva  regras  para  o  relacionamentos filho, filha, irmao, irma, irmaos, tio, tia, primo, prima e avo:

filho(X,Y) :-
	homem(X),
	pai(Y,X).

filha(K,Y) :-
	mulher(K),
	pai(Y,K).

irmao(X,K) :-
	homem(X),
	pai(Y,X),
	pai(Y,K).

irma(K,X) :-
	mulher(K),
	pai(Y,K),
	pai(Y,X).

irmaos(X,K) :-
	irmao(X,K),
	irma(K,X).

tio(R,X) :-
	homem(R),
	irmaos(R,Y),
	pai(Y,X).

tio(R,K) :-
	homem(R),
	irmaos(R,Y),
	pai(Y,K).
tia(M,X) :-
	mulher(M),
	irmaos(M,Y),
	pai(Y,X).

tia(M,K) :-
	mulher(M),
	irmaos(M,Y),
	pai(Y,K).

primo(P,X) :-
	homem(P),
	pai(R,P),
	pai(Y,X),
	irmaos(Y,R).

primo(P,K) :-
	homem(P),
	pai(R,P),
	pai(Y,K),
	irmaos(Y,R).

prima(V,X) :-
	mulher(V),
	pai(R,V),
	pai(Y,X),
	irmaos(Y,R).

prima(V,K) :-
	mulher(V),
	pai(R,V),
	pai(Y,K),
	irmaos(Y,R).

avo(G,X) :-
	mulher(G),
	mae(G,Y),
	pai(Y,X).

avo(G,K) :-
	mulher(G),
	mae(G,Y),
	pai(Y,K).

% Mundo do Harry Potter
elfo_domestico(dobby).

bruxo(hermione).
bruxo('McGonagall').
bruxo(rita_skeeter).

magico(X) :- elfo_domestico(X).
magico(X) :- feiticeiro(X).
magico(X) :- bruxo(X).

% Quais das seguintes consultas sao satisfeitas?

% Ex 5. "magico(elfo_domestico)." false, nao eh satisfeita pois elfo_domestico nao eh um atomo e sim um funtor.

% Ex 6. "feiticeiro(harry)." false, nao eh satisfeita pois o predicado feiticeiro(X) nao foi declarado e harry nao eh um atomo.

% Ex 7. "magico(feiticeiro)." false, nao eh satisfeita pois feiticeiro nao eh um atomo declarado.

% Ex 8. "magico('McGonagall')." true, eh satisfeita pois 'McGonagall' eh bruxo e se eh bruxo entao eh magico conforme a condiçao.

% Ex 9. Para satisfazer esse exercicio foi necessario adicionar um funtor feiticeiro(X) ao banco de dados, caso contrario uma mensagem de erro apareceria.
feiticeiro(grump).

% "magico(Hermione)."  nesse caso o atomo "Hermione" esta como uma variavel.

% ?- magico(Hermione).
% Hermione = dobby ;
% Hermione = grump ;
% Hermione = hermione ;
% Hermione = 'McGonagall' ;
% Hermione = rita_skeeter.

% A arvore de busca desenhada foi enviada no outro arquivo junto desse roteiro no email.

% Minigramatica

palavra(artigo,um).
palavra(artigo,qualquer).
palavra(nome,criminoso).
palavra(nome,'mac lanche feliz').
palavra(verbo,come).
palavra(verbo,adora).

sentenca(Palavra1,Palavra2,Palavra3,Palavra4,Palavra5):-
	palavra(artigo,Palavra1),
	palavra(nome,Palavra2),
	palavra(verbo,Palavra3),
	palavra(artigo,Palavra4),
	palavra(nome,Palavra5).

% Ex.10  Qual  consulta  deve-se  colocar  a  fim  de  encontrar  quais  senten ̧cas  a gramatica pode gerar?

% ?- sentenca(X,Y,Z,W,K).

% Ex.11 Liste  todas  as  sentencas  que  esta  gramatica  pode  gerar  na  mesma ordem em que o Prolog as geraria.

% um criminoso come um criminoso

% um criminoso come um 'mac lanche feliz'

% um criminoso come qualquer criminoso

% um criminoso come qualquer 'mac lanche feliz'

% um criminoso adora um criminoso

% um criminoso adora um 'mac lanche feliz'

% um criminoso adora qualquer criminoso

% um criminoso adora qualquer 'mac lanche feliz'

% um 'mac lanche feliz' come um criminoso

% um 'mac lanche feliz' come um 'mac lanche feliz'

% um ' mac lanche feliz' come qualquer criminoso

% um 'mac lanche feliz' come qualquer 'mac lanche feliz'

% um 'mac lanche feliz' adora um criminoso

% um 'mac lanche feliz' adora um 'mac lanche feliz'

% um 'mac lanche feliz' adora qualquer criminoso

% um 'mac lanche feliz' adora qualquer 'mac lanche feliz'

% qualquer criminoso come um criminoso

% qualquer criminoso come um 'mac lanche feliz'

% qualquer criminoso come qualquer criminoso

% qualquer criminoso come qualquer 'mac lanche feliz'

% qualquer criminoso adora um criminoso

% qualquer criminoso adora um 'mac lanche feliz'

% qualquer criminoso adora qualquer criminoso

% qualquer criminoso adora qualquer 'mac lanche feliz'

% qualquer 'mac lanche feliz' come um criminoso

% qualquer 'mac lanche feliz' come um 'mac lanche feliz'

% qualquer 'mac lanche feliz' come qualquer criminoso

% qualquer 'mac lanche feliz' come qualquer 'mc lanche feliz'

% qualquer 'mac lanche feliz' adora um criminoso

% qualquer 'mac lanche feliz' adora um 'mac lanche feliz'

% qualquer 'mac lanche feliz' adora qualquer criminoso

% qualquer 'mac lanche feliz' adora qualquer 'mac lanche feliz'

% o prolog le o programa de cima para baixo e da esquerda para a direita, por isso, ele primeiro ira fazer todas as possibilidades possiveis pela ordem de qual aparecer primeiro.

% Alunos 

aluno(joao,poo).
aluno(pedro,poo).
aluno(maria,pl).
aluno(rui,pl).
aluno(manuel,pl).
aluno(pedro,pl).
aluno(rui,ed1).

% Ex. 12 Verifique que os fatos estao presentes na Base de Conhecimento (utilize o predicado listing).
 % ?- listing(aluno(X,Y)).
%aluno(joao, poo).
%aluno(pedro, poo).
%aluno(maria, pl).
%aluno(rui, pl).
%aluno(manuel, pl).
%aluno(pedro, pl).
%aluno(rui, ed1).

%true.

% Ex. 13 Escreva uma consulta que verifique se joao eh aluno de pl.
 % ?- aluno(joao,pl).
   % false.

% Ex.14  Escreva uma consulta que verifique se rui eh aluno de poo.
 % ?- aluno(rui,poo).
  % false.

% Ex. 15 Escreva uma consulta que verifique se joao e maria sao ambos alunos de ed1.
 % ?- aluno(joao,ed1),aluno(maria,ed1).
  % false.

% Ex. 16 Escreva uma consulta que permita saber quem eh aluno de pl.
 % ?- aluno(X,pl).
% X = maria ;
% X = rui ; 
% X = manuel ;
% X = pedro.

% Ex. 17 Escreva uma consulta que permita saber as disciplinas em que rui eh aluno.
 % ?- aluno(rui,Y).
   % Y = pl ;
   % Y = ed1

estuda(joao).
estuda(maria).
estuda(manuel).

% Ex. 18 Sabendo que a aluno A faz a disciplina D se A eh aluno de D e A estuda, escreva uma consulta que lhe permita saber se maria faz pl.
 % ?- aluno(maria,pl),estuda(maria).

% Ex. 19 ?- aluno(X,pl),estuda(X).
 % Essa consulta me permite saber qual aluno faz pl, ou seja, eh aluno de pl e estuda, por exemplo maria e manuel.

% Ex. 20 Escreva uma consulta que lhe permita saber quem faz pl.

fazpl(X) :-
 aluno(X,pl),
 estuda(X).

% ?- fazpl(X).
 % X = maria ;
 % X = manuel.
