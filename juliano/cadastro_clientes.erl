-module(cadastro_clientes).
-export([get_clientes/0,
        adicionar_cadastro/1,
        editar_clientes/2,
        excluir_clientes/2,
        update_clientes/1,
        get_proximo_id/1,
        get_desc_escolaridade/1,
        media_idade/1,
        replace_valor/3,
        mostra_condicional/2,
        media_salario/1,
        lista_genero/1,
        coloca_na_lista_correta/3,
        mostra_estatistica_genero/1,
        mostra_estatistica_salario/1,
        divide_lista/2,
        total_genero/1,
        total_escolaridade/1,
        lista_escolaridade/1,
        listar_clientes/1]).

-define(ESCOLARIDADE_ANALFABETO, 0).
-define(ESCOLARIDADE_ANALFABETO_DESC, "Analfabeto").
-define(ESCOLARIDADE_ENSINO_BASICO, 1).
-define(ESCOLARIDADE_ENSINO_BASICO_DESC, "Ensino Basico").
-define(ESCOLARIDADE_ENSINO_MEDIO, 2).
-define(ESCOLARIDADE_ENSINO_MEDIO_DESC, "Ensino Médio").
-define(ESCOLARIDADE_MEDIO_COMPLETO,3).
-define(ESCOLARIDADE_MEDIO_COMPLETO_DESC, "Ensino Médio Completo").
-define(ESCOLARIDADE_POS_GRADUACAO, 4).
-define(ESCOLARIDADE_POS_GRADUACAO_DESC, "PÓS GRADUAÇÃO COMPLETA").
-define(ESCOLARIDADE_MESTRADO, 5).
-define(ESCOLARIDADE_MESTRADO_DESC, "Mestrado Completo").
-define(ESCOLARIDADE_DOUTORADO, 6).
-define(ESCOLARIDADE_DOUTORADO_DESC, "Doutorado Completo").
-define(ESCOLARIDADE_PHD, 7).
-define(ESCOLARIDADE_PHD_DESC, "PHD Completo").
%-define(QUALQUER_COISA, _).
%-define(QUALQUER_COISA_DESC, "INEXISTENTE").



-define(GENERO_MASCULINO, 8).
-define(GENERO_MASCULINO_DESC, "Masculino").
-define(GENERO_FEMININO, 9).
-define(GENERO_FEMENINO_DESC, "Feminino").
-define(GENERO_INDEFINIDO, 10).
-define(GENERO_INDEFINIDO_DESC, "Indefinido").
%-define(GENERO_QUALQUER, _).
%-define(GENERO_QUALQUER_DESC, "INEXISTENTE").



get_desc_escolaridade(?ESCOLARIDADE_ANALFABETO) ->
    ?ESCOLARIDADE_ANALFABETO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_ENSINO_BASICO) ->
    ?ESCOLARIDADE_ENSINO_BASICO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_ENSINO_MEDIO) ->
    ?ESCOLARIDADE_ENSINO_MEDIO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_MEDIO_COMPLETO) ->
    ?ESCOLARIDADE_MEDIO_COMPLETO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_POS_GRADUACAO)  ->
    ?ESCOLARIDADE_POS_GRADUACAO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_MESTRADO) ->
    ?ESCOLARIDADE_MESTRADO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_DOUTORADO) ->
    ?ESCOLARIDADE_DOUTORADO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_PHD) ->
    ?ESCOLARIDADE_PHD_DESC.
%get_desc_escolaridade(?QUALQUER_COISA) ->
%    ?QUALQUER_COISA_DESC.



get_desc_genero(?GENERO_MASCULINO) ->
    ?GENERO_MASCULINO_DESC;
get_desc_genero(?GENERO_FEMININO) ->
    ?GENERO_FEMENINO_DESC;
get_desc_genero(?GENERO_INDEFINIDO) ->
    ?GENERO_INDEFINIDO_DESC.
%get_desc_genero(?QUALQUER_COISA) ->
%    ?GENERO_QUALQUER_DESC.



