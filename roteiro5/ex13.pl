% Ex. 13

s --> sns, svs.
s --> snp, svp.

sns --> dets, ns.
snp --> detp, np.

svs --> vs, sns.
svs --> vs.
svp --> vp, snp.
svp --> vp.

dets --> [o].
dets --> [a].
detp --> [os].
detp --> [as].

ns --> [mulher].
ns --> [homem].
np --> [mulheres].
np --> [homens].

vs --> [bate].
vp --> [batem].

% ?- s([o,homem,bate],[]).
% true .

% ?- s([os,homens,batem],[]).
% true.

% ?- s([o,homem,batem],[]).
% false.

% ?- s([os,homens,bate],[]).
% false.