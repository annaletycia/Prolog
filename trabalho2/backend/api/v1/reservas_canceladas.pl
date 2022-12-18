/* http_parameters   */
:- use_module(library(http/http_parameters)).
/* http_reply        */
:- use_module(library(http/http_header)).
/* reply_json_dict   */
:- use_module(library(http/http_json)).

:- use_module(bd(reservas_canceladas), []).

% Rotas com GET

reservas_canceladas(get,'', _Pedido):- !,
	envia_tabela.

reservas_canceladas(get, AtomIdReserva, _Pedido):-
	atom_number(AtomIdReserva, IdReserva), % o identificador aparece na rota como um átomo,
	!,                       % converta-o para um número inteiro.
	envia_tupla(IdReserva).

% Rotas com POST

reservas_canceladas(post, _, Pedido):-
	http_read_json_dict(Pedido, Dados), % lê o JSON enviado com o Pedido
	!,
	insere_tupla(Dados).

% Rotas com PUT

reservas_canceladas(put, AtomIdReserva, Pedido):-
	atom_number(AtomIdReserva, IdReserva),
	http_read_json_dict(Pedido, Dados),  % lê o JSON enviado com o Pedido
	!,
	atualiza_tupla(Dados, IdReserva).

% Rotas com DELETE

reservas_canceladas(delete, AtomIdReserva, _Pedido):-
	atom_number(AtomIdReserva, IdReserva),
	!,
	reservas_canceladas:remove(IdReserva),
	throw(http_reply(no_content)). % Responde usando o código 204 No Content

/* Se algo ocorrer de errado, a resposta de método não permitido será retornada.*/

reservas_canceladas(Metodo, IdReserva, _Pedido):-
	% responde com o código 405 Method Not Allowed
	throw(http_reply(method_not_allowed(Metodo, IdReserva))).

insere_tupla( _{cat_desc_reservas_canceladas:Desc, cat_end_imagem:Img}, IdReserva):-
    reservas_canceladas:insere(IdReserva,Data,Hora,IdAmbiente,IdUsuario,Justificativa,Datetime, User).


atualiza_tupla( _{pk_id_categoria_ambiente:AtomId, cat_desc_reservas_canceladas:Desc, cat_end_imagem:Img}, Id):-
    atom_number(AtomId, Id),
    reservas_canceladas:atualiza(Id, Desc, Img).

envia_tupla(IdReserva):-
    (  reservas_canceladas:reservas_canceladas(IdReserva,Data,Hora,IdAmbiente,IdUsuario,Justificativa,Datetime, User)
    -> reply_json_dict( _{pk_id_reserva_cancelada:IdReserva, cat_desc_reservas_canceladas:Desc, cat_end_imagem:Img} )
    ;  throw(http_reply(not_found(IdReserva)))
    ).


envia_tabela :-
    findall( _{pk_id_reserva_cancelada:IdReserva, cat_desc_reserva_cancelada:Desc, cat_end_imagem:Img},
             reservas_canceladas:reservas_canceladas(IdReserva,Data,Hora,IdAmbiente,IdUsuario,Justificativa,Datetime, User),
             Tuplas ),
    reply_json_dict(Tuplas).