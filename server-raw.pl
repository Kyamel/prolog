:- use_module(library(socket)).

server(Port) :-
    tcp_socket(Socket),
    tcp_bind(Socket, Port),
    tcp_listen(Socket, 5),
    write('Started server at http://localhost:'),
    write(Port),
    nl,
    accept_loop(Socket).

accept_loop(Socket) :-
    tcp_accept(Socket, Client, _Peer),
    setup_call_cleanup(
        tcp_open_socket(Client, In, Out),
        handle_client(In, Out),
        close_connection(In, Out)
    ),
    accept_loop(Socket).

close_connection(In, Out) :-
    close(In),
    close(Out).

handle_client(In, Out) :-
    read_line_to_string(In, RequestLine),
    read_headers(In),
    handle_request(RequestLine, Out).

read_headers(In) :-
    read_line_to_string(In, Line),
    (   Line == ""
    ->  true
    ;   read_headers(In)
    ).

handle_request("GET /api/hello HTTP/1.1", Out) :-
    !,
    Body = "{\"status\":\"ok\",\"message\":\"Hello from raw Prolog HTTP\"}",
    write_response(Out, "200 OK", "application/json", Body).

handle_request("GET / HTTP/1.1", Out) :-
    !,
    Body = "{\"message\":\"Home\"}",
    write_response(Out, "200 OK", "application/json", Body).

handle_request(_, Out) :-
    Body = "{\"error\":\"Not found\"}",
    write_response(Out, "404 Not Found", "application/json", Body).

write_response(Out, Status, ContentType, Body) :-
    string_length(Body, Len),
    format(Out, "HTTP/1.1 ~w\r\n", [Status]),
    format(Out, "Content-Type: ~w\r\n", [ContentType]),
    format(Out, "Content-Length: ~d\r\n", [Len]),
    format(Out, "Connection: close\r\n", []),
    format(Out, "\r\n", []),
    format(Out, "~s", [Body]),
    flush_output(Out).

:- initialization(server(8060), main).