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

% Ex. 6 Estenda o predicado viagem/3 tal que ele nao somente diga a voce em quais cidades intermediarias voce passara, mas tambem como ir de uma cidade a outra, ou seja, de carro, trem ou aviao

viagem(A,B,vai(A,decarro,B)) :- deCarro(A,B).
viagem(A,B,vai(A,detrem,B)) :- deTrem(A,B).
viagem(A,B,vai(A,deaviao,B)) :- deAviao(A,B).

viagem(A,B,vai(A,decarro,C,D)) :- deCarro(A,C),
    				 viagem(C,B,D).
viagem(A,B,vai(A,detrem,C,D)):- deCarro(A,C),
    				viagem(C,B,D).
viagem(A,B,vai(A,deaviao,C,D)):- deAviao(A,C),
    				 viagem(C,B,D).