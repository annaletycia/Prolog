% Ex. 15

s(s(SNS,SVS)) --> sns(sujeito,SNS), svs(SVS).
s(s(SNP,SVP)) --> snp(sujeito,SNP), svp(SVP).
sns(_, sns(Dets,Ns)) --> dets(Dets), ns(Ns).
sns(X, sns(Pros)) --> pros(X,Pros).
snp(_, snp(Detp,Np)) --> detp(Detp), np(Np).
snp(X, snp(Prop)) --> prop(X,Prop).
svs(svs(Vs,SNs)) --> vs(Vs), sns(objetos,SNs).
svs(svs(Vs)) --> vs(Vs).
svp(svp(Vp,SNp)) --> vp(Vp), snp(objetop,SNp).
svp(svp(Vp)) --> vp(Vp).
dets(dets(o)) --> [o].
dets(dets(a)) --> [a].
detp(detp(os)) --> [os].
detp(detp(as)) --> [as].
ns(ns(mulher)) --> [mulher].
ns(ns(homem)) --> [homem].
np(np(mulheres)) --> [mulheres].
np(np(homens)) --> [homens].
vs(vs(bate)) --> [bate].
vp(vp(batem)) --> [batem].
pros(sujeitos,pros(ele)) --> [ele].
pros(sujeitos,pros(ela)) --> [ela].
pros(objetos,pros(nele)) --> [nele].
pros(objetos,pros(nela)) --> [nela].
prop(sujeitop,prop(eles)) --> [eles].
prop(sujeitop,prop(elas)) --> [elas].
prop(objetop,prop(neles)) --> [neles].
prop(objetop,prop(nelas)) --> [nelas].