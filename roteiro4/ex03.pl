% Ex. 3

dec_para_bin(0,[0]).
dec_para_bin(1,[1]).
dec_para_bin(N,B):- 
    N > 1,
    X is N mod 2,
    Y is N div 2,  
    dec_para_bin(Y,B1), 
    append(B1, [X], B).
