-module(estatisticas).
-export([media_idade_otimizado/1]).



media_idade(Clientes) ->
    SomaIdades = soma_idades(Clientes),
    QtdePessoas = qtde_pessoas(Clientes),
    SomaIdades / QtdePessoas.

qtde_pessoas(Clientes) ->
    qtde_pessoas(Clientes, 0).

qtde_pessoas([], QtdePessoas) ->
    QtdePessoas;
qtde_pessoas([_Cliente|Clientes], QtdePessoas) ->
    qtde_pessoas(Clientes, QtdePessoas +1).

soma_idades(Clientes) ->
    soma_idades(Clientes, 0).

soma_idades([], SomaIdades) ->
    SomaIdades;
soma_idades([Cliente|Clientes], SomaIdades) ->
    Idade = busca_idade(Cliente),
    SumIdades = SomaIdades + Idade,
    soma_idades(Clientes, SumIdades).

busca_idade([]) ->
    0;
busca_idade([{idade, Idade} | _Resto]) ->
    Idade;
busca_idade([_|Resto]) ->
    busca_idade(Resto).









