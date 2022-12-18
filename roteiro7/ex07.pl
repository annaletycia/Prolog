% Ex. 7

subconjunto([], _).
subconjunto([X|XS],[X|XSS]):- subconjunto(XS,XSS).
subconjunto([X|XS],[_|XSS]):- subconjunto([X|XS],XSS).