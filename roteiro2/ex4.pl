% Ex. 4 Escreva  um  predicado viagem/2 que  determine  se eh  possivel  viajar de um lugar a outro usando qualquer meio de transporte disponivel: carro,trem e aviao

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