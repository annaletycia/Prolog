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

% Ex. 5 Escreva um predicado viagem/3 que diga a voce como viajar de um lugar para o outro 

viagem(A,B,vai(A,B)):-  deCarro(A,B);
      			deTrem(A,B);
       			deAviao(A,B).

viagem(A,B, vai(A,C,D)):- deCarro(A,C);
    			  deTrem(A,C);
    			  deAviao(A,C),
   			  viagem(C,B,D).