-module(cadastros).
-export([clients/0,
        register_client/1,
        delete_client/2,
        take_value/1,
        list_clients/1,
        list/1,
        get_value/2,
        get_desc_escolaridade/1,
        get_desc_gen/1,
        valida_float/1,
        valida_int/1,
        edit_client/2]).

-define(ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO, 1).
-define(ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO_DESC, "Incomplete elementary school " ).
-define(ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO, 2).
-define(ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO_DESC, "Complete elementary school ").
-define(ESCOLARIDADE_ENS_MEDIO_COMPLETO, 3).
-define(ESCOLARIDADE_ENS_MEDIO_COMPLETO_DESC, "Complete high school").
-define(ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO, 4).
-define(ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO_DESC, "Incomplete higher school").
-define(ESCOLARIDADE_ENS_SUPERIOR_COMPLETO, 5).
-define(ESCOLARIDADE_ENS_SUPERIOR_COMPLETO_DESC,"Complete higher school" ).
-define(ESCOLARIDADE_POS_GRADUACAO, 6).
-define(ESCOLARIDADE_POS_GRADUACAO_DESC, "Postgraduate").
-define(ESCOLARIDADE_MESTRADO, 7).
-define(ESCOLARIDADE_MESTRADO_DESC, "Master s degree").
-define(ESCOLARIDADE_DOUTORADO, 8).
-define(ESCOLARIDADE_DOUTORADO_DESC,"Doctorate degree").
-define(ESCOLARIDADE_PHD, 9).
-define(ESCOLARIDADE_PHD_DESC, "PhD").

-define(GENERO_MASCULINO, 1).
-define(GENERO_MASCULINO_DESC, "Masculine").
-define(GENERO_UNDEFINED, 3).
-define(GENERO_UNDEFINED_DESC, "not informed gender").
-define(GENERO_FEMININO, 2).
-define(GENERO_FEMININO_DESC, "Femenine").


get_desc_escolaridade(?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO) ->
    ?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO) ->
    ?ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_ENS_MEDIO_COMPLETO) ->
    ?ESCOLARIDADE_ENS_MEDIO_COMPLETO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO) ->
    ?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO)  ->
    ?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_POS_GRADUACAO) ->
    ?ESCOLARIDADE_POS_GRADUACAO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_MESTRADO) ->
    ?ESCOLARIDADE_MESTRADO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_DOUTORADO) ->
    ?ESCOLARIDADE_DOUTORADO_DESC;
get_desc_escolaridade(?ESCOLARIDADE_PHD) ->
    ?ESCOLARIDADE_PHD_DESC.

get_desc_gen(GENERO_MASCULINO) ->
    ?GENERO_MASCULINO_DESC;
get_desc_gen(GENERO_FEMININO) ->
    ?GENERO_FEMININO_DESC;
get_desc_gen(GENERO_UNDEFINED) ->
    ?GENERO_UNDEFINED_DESC.


