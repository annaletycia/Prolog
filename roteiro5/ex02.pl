% Ex. 2

% reconhecedor simples com diferenças de listas

s(A-C):- sn(A-B), sv(B-C).
sn(A-C):- det(A-B), n(B-C). 
sv(A-C):- v(A-B), sn(B-C). 
sv(A-C):- v(A-C).

det([o|P]-P).           
det([a|P]-P). 

n([homem|P]-P).    
n([mulher|P]-P).      
n([bola|P]-P).

v([chuta|P]-P).

% ?- s(X-[]).
% X = [o, homem, chuta, o, homem] ;
% X = [o, homem, chuta, o, mulher] ;
% X = [o, homem, chuta, o, bola] ;
% X = [o, homem, chuta, a, homem] ;
% X = [o, homem, chuta, a, mulher] ;
% X = [o, homem, chuta, a, bola] ;
% X = [o, homem, chuta] ;
% X = [o, mulher, chuta, o, homem] ;
% X = [o, mulher, chuta, o, mulher] ;
% X = [o, mulher, chuta, o, bola] ;
% X = [o, mulher, chuta, a, homem] ;
% X = [o, mulher, chuta, a, mulher] ;
% X = [o, mulher, chuta, a, bola] ;
% X = [o, mulher, chuta] ;
% X = [o, bola, chuta, o, homem] ;
% X = [o, bola, chuta, o, mulher] ;
% X = [o, bola, chuta, o, bola] ;
% X = [o, bola, chuta, a, homem] ;
% X = [o, bola, chuta, a, mulher] ;
% X = [o, bola, chuta, a, bola] ;
% X = [o, bola, chuta] ;
% X = [a, homem, chuta, o, homem] ;
% X = [a, homem, chuta, o, mulher] ;
% X = [a, homem, chuta, o, bola] ;
% X = [a, homem, chuta, a, homem] ;
% X = [a, homem, chuta, a, mulher] ;
% X = [a, homem, chuta, a, bola] ;
% X = [a, homem, chuta] ;
% X = [a, mulher, chuta, o, homem] ;
% X = [a, mulher, chuta, o, mulher] ;
% X = [a, mulher, chuta, o, bola] ;
% X = [a, mulher, chuta, a, homem] ;
% X = [a, mulher, chuta, a, mulher] ;
% X = [a, mulher, chuta, a, bola] ;
% X = [a, mulher, chuta] ;
% X = [a, bola, chuta, o, homem] ;
% X = [a, bola, chuta, o, mulher] ;
% X = [a, bola, chuta, o, bola] ;
% X = [a, bola, chuta, a, homem] ;
% X = [a, bola, chuta, a, mulher] ;
% X = [a, bola, chuta, a, bola] ;
% X = [a, bola, chuta].
