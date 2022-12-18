% Ex. 11

primos(_,2,3).
primos(N,F,NF):- 
    F * F < N,
    NF is F + 2.
primos(N,_,N).

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
     