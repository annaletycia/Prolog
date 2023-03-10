% Ex. 11

% DCG usando argumentos extras

s --> sn(sujeito), sv.
sn(_) --> det, n.                  
sn(X) --> pro(X).
sv --> v, sn(objeto).
sv --> v.det --> [o].              
det --> [a].
n --> [mulher].       
n --> [homem]. 
v --> [bate].
pro(sujeito) --> [ele].
pro(sujeito) --> [ela].
pro(objeto) --> [nele].
pro(objeto) --> [nela].

% DCG que constroi arvore sintatica

s --> sn(sujeito), sv.
sn(_) --> det, n.
sn(X) --> pro(X).
sv --> v, sn(objeto).
sv --> v.det --> [o].              
det --> [a].
n --> [mulher].       
n --> [homem]. 
v --> [bate].
pro(sujeito) --> [ele].
pro(sujeito) --> [ela].
pro(objeto) --> [nele].
pro(objeto) --> [nela].

% ou

s(s(SN,SV)) --> sn(sujeito,SN), sv(SV).
sn(_, sn(Det,N)) --> det(Det), n(N).
sn(X, sn(Pro)) --> pro(X,Pro).
sv(sv(V,SN)) --> v(V), sn(objeto,SN).
sv(sv(V)) --> v(V).
det(det(o)) --> [o]. 
det(det(a)) --> [a].              
n(n(mulher)) --> [mulher].       
n(n(homem)) --> [homem].
v(v(bate)) --> [bate].
pro(sujeito,pro(ele)) --> [ele].
pro(sujeito,pro(ela)) --> [ela].
pro(objeto,pro(nele)) --> [nele].
pro(objeto,pro(nela)) --> [nela].