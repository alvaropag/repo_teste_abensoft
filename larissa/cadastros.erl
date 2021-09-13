-module(cadastros).
-export([clients/0,
        register_client/1,
        delete_client/2,
        take_value/1,
        list_clients/1,
        list/1,
        valida_int/1,
        edit_client/2]).

clients() ->
        [
            [{id, 1}, {name, "Alvaro"}, {data, "12/12/1984"}, {mom, "Solange"}, {cpf, "05333444344"}, {cidade, "Xanxere"}, {estado, "SC"}, {cep, "89802230"}, {contatos, []}],
            [{id, 2}, {name, "Juliano"}, {data, "0/0/0"}, {mom, "Ivete Rodrigues"}, {cpf, "13203618974"}, {cidade, "Chapeco"}, {estado, "SC"}, {cep, "8198012210"}, {contatos, []}],
            [{id, 3}, {name, "Larissa"}, {data, "12/10/2001"}, {mom, "Leticia Hoffmann Mones"}, {cpf, "05333444344"}, {cidade, "Chapeco"}, {estado, "sc"}, {cep, "89802230"},
                {contatos,[
                                [{email, <<"larissa.bedin@abensoft.com.br"/utf8>>}, {celular, "49984088401"}],
                                [{email, <<"larissamones12@gmail.com.br"/utf8>>}, {celular, "49988864308"}]
                    ]
                }],
            [{id, 4}, {name, "Leandro"}, {data, "0/0/0"}, {mom, "unknown"}, {cpf, "05333444344"}, {cidade, "Chapeco"}, {estado, "SC"}, {cep, "89802230"}, {contatos, []}]

        ].

%%%%%%%%%%%FUNÇÕES UTILITARIAS %%%%%%%%%%
%Aqui estarão todas as funçoes nao declaradas mas que são chamadas dentro do codigo%
take_value(Msg) ->
    string:strip(io:get_line(Msg), right, $\n).

valida_str(Value) ->
    unicode:characters_to_binary(Value).


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
    DateAdd = take_value("BIRTHDATE: "),
    MomAdd = take_value("MOTHER S NAME: "),
    CpfAdd = take_value("CPF: "),
    CidadeAdd = take_value("CITY YOU WERE BORN: "),
    EstadoAdd = take_value("STATE YOU LIVE: "),
    CepAdd = take_value("CEP: "),
    io:format("=================================================================~n"),
    CidadeOk = valida_str(CidadeAdd),
    EstadoOk = valida_str(EstadoAdd),
    CpfOk = valida_int(CpfAdd),
    CepOk = valida_int(CepAdd),
    IdOk = get_newid(Clients),

    Cliente = [
        [{id, IdOk},{name, NameAdd}, {data, DateAdd}, {mom, MomAdd}, {cpf, CpfOk}, {cidade, CidadeOk },{estado, EstadoOk}, {cep, CepOk}, {contatos, []}]| Clients
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
    io:format("id encontrada = ~p  id requisitada = ~p~n", [PessoaId, Id]),
    PessoaEditado = case Id == PessoaId of
        true -> update_client(Client);
        _ -> Client
    end,
    edit_client(Clients, Id, [PessoaEditado|Acc]).

update_client(Client) ->
    io:format("=========================================================================================~n"),
    io:format("~p ~p~n", ["Editando:", get_value(id, Client)]),
    io:format("<<<<<<<<<You can t edit your Id>>>>>>>>>~n"),
    io:format("PLEASE: if you re not going to edit anything, rewrite all the old info, or it s  going to be empty....~n"),
    NameInput = take_value(["New Name (", get_value(name, Client) , "): "]),
    DateInput = take_value(["New Date (", get_value(data, Client) , "): "]),
    MomInput = take_value(["New Mother (", get_value(mom, Client) , "): "]),
    CpfInput  = take_value(["New CPF (",  get_value(cpf, Client),"): "]),
    CityInput = take_value(["New City (", get_value(cidade, Client) , "): "]),
    StateInput = take_value(["New State (", get_value(estado, Client) , "): "]),
    CepInput  = take_value(["New CEP (", get_value(cep, Client), "): "]),
    F =  fun (Contato) ->
        EmailInput = take_value(["New email (", get_value(email, Contato) , "): "]),
        CelInput = take_value(["New phone number (", get_value(celular, Contato), "): "]),
        [{email, EmailInput}, {celular, CelInput}]
     end,
     Contatos = get_value(contatos, Client),
     ListContacts = lists:map(F, Contatos),
    io:format("=========================================================================================~n"),
    [{name, NameInput}, {data, DateInput}, {mom, MomInput},{cpf, CpfInput}, {cidade, CityInput}, {estado, StateInput}, {cep, CepInput},  {contatos, ListContacts}].


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
        io:format("BIRTHDATE: ~p~n",       [get_value(data, Client)]),
        io:format("MOTHER S NAME: ~p~n",       [get_value(mom, Client)]),
        io:format("CPF: ~p~n",       [get_value(cpf, Client)]),
        io:format("CITY: ~p~n",       [get_value(cidade, Client)]),
        io:format("STATE: ~p~n",                [get_value(estado, Client)]),
        io:format("CEP: ~p~n",       [get_value(cep, Client)]),
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