get_clientes() ->
    [
        [{id, 1}, {nome, "Carlos José"}, {idade, 60},  {data, "02/04/2001"}, {mae, "Clarice Soares"}, {cpf, "132.036.189-74"}, {cidade, "Xaxim"}, {estado, "Santa Catarina"}, {cep, "89812210"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}, {renda, 1735.80}, {escolaridade, 0}, {genero, 8}],

        [{id, 2}, {nome, "Silvio Santos"}, {idade, 60}, {data, "06/08/1960"}, {mae, "Carla Santos"}, {cpf, "086.494.449-70"}, {cidade, "Chapeco"}, {estado, "Santa Catarina"}, {cep, "47652542"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}, {renda, 1280.40}, {escolaridade, 1}, {genero, 8}],

        [{id, 3}, {nome, "Jorge Roberto"}, {idade, 60}, {data, "24/09/1999"}, {mae, "Berenice Rodrigues"}, {cpf, "054.396.558-23"}, {cidade, "Xanxere"}, {estado, "Santa Catarina"}, {cep, "36626224"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}, {renda, 6900.80}, {escolaridade, 2}, {genero, 8}],

        [{id, 4}, {nome, "Maria Antonieta"}, {idade, 60}, {data, "28/01/1985"}, {mae, "Renata Ferreira"}, {cpf, "144.391.158-32"}, {cidade, "Pato Branco"}, {estado, "Paraná"}, {cep, "99595959"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}, {renda, 1900.80}, {escolaridade, 4}, {genero, 9}],

        [{id, 5}, {nome, "Pedro Sampaio"}, {idade, 60}, {data, "29/04/2000"}, {mae, "Lais de almeida"}, {cpf, "098.146.268-85"}, {cidade, "Curitiba"}, {estado, "Paraná"}, {cep, "96262581"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}, {renda, 2000.80}, {escolaridade, 3}, {genero, 8}],

        [{id, 6}, {nome, "Julia De Souza"}, {idade, 60}, {data, "14/06/1994"}, {mae, "Veronica De Souza"}, {cpf, "352.142.145-94"}, {cidade, "Curitiba"}, {estado, "Paraná"}, {cep, "81214814"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}, {renda, 5000.80}, {escolaridade, 3}, {genero, 9}],

        [{id, 7}, {nome, "Fernanda Fagundes"}, {idade, 60}, {data, "17/05/1977"}, {mae, "Lorita Fagundes"}, {cpf, "142.741.145-33"}, {cidade, "Maravilha"}, {estado, "Santa Catarina"}, {cep, "12151415"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}, {renda, 6000.80}, {escolaridade, 4}, {genero, 9}],

        [{id, 8}, {nome, "Juliana Rodrigues"}, {idade, 60}, {data, "31/10/1997"}, {mae, "Ivete Rodrigues"}, {cpf, "048.321.145-44"}, {cidade, "São Carlos"}, {estado, "Santa Catarina"}, {cep, "36258484"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}, {renda, 7000.80}, {escolaridade, 6}, {genero, 9}],

        [{id, 9}, {nome, "Georgia Da Silva"}, {idade, 60}, {data, "11/11/1996"}, {mae, "Maria Da Silva"}, {cpf, "024.112.221-85"}, {cidade, "Guatambu"}, {estado, "Santa Catarina"}, {cep, "84841254"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}, {renda, 5500.80}, {escolaridade, 6}, {genero, 9}],

        [{id, 10}, {nome, "Roberto Carlos"}, {idade, 60}, {data, "19/03/1995"}, {mae, "Paula Fernandes"}, {cpf, "145.256.632-96"}, {cidade, "Pinhalzinho"}, {estado, "Santa Catarina"}, {cep, "28432645"}, {email, undefined}, {email2, undefined}, {telefone, undefined}, {telefone2, undefined}, {renda, 1500.80}, {escolaridade, 7}, {genero, 8}]
    ].


replace_valor(Chave, NovoValor, Proplist) ->
    replace_valor(Chave, NovoValor, Proplist, []).

replace_valor(_Chave, _NovoValor, [], Acc) ->
    Acc;
replace_valor(Chave, NovoValor, [{Chave, _Valor} | RestoProplist], Acc) ->
    lists:merge3([{Chave, NovoValor}], RestoProplist, Acc);
replace_valor(Chave, NovoValor, [X | RestoProplist], Acc) ->
    replace_valor(Chave, NovoValor, RestoProplist, [X|Acc]).



