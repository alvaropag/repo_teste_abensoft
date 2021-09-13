-module(cadastro_clientes).
-export([get_clientes/0,
        adicionar_cadastro/1,
        editar_clientes/2,
        excluir_clientes/2,
        update_clientes/1,
        get_proximo_id/1,
        mostra_condicional/2,
        listar_clientes/1]).



get_clientes() ->
    [
        [{id, 1}, {nome, "Carlos José"}, {data, "02/04/2001"}, {mae, "Clarice Soares"}, {cpf, "13203618974"}, {cidade, "Xaxim"}, {estado, "Santa Catarina"}, {cep, "89812210"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}],

        [{id, 2}, {nome, "Silvio Santos"}, {data, "06/08/1960"}, {mae, "Carla Santos"}, {cpf, "08649444970"}, {cidade, "Chapeco"}, {estado, "Santa Catarina"}, {cep, "47652542"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}],

        [{id, 3}, {nome, "Jorge Roberto"}, {data, "24/09/1999"}, {mae, "Berenice Rodrigues"}, {cpf, "05439655823"}, {cidade, "Xanxere"}, {estado, "Santa Catarina"}, {cep, "25489634"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}]
    ].


adicionar_cadastro(Clientes) ->
    IdAdicionar = get_proximo_id(Clientes),
    io:format("~n"),
    io:format(" #=#=# INCIANDO CADASTRO DO CLIENTE #=#=# ~n"),
    io:format("~n"),
    NomeAdicionar = utilitario_clientes:pede_tira_n("Digite o nome do Cliente: "),
    DataAdicionar = utilitario_clientes:pede_tira_n("Digite a data denascimento do Cliente: "),
    MaeAdicionar = utilitario_clientes:pede_tira_n("Digite o nome da mãe do Cliente: "),
    CpfAdicionar = utilitario_clientes:pede_tira_n("Digite o CPF do Cliente: "),
    CidadeAdicionar = utilitario_clientes:pede_tira_n("Digite a cidade do Cliente: "),
    EstadoAdicionar = utilitario_clientes:pede_tira_n("Digite o Estado do Cliente: "),
    CepAdicionar = utilitario_clientes:pede_tira_n("Digite o CEP do Cliente: "),
    EmailAdicionar = utilitario_clientes:compare_vazio(utilitario_clientes:pede_tira_n("Digite o email do Cliente: ")),
    Email2Adicionar = utilitario_clientes:compare_vazio(utilitario_clientes:pede_tira_n("Digite o email secundario do Cliente: ")),
    TelefoneAdicionar = utilitario_clientes:compare_vazio(utilitario_clientes:pede_tira_n("Digite o telefone do Cliente: ")),
    Telefone2Adicionar = utilitario_clientes:compare_vazio(utilitario_clientes:pede_tira_n("Digite o telefone secundario do Cliente: ")),
    io:format(" #=#=# CLIENTE CADASTRADO COM SUCESSO! #=#=# "),
    io:format("~n"),
    [{id, IdAdicionar}, {nome, NomeAdicionar}, {data, DataAdicionar}, {mae, MaeAdicionar}, {cpf, CpfAdicionar}, {cidade, CidadeAdicionar}, {estado, EstadoAdicionar}, {cep, CepAdicionar}, {email, EmailAdicionar}, {email2, Email2Adicionar}, {telefone, TelefoneAdicionar}, {telefone2, Telefone2Adicionar}].


get_proximo_id(Clientes) ->
    get_proximo_id(Clientes, 0).

get_proximo_id([], Acc) ->
    Acc+1;
get_proximo_id([Cliente|Clientes],Acc) ->
    IdAtual = utilitario_clientes:get_value(id, Cliente),
    NovoAcc = case Acc < IdAtual of
        true -> IdAtual;
        _ -> Acc
    end,
    get_proximo_id(Clientes, NovoAcc).



excluir_clientes(Clientes, Id) ->
    F = fun(Cliente) ->
        NumeroId = utilitario_clientes:get_value(id, Cliente),
        (NumeroId /= Id)
    end,
    io:format("~n"),
    io:format("CLIENTE EXCLUÍDO COM SUCESSO!"),
    io:format("~n"),
   lists:filter(F, Clientes).

editar_clientes(Clientes, Id) ->
    editar_clientes(Clientes, Id, []).

editar_clientes([], _Id, Acc) ->
    Acc;
editar_clientes([Cliente|Clientes], Id, Acc) ->
    IdCliente = utilitario_clientes:get_value(id, Cliente),
    IdNovo = case Id == IdCliente of
        true -> update_clientes(Cliente);
        _ -> Cliente
    end,
    editar_clientes(Clientes, Id, [IdNovo | Acc]).

