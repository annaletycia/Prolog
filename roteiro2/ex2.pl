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