adicionar_cadastro(Clientes) ->
    IdAdicionar = get_proximo_id(Clientes),
    io:format("~n"),
    io:format(" #=#=# INCIANDO CADASTRO DO CLIENTE #=#=# ~n"),
    io:format("~n"),
    NomeAdicionar = utilitario_clientes:pede_tira_n("Digite o nome do Cliente: "),
    IdadeAdicionar = utilitario_clientes:pede_tira_n("Digite a IDADE do cliente: "),
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
    io:format("GENERO MASCULINO     (8) ~n"),
    io:format("GENERO FEMININO      (9) ~n"),
    io:format("GENERO INDEFINIDO    (10)~n"),
    GeneroAdicionar = get_desc_genero(list_to_integer(utilitario_clientes:pede_tira_n("DIGITE A OPÇÃO DE GENERO: "))),
    io:format("~n"),
    io:format("ANALFABETO             (0) ~n"),
    io:format("ENSINO FUNDAMENTAL     (1) ~n"),
    io:format("ENSINO MÉDIO           (2) ~n"),
    io:format("ENSINO MEDIO COMPLETO  (3) ~n"),
    io:format("PÓS GRADUAÇÃO          (4) ~n"),
    io:format("MESTRADO               (5) ~n"),
    io:format("DOUTORADO              (6) ~n"),
    io:format("PHD                    (7) ~n"),
    EscolaridadeAdicionar = get_desc_escolaridade(list_to_integer(utilitario_clientes:pede_tira_n("DIGITE A OPÇÃO DE ESCOLARIDADE"))),
    RendaAdicionar = list_to_float(utilitario_clientes:pede_tira_n("Digite a Renda do Cliente: R$")),
    io:format(" #=#=# CLIENTE CADASTRADO COM SUCESSO! #=#=# "),
    io:format("~n"),
    [{id, IdAdicionar}, {nome, NomeAdicionar}, {idade, IdadeAdicionar}, {data, DataAdicionar}, {mae, MaeAdicionar}, {cpf, CpfAdicionar}, {cidade, CidadeAdicionar}, {estado, EstadoAdicionar}, {cep, CepAdicionar}, {email, EmailAdicionar}, {email2, Email2Adicionar}, {telefone, TelefoneAdicionar}, {telefone2, Telefone2Adicionar}, {renda, RendaAdicionar}, {genero, GeneroAdicionar}, {escolaridade, EscolaridadeAdicionar}].

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
    IdadeDigitado = utilitario_clientes:pede_tira_n(["Nova Idade: (", integer_to_list(utilitario_clientes:get_value(idade, Cliente)), "): " ]),
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
    io:format("Digite A Renda (ATUALIZADA)"),
    io:format("~n"),
    RendaEditado = utilitario_clientes:pede_tira_n("Nova Renda: "),
   % RendaEditado = list_to_float(utilitario_clientes:pede_tira_n(["Nova Renda: (", list_to_float(utilitario_clientes:get_value(renda, Cliente)), "): " ])),
    io:format("GENERO MASCULINO     (8) ~n"),
    io:format("GENERO FEMININO      (9) ~n"),
    io:format("GENERO INDEFINIDO    (10)~n"),
    GeneroDigitado = utilitario_clientes:pede_tira_n(["Novo Genero: (", get_desc_genero(utilitario_clientes:get_value(genero, Cliente)), "): " ]),
    io:format("~n"),
    io:format("ANALFABETO             (0) ~n"),
    io:format("ENSINO FUNDAMENTAL     (1) ~n"),
    io:format("ENSINO MÉDIO           (2) ~n"),
    io:format("ENSINO MEDIO COMPLETO  (3) ~n"),
    io:format("PÓS GRADUAÇÃO          (4) ~n"),
    io:format("MESTRADO               (5) ~n"),
    io:format("DOUTORADO              (6) ~n"),
    io:format("PHD                    (7) ~n"),
    EscolaridadeDigitado = utilitario_clientes:pede_tira_n(["Nova Escolaridade: (", get_desc_escolaridade(utilitario_clientes:get_value(escolaridade, Cliente)), "): " ]),

    EscolaridadeEditado = list_to_integer(EscolaridadeDigitado),
    GeneroEditado = list_to_integer(GeneroDigitado),
    NomeEditado = utilitario_clientes:compare_chave(nome, NomeDigitado, Cliente),
    IdadeEditado = utilitario_clientes:compare_chave(idade, IdadeDigitado, Cliente),
    DataEditado = utilitario_clientes:compare_chave(data, DataDigitado, Cliente),
    MaeEditado = utilitario_clientes:compare_chave(mae, MaeDigitado, Cliente),
    CpfEditado = utilitario_clientes:compare_chave(cpf, CpfDigitado, Cliente),
    CidadeEditado = utilitario_clientes:compare_chave(cidade, CidadeDigitado, Cliente),
    EstadoEditado = utilitario_clientes:compare_chave(estado, EstadoDigitado, Cliente),
    CepEditado = utilitario_clientes:compare_chave(cep, CepDigitado, Cliente),
    EmailEditado = utilitario_clientes:compare_chave(email, EmailDigitado, Cliente),
    Email2Editado = utilitario_clientes:compare_chave(email2, Email2Digitado, Cliente),
    TelefoneEditado = utilitario_clientes:compare_chave(telefone, TelefoneDigitado, Cliente),
    Telefone2Editado = utilitario_clientes:compare_chave(telefone2, Telefone2Digitado, Cliente),
    io:format("~n"),
    io:format("EDIÇÃO FEITA COM SUCESSO!"),
    io:format("~n"),

    [{nome, NomeEditado}, {idade, IdadeEditado}, {data, DataEditado}, {mae, MaeEditado}, {cpf, CpfEditado}, {cidade, CidadeEditado}, {estado, EstadoEditado}, {cep, CepEditado}, {email, EmailEditado}, {email2, Email2Editado}, {telefone, TelefoneEditado}, {telefone2, Telefone2Editado}, {renda, RendaEditado}, {genero, GeneroEditado}, {escolaridade, EscolaridadeEditado}].


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
    io:format("Idade: ~p~n", [utilitario_clientes:get_value(idade, Cliente)]),
    io:format("Data Nascimento: ~p~n", [utilitario_clientes:get_value(data, Cliente)]),
    io:format("Nome da Mãe: ~p~n", [utilitario_clientes:get_value(mae, Cliente)]),
    io:format("CPF: ~p~n", [utilitario_clientes:get_value(cpf, Cliente)]),
    io:format("Cidade: ~p~n", [utilitario_clientes:get_value(cidade, Cliente)]),
    io:format("Estado: ~p~n", [utilitario_clientes:get_value(estado, Cliente)]),
    io:format("Cep: ~p~n", [utilitario_clientes:get_value(cep, Cliente)]),
    io:format("Genero: ~p~n", [get_desc_genero(utilitario_clientes:get_value(genero, Cliente))]),
    io:format("Escolaridade: ~p~n", [get_desc_escolaridade(utilitario_clientes:get_value(escolaridade, Cliente))]),
    io:format("Renda: ~p~n", [utilitario_clientes:get_value(renda, Cliente)]),
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



