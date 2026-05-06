:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_json)).

% Rota GET /
:- http_handler(root(.), home_handler, []).

% Rota GET /api/hello
:- http_handler(root(api/hello), hello_handler, []).

home_handler(_Request) :-
    reply_json_dict(_{
        message: "Servidor Prolog funcionando",
        routes: ["/api/hello"]
    }).

hello_handler(_Request) :-
    reply_json_dict(_{
        status: "ok",
        language: "Prolog",
        message: "Hello from SWI-Prolog!"
    }).

server(Port) :-
    http_server(http_dispatch, [port(Port)]).


main :-
    server(8080),
    thread_get_message(_).

:- initialization(main, main).