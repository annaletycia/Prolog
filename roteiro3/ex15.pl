% Ex. 15

prodEsc([X],[Y],W) :- W is X*Y.
prodEsc([X|L1],[Y|L2],Z) :- prodEsc([X],[Y],W),
    			    prodEsc(L1,L2,V),
    			    Z is W+V.
