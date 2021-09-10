-module(cadastros).
-export([clients/0,
        register_client/1,
        delete_client/2,
        list_clients/1,
        edit_client/2]).

clients() ->
        [
            [{id, 1}, {name, "Alvaro"}, {data, "12/12/1984"}, {mom, "Solange"}, {cpf, 05333444344}, {cidade, "Xanxere"}, {estado, "SC"}, {cep, 89802230}, {contatos, []}],
            [{id, 2}, {name, "Juliano"}, {data, "0/0/0"}, {mom, "Ivete Rodrigues"}, {cpf, 13203618974}, {cidade, "Chapeco"}, {estado, "SC"}, {cep, 8198012210}, {contatos, []}],
            [{id, 3}, {name, "Larissa"}, {data, "12/10/2001"}, {mom, "Leticia Hoffmann Mones"}, {cpf, 05333444344}, {cidade, "Chapeco"}, {estado, "sc"}, {cep, 89802230},
                {contatos,[
                                [{email, <<"larissa.bedin@abensoft.com.br"/utf8>>}, {celular, 49984088401}],
                                [{email, <<"larissamones12@gmail.com.br"/utf8>>}, {celular, 49988864308}]
                    ]
                }],
            [{id, 4}, {name, "Leandro"}, {data, "0/0/0"}, {mom, "unknown"}, {cpf, 05333444344}, {cidade, "Chapeco"}, {estado, "SC"}, {cep, 89802230}, {contatos, []}]

        ].

%%%%%%%%%%%FUNÇÕES UTILITARIAS %%%%%%%%%%
%Aqui estarão todas as funçoes nao declaradas mas que são chamadas dentro do codigo%
take_value(Msg) ->
    string:strip(io:get_line(Msg), right, $\n).

valida_str(Value) ->
    unicode:characters_to_binary(Value).

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
    NewContato = [{email, EmailAdd}, {celular, TelefoneOk}],
    ListContacts = get_value(contatos, Client),
    replace_valor(contatos, [NewContato|ListContacts], Client).

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
register_client(Clients) ->
    io:format("================================================================="),
    io:format(" PLEASE INFORM YOUR:"),
    NameAdd = take_value("NAME: "),
    DateAdd = take_value("BIRTHDATE: "),
    MomAdd = take_value("MOTHER S NAME: "),
    CpfAdd = take_value("CPF: "),
    CidadeAdd = take_value("CITY YOU BORN: "),
    EstadoAdd = take_value("STATE YOU LIVE: "),
    CepAdd = take_value("CEP: "),

    io:format("================================================================="),
    CidadeOk = valida_str(CidadeAdd),
    EstadoOk = valida_str(EstadoAdd),
    CpfOk = valida_int(CpfAdd),
    CepOk = valida_int(CepAdd),
    IdOk = get_newid(Clients),

    Cliente = [
        [{id, IdOk},{name, NameAdd}, {data, DateAdd}, {mom, MomAdd}, {cpf, CpfOk}, {cidade, CidadeOK },{estado, EstadoOk}, {cep, CepOk}, {contatos, []}]
    ],
    ContactsAsk = take_value("would you like to add some email adress or phone number  Y/N : "),
    case ContactsAsk == "Y" of
            true -> add_contact(Cliente);
            _ -> Cliente
    end,

list_clients(Clients) ->
%listar apenas clientes que cadastraram email e telefone
    ok.

edit_client(Clients, Id) ->
    edit_client(Clients, Id, []).

edit_client([], _Id, Acc) ->
    Acc;
edit_client([Pessoa|Pessoas], Id, Acc) ->
    PessoaId = get_value(id, Pessoa),
    io:format("NomeEmp = ~p  Nome = ~p~n", [PessoaId, Id]),
    PessoaEditado = case Id == PessoaId of
        true -> update_client(Pessoa);
        _ -> Pessoa
    end,
    edit_client(Clients, Id, [PessoaEditado|Acc]).

update_client(Client) ->
    io:format("=========================================================================================~n"),
    io:format("~p ~p~n", ["Editando:", get_value(id, Client)]),
    io:format("<<<<<<<<<You can t edit your Id>>>>>>>>>~n"),
    io:format("PLEASE: if you re not going to edit anything, rewrite all the old info, or it s  going to be empty.......... our sistem is crippled for now  >.<~n"),
    NameInput = take_value(["New Name (", get_value(name, Client) , "): "]),
    DateInput = take_value(["New Date (", get_value(data, Client) , "): "]),
    MomInput = take_value(["New Mother (", get_value(mom, Client) , "): "]),
    CpfInput  = take_value(["New CPF (",  valida_int(get_value(cpf, Client)),"): "]),
    CityInput = take_value(["New City (", get_value(cidade, Client) , "): "]),
    StateInput = take_value(["New State (", get_value(estado, Client) , "): "]),
    CepInput  = take_value(["New CEP (", valida_int(get_value(cep, Client)), "): "]),
    io:format("=========================================================================================~n"),

    %Listacontatos = get_value(contatos, Client),
    [{name, NameInput}, {data, RuaOk}, {mom, MomInput},{cpf, CpfInput}, {cidade, CityInput}, {estado, StateInput}, {cep, CepInput},  {contatos, Listacontatos}].



delete_client(Clients, Id) ->

     N = fun(Clients) ->
            IdDelet = io:get_line("Digite o ID do cliente que deseja excluir: "),
            Id = get_value(id, Clients),
            (IdDelet /= Id )
            %se retornar falso remove da lista, ou seja se o id for encontrado na lista for igual ao pedido ele ira excluir
        end,
     lists:filter(N, Clients).



