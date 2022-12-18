% Uso de regras

% Ex. 1

% (a) Instrua o interpretador de Prolog sobre esta situacao, usando para isto o predicado sobre/2.
objeto(a).
objeto(b).
objeto(mesa).
sobre(a,mesa).
sobre(b,a).

% (b) Expresse por meio de formulas logicas (e em seguida na notacao do Prolog) a seguinte regra de conhecimento.
% Se um objeto esta sobre outro, entao este objeto esta acima do outro.

% formula logica: 
% sobre(X,Z) -> acima_de(X,Z)
% sobre(X,Z) -> sobre(X,Y) ^ sobre(Y,Z)

% notacao prolog:
acima_de(X,Z) :- sobre(X,Z).
acima_de(X,Z) :- sobre(X,Y), sobre(Y,Z).

% (c) "B esta acima da mesa?”
% ?- acima_de(b,mesa).
%  true

% Ex. 2  Escreva  um  provador  de  teoremas  para  o  calculo  proposicional. O provador devera ser capaz de lidar com equivalencias, implicacoes, disjuncoes, conjuncoes e negacao.

equiv(verdade,verdade).
equiv(falso,falso).

impl(falso,falso).
impl(falso,verdade).
impl(verdade,verdade).

ou(verdade,verdade).
ou(verdade,falso).
ou(falso,verdade).

e(verdade,verdade).

nao(falso).

prova(equiv(X,Y)):- equiv(X,Y).
prova(impl(X,Y)):- impl(X,Y).
prova(ou(X,Y)):- ou(X,Y).
prova(e(X,Y)):- e(X,Y).
prova(nao(X)):- nao(X).


% Ex. 3

conectado(1,2).
conectado(3,4).
conectado(5,6).
conectado(7,8).
conectado(9,10).
conectado(12,13).
conectado(13,14).
conectado(15,16).
conectado(17,18).
conectado(19,20).
conectado(4,1).
conectado(6,3).
conectado(4,7).
conectado(6,11).
conectado(14,9).
conectado(11,15).
conectado(16,12).
conectado(14,17).
conectado(16,19).

caminho(A,B) :- conectado(A,B).
caminho(A,B) :- conectado(A,C), caminho(C,B).

% Pode-se  ir  do  ponto  5  para  o  ponto  10?
% ?- caminho(5,10).
% true

% Em  quais outros  pontos  se  pode  chegar  partindo  do  ponto  1?
% ?- caminho(1,X).
%  X = 2;
%  false

% E  quais  pontos podem ser alcancados saindo do ponto 13?
% ?- caminho(13,Y).
% Y = 14 ;
% Y = 9 ;
% Y = 17 ;
% Y = 10 ;
% Y = 18 ;
% false.

% Ex. 4

deCarro(auckland,hamilton).
deCarro(hamilton,raglan).
deCarro(valmont,saarbruecken).
deCarro(valmont,metz).
deTrem(metz,frankfurt).
deTrem(saarbruecken,frankfurt).
deTrem(metz,paris).
deTrem(saarbruecken,paris).
deAviao(frankfurt,bangkok).
deAviao(frankfurt,singapore).
deAviao(paris,losAngeles).
deAviao(bangkok,auckland).
deAviao(losAngeles,auckland).

viagem(A,B) :- deCarro(A,B); deTrem(A,B); deAviao(A,B).
viagem(A,B) :- (deCarro(A,C); deTrem(A,C); deAviao(A,C)), viagem(C,B).

% Ex. 5

viagem(A,B,vai(A,B)):-  deCarro(A,B);
      			deTrem(A,B);
       			deAviao(A,B).

viagem(A,B, vai(A,C,D)):- deCarro(A,C);
    			  deTrem(A,C);
    			  deAviao(A,C),
   			  viagem(C,B,D).

% Ex. 6 

viagem(A,B,vai(A,decarro,B)) :- deCarro(A,B).
viagem(A,B,vai(A,detrem,B)) :- deTrem(A,B).
viagem(A,B,vai(A,deaviao,B)) :- deAviao(A,B).

viagem(A,B,vai(A,decarro,C,D)) :- deCarro(A,C),
    				 viagem(C,B,D).
viagem(A,B,vai(A,detrem,C,D)):- deCarro(A,C),
    				viagem(C,B,D).
viagem(A,B,vai(A,deaviao,C,D)):- deAviao(A,C),
    				 viagem(C,B,D).