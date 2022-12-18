% Ex. 5

segmento([],_).
segmento(L, L1) :- 
	append([_, L, _], L1).
