-module(menu_cliente).
-export([menu/0]).


menu() ->
  Clients = cadastros:clients(),
    menu(Clients).

menu(Clients) ->
    io:format("============================~n"),
    io:format(" >>>> WELCOME !  <<<<<~n"),
    io:format("> Type 1 to Register~n"),
    io:format("> type 2 to Edit~n"),
    io:format("> type 3 to Delete~n"),
    io:format("> type 4 to List~n"),
    io:format("> type 0 to Quit.~n"),
    io:format("==========================~n"),

    Options = list_to_integer(cadastros:take_value(":")),
    option(Options, Clients).

option(1, Clients) ->
    Return = cadastros:register_client(Clients),
    menu(Return);

option(2, Clients) ->
    Id = list_to_integer(take_value("Type the Id to edit:"),
    Return = cadastros:edit_client(Clients, Id),
    menu(Return);

option(3, Clients) ->
    Id = list_to_integer(take_value("Type the Id to delete:"),
    Return = cadastros:delete_client(Clients),
    menu(Return);

option(4, Clients) ->
    Return = cadastros:list_clients(Clients),
   menu(Return);

option(0) ->
    io:format("'-'").

