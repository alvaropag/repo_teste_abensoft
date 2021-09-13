-module(menu_clientes).
-export([menu/0]).




menu() ->
    Clientes = cadastro_clientes:get_clientes(),
    menu(Clientes).


menu(Clientes) ->
    io:format("Informe a opção que deseja!~n"),
    io:format("Digite => (1) para Adicionar um Cliente!~n"),
    io:format("Digite => (2) para Listar os Clientes!~n"),
    io:format("Digite => (3) para Editar um Cliente!~n"),
    io:format("Digite => (4) para Excluir um Cliente!~n"),
    io:format("Digite => (0) Para Sair!"),

    Option = list_to_integer(utilitario_clientes:pede_tira_n("  ")),
    option(Option, Clientes).

    -spec option(pos_integer(), list()) -> list().
option(1, Clientes) ->
    Resultado = cadastro_clientes:adicionar_cadastro(Clientes),
    menu([Resultado|Clientes]);

    option(2, Clientes) ->
    io:format("~n"),
    io:format("LISTA DE CLIENTES: "),
    io:format("~n"),
    io:format("~n"),
    Resultado = cadastro_clientes:listar_clientes(Clientes),
    menu(Resultado);

    option(3, Clientes) ->
    Id = list_to_integer(utilitario_clientes:pede_tira_n("Informe o ID de quem deseja Editar: ->  ")),
    Resultado = cadastro_clientes:editar_clientes(Clientes, Id),
    menu(Resultado);

    option(4, Clientes) ->
    Id = list_to_integer(utilitario_clientes:pede_tira_n("Informe o ID de quem deseja Excluir ->  ")),
    Resultado = cadastro_clientes:excluir_clientes(Clientes, Id),
    menu(Resultado);

    option(0, _Empreendimentos)  ->
    ok.