update_clientes(Cliente) ->
    io:format("----- EDITANDO LISTA DE CLIENTES:  -----~n"),
    NomeDigitado = utilitario_clientes:pede_tira_n(["Novo Nome: ( ", utilitario_clientes:get_value(nome, Cliente), " ): " ]),
    DataDigitado = utilitario_clientes:pede_tira_n(["Nova Data: (", utilitario_clientes:get_value(data, Cliente), "): " ]),
    MaeDigitado = utilitario_clientes:pede_tira_n(["Novo Nome Mãe: (", utilitario_clientes:get_value(mae, Cliente), "): " ]),
    CpfDigitado = utilitario_clientes:pede_tira_n(["Novo CPF: (", utilitario_clientes:get_value(cpf, Cliente), "): " ]),
    CidadeDigitado = utilitario_clientes:pede_tira_n(["Nova Cidade: (", utilitario_clientes:get_value(cidade, Cliente), "): " ]),
    EstadoDigitado = utilitario_clientes:pede_tira_n(["Novo Estado: (", utilitario_clientes:get_value(estado, Cliente), "): " ]),
    CepDigitado = utilitario_clientes:pede_tira_n(["Novo CEP: (", utilitario_clientes:get_value(cep, Cliente), "): " ]),
    EmailDigitado = utilitario_clientes:compare_vazio(utilitario_clientes:pede_tira_n("Novo Email: ")),
    Email2Digitado = utilitario_clientes:compare_vazio(utilitario_clientes:pede_tira_n("Novo Email Secundario: ")),
    TelefoneDigitado = utilitario_clientes:compare_vazio(utilitario_clientes:pede_tira_n("Novo Telefone: ")),
    Telefone2Digitado = utilitario_clientes:compare_vazio(utilitario_clientes:pede_tira_n("Novo Telefone Secundario: ")),

    NomeEditado = utilitario_clientes:compare_chave(nome, NomeDigitado, Cliente),
    DataEditado = utilitario_clientes:compare_chave(data, DataDigitado, Cliente),
    MaeEditado = utilitario_clientes:compare_chave(mae, MaeDigitado, Cliente),
    CpfEditado = utilitario_clientes:compare_chave(cpf, CpfDigitado, Cliente),
    CidadeEditado = utilitario_clientes:compare_chave(cidade, CidadeDigitado, Cliente),
    EstadoEditado = utilitario_clientes:compare_chave(estadp, EstadoDigitado, Cliente),
    CepEditado = utilitario_clientes:compare_chave(cep, CepDigitado, Cliente),
    EmailEditado = utilitario_clientes:compare_chave(email, EmailDigitado, Cliente),
    Email2Editado = utilitario_clientes:compare_chave(email2, Email2Digitado, Cliente),
    TelefoneEditado = utilitario_clientes:compare_chave(telefone, TelefoneDigitado, Cliente),
    Telefone2Editado = utilitario_clientes:compare_chave(telefone2, Telefone2Digitado, Cliente),
    io:format("~n"),
    io:format("EDIÇÃO FEITA COM SUCESSO!"),
    io:format("~n"),

    [{nome, NomeEditado}, {data, DataEditado}, {mae, MaeEditado}, {cpf, CpfEditado}, {cidade, CidadeEditado}, {estado, EstadoEditado}, {cep, CepEditado}, {email, EmailEditado}, {email2, Email2Editado}, {telefone, TelefoneEditado}, {telefone2, Telefone2Editado}].


listar_clientes(Clientes) ->
    listar_clientes(Clientes, []).

listar_clientes([], Acc) ->
    Acc;
listar_clientes([Cliente | Clientes], Acc) ->
    lista_de_clientes(Cliente),
    listar_clientes(Clientes, [Cliente | Acc]).

lista_de_clientes(Cliente) ->
    io:format("ID: ~p~n", [utilitario_clientes:get_value(id, Cliente)]),
    io:format("Nome: ~p~n", [utilitario_clientes:get_value(nome, Cliente)]),
    io:format("Data Nascimento: ~p~n", [utilitario_clientes:get_value(data, Cliente)]),
    io:format("Nome da Mãe: ~p~n", [utilitario_clientes:get_value(mae, Cliente)]),
    io:format("CPF: ~p~n", [utilitario_clientes:get_value(cpf, Cliente)]),
    io:format("Cidade: ~p~n", [utilitario_clientes:get_value(cidade, Cliente)]),
    io:format("Estado: ~p~n", [utilitario_clientes:get_value(estado, Cliente)]),
    io:format("Cep: ~p~n", [utilitario_clientes:get_value(cep, Cliente)]),
    Email = utilitario_clientes:get_value(email, Cliente),
    Email2 = utilitario_clientes:get_value(email2, Cliente),
    Telefone = utilitario_clientes:get_value(telefone, Cliente),
    Telefone2 = utilitario_clientes:get_value(telefone2, Cliente),
    mostra_condicional(Email, "Email"),
    mostra_condicional(Email2, "Email Secundario:"),
    mostra_condicional(Telefone, "Telefone:"),
    mostra_condicional(Telefone2, "Telefone Secundario: "),
    io:format("~n").

mostra_condicional(undefined, _) ->
    ok;
mostra_condicional(Valor, Campo) ->
    io:format("~p: ~p~n", [Campo, Valor]).








