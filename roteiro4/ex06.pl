% Ex. 6

bissexto(Ano) :-
    	Ano > 0,
        Ano mod 4 =:= 0,
        Ano mod 100 =\= 0;
        Ano mod 400 =:= 0.