clients() ->
        [
            [{id, 1}, {name, "Alvaro"}, {age, 37},{data, "12/12/1984"}, {mom, "Solange"}, {cpf, "05333444344"}, {cidade, "Xanxere"}, {estado, "SC"}, {cep, "89802230"}, {renda, 30330.90}, {esc, 6}, {genero,1}, {contatos, []}],
            [{id, 2}, {name, "Juliano"}, {age, 20}, {data, "0/0/0"}, {mom, "Ivete Rodrigues"}, {cpf, "13203618974"}, {cidade, "Chapeco"}, {estado, "SC"}, {cep, "8198012210"},{renda, 2000.90}, {esc, ?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO}, {genero, ?GENERO_MASCULINO}, {contatos, []}],
            [{id, 3}, {name, "Larissa"}, {age, 19}, {data, "12/10/2001"}, {mom, "Leticia Hoffmann Mones"}, {cpf, "05333444344"}, {cidade, "Chapeco"}, {estado, "sc"}, {cep, "89802230"},{renda, 20000.90}, {esc, ?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO}, {genero, ?GENERO_FEMININO},
                {contatos,[
                                [{email, <<"larissa.bedin@abensoft.com.br"/utf8>>}, {celular, "49984088401"}],
                                [{email, <<"larissamones12@gmail.com.br"/utf8>>}, {celular, "49988864308"}]
                    ]
                }],
            [{id, 4}, {name, "Leandro"}, {age, 18}, {data, "0/0/0"}, {mom, "unknown"}, {cpf, "05333444344"}, {cidade, "Chapeco"}, {estado, "SC"}, {cep, "89802230"}, {renda, 0.0}, {esc, ?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO}, {genero,?GENERO_UNDEFINED},{contatos, []}],

            [{id, 6}, {name, "Leticia"}, {age, 48}, {data, "07/09/1973"}, {mom, "Alvia"}, {cpf, "05333444344"}, {cidade, "Montevideo"}, {estado, "SC"}, {cep, "89802230"},{renda, 2500.45}, {esc, ?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO}, {genero, ?GENERO_FEMININO}, {contatos, []}],
            [{id, 7}, {name, "Julio"}, {age, 57}, {data, "22/11/1964"}, {mom, "Nilva"}, {cpf, "05333444344"}, {cidade, "chapeco"}, {estado, "SC"}, {cep, "89802230"},{renda, 12200.20}, {esc, ?ESCOLARIDADE_POS_GRADUACAO}, {genero, ?GENERO_MASCULINO}, {contatos, []}],
            [{id, 8}, {name, "Silvio"}, {age, 68}, {data, "22/11/1900"}, {mom, "Dolores"}, {cpf, "05333444344"}, {cidade, "Xanxere"}, {estado, "SC"}, {cep, "89802230"},{renda, 2200.20}, {esc, ?ESCOLARIDADE_DOUTORADO}, {genero, ?GENERO_MASCULINO}, {contatos, []}],
            [{id, 9}, {name, "Edward"}, {age, 19}, {data, "22/11/1800"}, {mom, "unknown"}, {cpf, "05333444344"}, {cidade, "palmitos"}, {estado, "SC"}, {cep, "89802230"},{renda, 3200.20}, {esc, ?ESCOLARIDADE_PHD}, {genero, ?GENERO_MASCULINO}, {contatos, []}],

            [{id, 5}, {name, "Luisa"}, {age, 28}, {data, "0/0/0"}, {mom, "unknown"}, {cpf, "05333444344"}, {cidade, "Chapeco"}, {estado, "SC"}, {cep, "89802230"},{renda, 3556.45}, {esc, ?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO}, {genero, ?GENERO_FEMININO},{contatos, []}]

        ].

%%%%%%%%%%%FUNÇÕES UTILITARIAS %%%%%%%%%%
%Aqui estarão todas as funçoes nao declaradas mas que são chamadas dentro do codigo%

take_value(Msg) ->
    string:strip(io:get_line(Msg), right, $\n).

valida_str(Value) ->
    unicode:characters_to_binary(Value).

valida_float(Value) when
    is_float(Value) ->
    Value;
valida_float(Value) ->
    list_to_float(Value).

valida_int(Numbers) when
    is_integer(Numbers) ->
    Numbers;
valida_int(Numbers) ->
    list_to_integer(Numbers).

%pega valor no arrey de empreendimentos
% Chave == Atomo
get_value(_, []) ->
    [];
get_value(Chave, [{Chave, Valor} | _OutrasPropriedades]) ->
   Valor;
get_value(Chave, [_|Resto]) ->
    get_value(Chave, Resto).

replace_valor(Chave, NovoValor, Proplist) ->
    replace_valor(Chave, NovoValor, Proplist, []).

replace_valor(_Chave, _NovoValor, [], Acc) ->
    Acc;
replace_valor(Chave, NovoValor, [{Chave, _Valor} | RestoProplist], Acc) ->
    lists:merge3([{Chave, NovoValor}], RestoProplist, Acc);
replace_valor(Chave, NovoValor, [X | RestoProplist], Acc) ->
    replace_valor(Chave, NovoValor, RestoProplist, [X|Acc]).

add_contact(Client) ->
    EmailAdd = take_value("EMAIL: "),
    CelAdd = take_value("PHONE: "),
    TelefoneOk = valida_int(CelAdd),
    EmailOk = valida_str(EmailAdd),
    NewContato = [{email, EmailOk}, {celular, TelefoneOk}],
    ListContacts = get_value(contatos, Client),
    replace_valor(contatos, [NewContato|ListContacts], Client).

