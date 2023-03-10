% http_handler, http_reply_file
:- use_module(library(http/http_dispatch)).

% http:location
:- use_module(library(http/http_path)).

:- ensure_loaded(caminhos).

/***********************************
*                                  *
*      Rotas do Servidor Web       *
*                                  *
***********************************/

:- multifile http:location/3.
:- dynamic   http:location/3.

%% http:location(Apelido, Rota, Opções)
%      Apelido é como será chamada uma Rota do servidor.
%      Os apelidos css, icons e js já estão definidos na
%      biblioteca http/http_server_files, os demais precisam
%      ser definidos.

http:location(img, root(img), []).
http:location(api, root(api), []).
http:location(api1, api(v1), []).
http:location(webfonts, root(webfonts), []).

/***********************************
*                                  *
*            Tratadores            *
*                                  *
***********************************/

% Recursos estáticos
:- http_handler( css(.),
		serve_files_in_directory(dir_css), [prefix]).
:- http_handler( img(.),
		serve_files_in_directory(dir_img), [prefix]).
:- http_handler( js(.),
		serve_files_in_directory(dir_js),  [prefix]).
:- http_handler( webfonts(.),
		serve_files_in_directory(dir_webfonts), [prefix]).

% Rotas do Frontend


:- http_handler( root(.), entrada,   []).

:- http_handler( root(reservas_canceladas), cadastro, []).

:- http_handler(root(reservas_has_convidados), cadastro, []).

% Rotas da API
:- http_handler( api1(reservas_canceladas/IdReserva), 
		reservas_canceladas(Metodo, IdReserva),
		[ method(Metodo),
		methods([ get, post, put, delete ]) ]).

:- http_handler( api1(reservas_has_convidados/IdUsuarioRes), 
		reservas_has_convidados(Metodo, IdUsuarioRes),
		[ method(Metodo),
		methods([ get, post, put, delete ]) ]).