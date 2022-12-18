:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/html_write)).
:- use_module(library(http/http_client)).

servidor(Porta) :-
    http_server(http_dispatch, [port(Porta)]).

:- http_handler(root(.), home, []).
:- http_handler(root(reservas_canceladas), reservas_canceladas, []).
:- http_handler(root(reservas_has_convidados), reservas_has_convidados, []).

home(_Pedido) :-
    reply_html_page(
        [ title('Sistema de Gestao para Clubes Recreativos e Esportivos') ],
        [ \forms ] ).

forms -->
    html( [ h1('Sistema de Gestao para Clubes Recreativos e Esportivos'), 
            p(a(href('reservas_canceladas'), 'Formulario Reservas Canceladas')),
            p(a(href('reservas_has_convidados'), 'Formulario Reservas Has Convidados'))
        ]).


reservas_canceladas(_Pedido) :-
    reply_html_page( title('Formulario de reservas canceladas'),
        [ form([action = '/res_canceladas', method='post'], 
                [ 
                    p([], [ label([for=id_res_can], 'Id da reserva cancelada: '),
                            input([name=id_res_can, type=textarea]) ]),
                    p([], [ label([for=data_res_can], 'Data da reserva cancelada: '),
                            input([name=data_res_can, type=textarea]) ]),
                    p([], [ label([for=hora_res_can], 'Hora da reserva cancelada: '),
                            input([name=hora_res_can, type=textarea]) ]),
                    p([], [ label([for=ambiente_res_can], 'Ambiente ao qual pertencia a reserva: '),
                            input([name=ambiente_res_can, type=textarea]) ]),
                    p([], [ label([for=id_user_res_can], 'Id do usuario da reserva cancelada: '),
                            input([name=id_user_res_can, type=textarea]) ]),
                    p([], [ label([for=justificativa_res_can], 'Justificativa: '),
                            input([name=justificativa_res_can, type=textarea]) ]),
                    p([], [ label([for=datetime_res_can], 'Data e hora em que a reserva foi cancelada: '),
                            input([datetime_res_can, type=textarea]) ]),
		    p([], [ label([for=cod_user],'Codigo do usuario que efetuou o cancelamento da reserva: '),
			    input([name=cod_user, type=textarea]) ]),
                    p([], input([name=submit, type=submit, value='Enviar'], []))
                ]) 
        ]).

:- http_handler('/res_canceladas', recebe_form(Method),
                [ method(Method), 
                 methods([post]) ]).

reservas_has_convidados(_Pedido) :-
    reply_html_page( title('Formulario de reservas has convidados'),
        [
            form([action = '/res_convidados', method='post'],
                [
                p([], [ label([for=id_usuario],'Id do usuario: '),
		 	input([name=id_usuario, type=textarea]) ]),
		p([], [ label([for=hora_res],'Hora da reserva: '),
			input([name=hora_res, type=textarea]) ]),
		p([], [ label([for=data_res],'Data da reserva: '),
			input([name=data_res, type=textarea]) ]),
		p([], [ label([for=ambiente_res],'Id do ambiente da reserva: '),
			input([name=ambiente_res, type=textarea]) ]),
		p([], [ label([for=id_res],'Id da reserva realizada: '),
			input([name=id_res, type=textarea]) ]),
		p([], [ label([for=id_convidado],'Id do convidado: '),
			input([name=id_convidado, type=textarea]) ]),
		p([], input([ name=submit, type=submit, value='Enviar'],
				[]))
	])]).

:- http_handler('/res_convidados', recebe_form(Method),
            [ method(Method),
                methods([post]) ]).

recebe_form(post, Pedido) :-
    http_read_data(Pedido, Dados, []),
    format('Content-type: text/html~n~n', []),
    format('<h2>Dados enviados com sucesso</h2>', []),
    portray_clause(Dados).