% adiciona uma nova id com base na maior id
get_newid(Clients) ->
    get_newid(Clients, 0).
get_newid([], Max) ->
    Max+1;
get_newid([Client|Clients], Max) ->
    IdAtual =  get_value(id, Client),
    NovoMax = case Max < IdAtual of
            true -> IdAtual;
            _ -> Max
    end,
    get_newid(Clients, NovoMax).

mostra_cond(undefined, _) ->
    ok;
mostra_cond(Valor, Campo) ->
    io:format("~p, : ~p~n", [Campo, Valor]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
register_client(Clients) ->
    io:format("=================================================================~n"),
    io:format(" PLEASE INFORM YOUR:~n"),
    NameAdd = take_value("NAME: "),
    AgeAdd = take_value("AGE: " ),
    DateAdd = take_value("BIRTHDATE: "),
    MomAdd = take_value("MOTHER S NAME: "),
    CpfAdd = take_value("CPF: "),
    CidadeAdd = take_value("CITY YOU WERE BORN: "),
    EstadoAdd = take_value("STATE YOU LIVE: "),
    CepAdd = take_value("CEP: "),
    RendaAdd = valida_float(take_value("INCOME:" )), %% como receber um float?
    io:format(["type (1) for: ", ?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO_DESC, ": ~n"]),
    io:format("type (2) for: COMPLETE ELEMENTARY SCHOOL ~n "),
    io:format("type (3) for: COMPLETE HIGH SCHOOL~n"),
    io:format("type (4) for: INCOMPLETE HIGHER EDUCATION~n "),
    io:format("type (5) for: COMPLETE HIGHER EDUCATION~n "),
    io:format("type (6) for: POSTGRADUATE~n"),
    io:format("type (7) for: MASTER S DEGREE~n"),
    io:format("type (8) for: DOCTORATE DEGREE~n"),
    io:format("type (9) for: PHD~n"),
    EscAdd = valida_int(take_value(" -> scholarity: ")),
    io:format("type (1) for masculine~n"),
    io:format("type (2) for femenine~n"),
    io:format("type (3) if you do not know~n"),
    GenAdd = valida_int(take_value(" -> Gender: ")),
    io:format("=================================================================~n"),
    CidadeOk = valida_str(CidadeAdd),
    EstadoOk = valida_str(EstadoAdd),
    AgeOk = valida_int(AgeAdd),
    IdOk = get_newid(Clients),
    RendaOk = valida_float(RendaAdd),
    EscOk = valida_int(EscAdd),
    GenOk = valida_int(GenAdd),


    Cliente = [
        [{id, IdOk}, {name, NameAdd}, {age, AgeOk}, {data, DateAdd}, {mom, MomAdd}, {cpf, CpfAdd}, {cidade, CidadeOk },{estado, EstadoOk}, {cep, CepAdd}, {renda, RendaOk},{esc, EscOk}, {genero, GenOk}, {contatos, []}]| Clients
    ],
    ContactsAsk = take_value("would you like to add some email adress or phone number  Y/N : "),
    case ContactsAsk == "Y" of
            true -> add_contact(Cliente);
            _ -> Cliente
    end.

edit_client(Clients, Id) ->
    edit_client(Clients, Id, []).

edit_client([], _Id, Acc) ->
    Acc;
edit_client([Client|Clients], Id, Acc) ->
    PessoaId = get_value(id, Client),
    PessoaEditado = case Id == PessoaId of
        true -> update_client(Client);
         _ -> Client
    end,
    edit_client(Clients, Id, [PessoaEditado|Acc]).

update_client(Client) ->
    io:format("=========================================================================================~n"),
    io:format("-> ~n"),
    io:format("PLEASE: if you re not going to edit anything, rewrite all the old info, or it s  going to be empty....~n~n"),
    NameInput = take_value(["New Name (", get_value(name, Client) , "): "]),
    AgeInput = take_value(["New Age (", integer_to_list(get_value(age, Client)) , "): " ]),
    DateInput = take_value(["New Date (", get_value(data, Client) , "): "]),
    MomInput = take_value(["New Mother (", get_value(mom, Client) , "): "]),
    CpfInput  = take_value(["New CPF (",  get_value(cpf, Client),"): "]),
    CityInput = take_value(["New City (", get_value(cidade, Client) , "): "]),
    StateInput = take_value(["New State (", get_value(estado, Client) , "): "]),
    CepInput  = take_value(["New CEP (", get_value(cep, Client), "): "]),
    RendaInput  = valida_float(take_value("New INCOME (-): ")),
    io:format(["type (1) for INCONPLETE ELEMENTARY SCHOOL : ~n"]),
    io:format("type (2) for: COMPLETE ELEMENTARY SCHOOL ~n "),
    io:format("type (3) for: COMPLETE HIGH SCHOOL~n"),
    io:format("type (4) for: INCOMPLETE HIGHER EDUCATION~n "),
    io:format("type (5) for: COMPLETE HIGHER EDUCATION~n "),
    io:format("type (6) for: POSTGRADUATE~n"),
    io:format("type (7) for: MASTER S DEGREE~n"),
    io:format("type (8) for: DOCTORATE DEGREE~n"),
    io:format("type (9) for: PHD~n"),
    EscAdd = take_value(["New scholarity (", integer_to_list(get_value(esc, Client)) , "): " ]),
    io:format("type (1) for masculine~n"),
    io:format("type (2) for femenine~n"),
    io:format("type (3) if you do not know~n"),
    GenAdd = take_value(["New Gender (",integer_to_list(get_value(genero, Client)), "):  "]),
    GenOk = valida_int(GenAdd),
    EscOk = valida_int(EscAdd),
    AgeOk = valida_int(AgeInput),
    IdOk = get_value(id, Client),
    F =  fun (Contato) ->
        EmailInput = take_value(["New email (", get_value(email, Contato) , "): "]),
        CelInput = take_value(["New phone number (", get_value(celular, Contato), "): "]),
        [{email, EmailInput}, {celular, CelInput}]
     end,
     Contatos = get_value(contatos, Client),
     ListContacts = lists:map(F, Contatos),
    io:format("=========================================================================================~n"),
    [{id, IdOk}, {name, NameInput},{age, AgeOk}, {data, DateInput}, {mom, MomInput},{cpf, CpfInput}, {cidade, CityInput}, {estado, StateInput}, {cep, CepInput}, {renda, RendaInput}, {esc, EscOk}, {genero, GenOk}, {contatos, ListContacts}].


delete_client(Clients, Id) ->
     N = fun(Client) ->
            IdClient = valida_int(get_value(id, Client)),
            (IdClient /= Id )
            %se retornar falso remove da lista, ou seja se o id for encontrado na lista for igual ao pedido ele ira excluir
        end,
     lists:filter(N, Clients).

list_clients(Clients) ->
    list_clients(Clients, []).

list_clients([], Acc) ->
    lists:reverse(Acc);
list_clients([Client|Clients], Acc) ->
    list(Client),
    list_clients(Clients, [Client|Acc]).

list(Client) ->
        io:format("~n"),
        io:format("=================================================================~n"),
        io:format("CLIENT ID: ~p~n",       [get_value(id, Client)]),
        io:format("NAME: ~p~n",       [get_value(name, Client)]),
        io:format("AGE: ~p~n",         [get_value(age, Client)]),
        io:format("BIRTHDATE: ~p~n",       [get_value(data, Client)]),
        io:format("MOTHER S NAME: ~p~n",       [get_value(mom, Client)]),
        io:format("CPF: ~p~n",       [get_value(cpf, Client)]),
        io:format("CITY: ~p~n",       [get_value(cidade, Client)]),
        io:format("STATE: ~p~n",                [get_value(estado, Client)]),
        io:format("CEP: ~p~n",       [get_value(cep, Client)]),
        io:format("INCOME: ~f~n",    [get_value(renda, Client)]),
        io:format("SCHOOLING: ~p~n", [get_desc_escolaridade(get_value(esc, Client))]),
        io:format("GENDER: ~p~n", [get_desc_gen(get_value(genero, Client))]),

     F = fun (Contatos) ->
        ConfirmaEmail = get_value(email, Contatos),
        ConfirmaCel = get_value(celular, Contatos),
        mostra_cond(ConfirmaEmail, "EMAIL:"),
        mostra_cond(ConfirmaCel, "PHONE:"),
        io:format("=================================================================~n")
    end,
    Contacts = get_value(contatos, Client),
    lists:map(F, Contacts),
    Client.




