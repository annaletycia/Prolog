/* http_parameters   */
:- use_module(library(http/http_parameters)).
/* http_reply        */
:- use_module(library(http/http_header)).
/* reply_json_dict   */
:- use_module(library(http/http_json)).

:- use_module(bd(reservas_has_convidados), []).

% Rotas com GET

reservas_has_convidados(get,'', _Pedido):- !,
	envia_tabela.

reservas_has_convidados(get, AtomIdReserva, _Pedido):-
	atom_number(AtomIdReserva, IdReserva), % o identificador aparece na rota como um átomo,
	!,                       % converta-o para um número inteiro.
	envia_tupla(IdReserva).

% Rotas com POST

reservas_has_convidados(post, _, Pedido):-
	http_read_json_dict(Pedido, Dados), % lê o JSON enviado com o Pedido
	!,
	insere_tupla(Dados).

% Rotas com PUT

reservas_has_convidados(put, AtomIdReserva, Pedido):-
	atom_number(AtomIdReserva, IdReserva),
	http_read_json_dict(Pedido, Dados),  % lê o JSON enviado com o Pedido
	!,
	atualiza_tupla(Dados, IdReserva).

% Rotas com DELETE

reservas_has_convidados(delete, AtomIdReserva, _Pedido):-
	atom_number(AtomIdReserva, IdReserva),
	!,
	reservas_has_convidados:remove(IdReserva),
	throw(http_reply(no_content)). % Responde usando o código 204 No Content

/* Se algo ocorrer de errado, a resposta de método não permitido será retornada.*/

reservas_has_convidados(Metodo, IdUsuarioRes, _Pedido):-
	% responde com o código 405 Method Not Allowed
	throw(http_reply(method_not_allowed(Metodo, IdReserva))).

insere_tupla( _{cat_desc_reservas_has_convidados:Desc, cat_end_imagem:Img}, IdReserva):-
    reservas_has_convidados:insere(IdUsuarioRes,HoraRes,DataRes,IdAmbienteRes,IdRes,IdConvidado).


atualiza_tupla( _{pk_id_categoria_ambiente:AtomId, cat_desc_reservas_has_convidados:Desc, cat_end_imagem:Img}, Id):-
    atom_number(AtomId, Id),
    reservas_has_convidados:atualiza(Id, Desc, Img).

envia_tupla(IdReserva):-
    (  reservas_has_convidados:reservas_has_convidados(IdReserva,Data,Hora,IdAmbiente,IdUsuario,Justificativa,Datetime, User)
    -> reply_json_dict( _{reservas_usuarios_pk_id_usuario:IdUsuarioRes, cat_desc_reservas_has_convidados:Desc, cat_end_imagem:Img} )
    ;  throw(http_reply(not_found(IdUsuarioRes)))
    ).


envia_tabela :-
    findall( _{reservas_usuarios_pk_id_usuario:IdUsuarioRes, cat_desc_reservas_has_convidados:Desc, cat_end_imagem:Img},
             reservas_has_convidados:reservas_has_convidados(IdUsuarioRes,HoraRes,DataRes,IdAmbienteRes,IdRes,IdConvidado),
             Tuplas ),
    reply_json_dict(Tuplas).