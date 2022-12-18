% Ex. 6

pais(alemanha,europa,83,[franca,belgica,holanda,suica]).
pais(australia,oceania,25,[]).
pais(belgica,europa,11,[franca,holanda,alemanha]).
pais(espanha,europa,47,[portugal,franca]).
pais(franca,europa,67,[espanha,suica,belgica,alemanha,italia]).
pais(holanda,europa,17,[belgica,alemanha]).
pais(indonesia,oceania,268,[]).
pais(italia,europa,60,[franca,suica]).
pais(madagascar,africa,26,[]).
pais(portugal,europa,10,[espanha]).
pais(suica,europa,8,[franca,alemanha,italia]).

isolados_grandes(Lista):- 
 	findall(Cont,(isolado_grande(Pais1,Cont),isolado_grande(Pais2,Cont),Pais1\=Pais2),Lista1), 
 	sort(Lista1,Lista). 
isolado_grande(Pais, Cont):- 
	pais(Pais, Cont, Pop, Front),Pop>15,length(Front,L),L<3. 