media_idade(Clientes) ->
    SomaIdades = soma_idades(Clientes),
    QtdePessoas = qtde_pessoas(Clientes),
    case QtdePessoas == 0 of
        true -> 0;
        _ -> SomaIdades / QtdePessoas
    end.

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

media_salario(Clientes) ->
    media_salario(Clientes, 0.00, 0).


media_salario([], _SomaSalarios, QtClients) when QtClients =< 0 ->
    0;
media_salario([], SomaSalarios, QtClients) when QtClients > 0 ->
    SomaSalarios/QtClients;
media_salario([Cliente|Clientes], SomaSalarios, QtClients) ->
    Salario = utilitario_clientes:get_value(renda, Cliente),
    media_salario(Clientes, SomaSalarios + Salario, QtClients+1).


total_escolaridade(Clientes) ->
    total_escolaridade(Clientes, [{?ESCOLARIDADE_ANALFABETO, 0}, {?ESCOLARIDADE_ENSINO_BASICO, 0}, {?ESCOLARIDADE_ENSINO_MEDIO, 0}, {?ESCOLARIDADE_MEDIO_COMPLETO, 0}, {?ESCOLARIDADE_POS_GRADUACAO, 0}, {?ESCOLARIDADE_MESTRADO, 0}, {?ESCOLARIDADE_DOUTORADO, 0}, {?ESCOLARIDADE_PHD, 0}]).

total_escolaridade([], Acc) ->
    Acc;
total_escolaridade([Cliente|Clientes], Acc) ->
    Esc = utilitario_clientes:get_value(escolaridade, Cliente),
    EscAcc = utilitario_clientes:get_value(Esc, Acc),
    Acc2 = replace_valor(Esc, EscAcc+1, Acc),
total_escolaridade(Clientes, Acc2).



total_genero(Clientes) ->
    total_genero(Clientes, [{?GENERO_MASCULINO, 0}, {?GENERO_FEMININO, 0}, {?GENERO_INDEFINIDO, 0}]).

total_genero([], Acc) ->
    Acc;
total_genero([Cliente|Clientes], Acc) ->
    Esc = utilitario_clientes:get_value(genero, Cliente),
    EscAcc = utilitario_clientes:get_value(Esc, Acc),
    Acc2 = replace_valor(Esc, EscAcc+1, Acc),
total_genero(Clientes, Acc2).


lista_escolaridade(Clientes) ->
    TotalEsc = total_escolaridade(Clientes),
    io:format("TOTAl ~p = ~p~n", [?ESCOLARIDADE_ANALFABETO_DESC, utilitario_clientes:get_value(?ESCOLARIDADE_ANALFABETO, TotalEsc)]),
    io:format("TOTAl ~p = ~p~n", [?ESCOLARIDADE_ENSINO_BASICO_DESC, utilitario_clientes:get_value(?ESCOLARIDADE_ENSINO_BASICO, TotalEsc)]),
    io:format("TOTAL ~p = ~p~n", [?ESCOLARIDADE_ENSINO_MEDIO_DESC, utilitario_clientes:get_value(?ESCOLARIDADE_ENSINO_MEDIO, TotalEsc)]),
    io:format("TOTAL ~p = ~p~n", [?ESCOLARIDADE_MEDIO_COMPLETO_DESC, utilitario_clientes:get_value(?ESCOLARIDADE_MEDIO_COMPLETO, TotalEsc)]),
    io:format("TOTAL ~p = ~p~n", [?ESCOLARIDADE_POS_GRADUACAO_DESC, utilitario_clientes:get_value(?ESCOLARIDADE_POS_GRADUACAO, TotalEsc)]),
    io:format("TOTAL ~p = ~p~n", [?ESCOLARIDADE_MESTRADO_DESC, utilitario_clientes:get_value(?ESCOLARIDADE_MESTRADO, TotalEsc)]),
    io:format("TOTAL ~p = ~p~n", [?ESCOLARIDADE_DOUTORADO_DESC, utilitario_clientes:get_value(?ESCOLARIDADE_DOUTORADO, TotalEsc)]),
    io:format("TOTAL ~p = ~p~n", [?ESCOLARIDADE_PHD_DESC, utilitario_clientes:get_value(?ESCOLARIDADE_PHD, TotalEsc)]).


lista_genero(Clientes) ->
    TotalGenero = total_genero(Clientes),
    io:format("TOTAl ~p = ~p~n", [?GENERO_MASCULINO_DESC, utilitario_clientes:get_value(?GENERO_MASCULINO, TotalGenero)]),
    io:format("TOTAl ~p = ~p~n", [?GENERO_FEMENINO_DESC, utilitario_clientes:get_value(?GENERO_FEMININO, TotalGenero)]),
    io:format("TOTAL ~p = ~p~n", [?GENERO_INDEFINIDO_DESC, utilitario_clientes:get_value(?GENERO_INDEFINIDO, TotalGenero)]).



mostra_estatistica_genero(Clientes) ->
    {M, F, N} = divide_lista(Clientes),
    Masc =  media_idade(M),
    io:format("Media De Idade Masculino: ~p~n", [Masc]),
    Fem =  media_idade(F),
    io:format("Media de Idade Feminina: ~p~n", [Fem]),
    Neu =  media_idade(N),
    io:format("Media de Idade Neutra: ~p~n", [Neu]).


mostra_estatistica_salario(Clientes) ->
    {M, F, N} = divide_lista(Clientes),
    Masc = media_salario(M),
    io:format("Media Salarial MASCULINA: ~p~n", [Masc]),
    Fem = media_salario(F),
    io:format("Media Salarial FEMININA: ~p~n", [Fem]),
    Neu = media_salario(N),
    io:format("Media Salarial NEUTROS: ~p~n", [Neu]).



divide_lista(Clientes) ->
    divide_lista(Clientes, {[], [], []}).

divide_lista([], Acc) ->
    Acc;
divide_lista([Cliente|Clientes], Acc) ->
    Genero = utilitario_clientes:get_value(genero, Cliente),
    Acc1 = coloca_na_lista_correta(Genero, Cliente, Acc),
    divide_lista(Clientes, Acc1).

    coloca_na_lista_correta(?GENERO_MASCULINO, Cliente, {M, F, N}) ->
        {[Cliente | M], F, N};
    coloca_na_lista_correta(?GENERO_FEMININO, Cliente, {M, F, N}) ->
        {M, [Cliente|F], N};
    coloca_na_lista_correta(?GENERO_INDEFINIDO, Cliente, {M, F, N}) ->
        {M, F, [Cliente|N]};
    coloca_na_lista_correta(_, _Cliente, _Acc) ->
        {error, not_found}.


















