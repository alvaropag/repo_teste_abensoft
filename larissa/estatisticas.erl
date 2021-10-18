-module(estatisticas).
-export([ media_salario/1,
        media_age/1,
        total_escolaridade/1,
        divide_lista/2,
        list_estatisticas_por_genero/1,
        list_estatisticas/1]).

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



list_estatisticas(Clients) ->

    io:format("AVERAGE AGE:   ~p~n", [media_age(Clients)]),
    io:format("AVERAGE INCOME:"),
    io:format("~f~n", [media_salario(Clients)]),
    TotalEsc = total_escolaridade(Clients),
    TotalGen = total_genero(Clients),
    io:format("=========================================================================================================~n"),
    io:format("       >>> SCHOOLING TOTALITY <<<~n~n"),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_MEDIO_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_MEDIO_COMPLETO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_POS_GRADUACAO_DESC, cadastros:get_value(?ESCOLARIDADE_POS_GRADUACAO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_MESTRADO_DESC, cadastros:get_value(?ESCOLARIDADE_MESTRADO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_DOUTORADO_DESC, cadastros:get_value(?ESCOLARIDADE_DOUTORADO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_PHD_DESC, cadastros:get_value(?ESCOLARIDADE_PHD, TotalEsc)]),
    io:format("=========================================================================================================~n"),
    io:format("       >>> GENDER  TOTALITY <<<~n~n"),
    io:format("~p = ~p~n", [?GENERO_MASCULINO_DESC, cadastros:get_value(?GENERO_MASCULINO, TotalGen)]),
    io:format("~p = ~p~n", [?GENERO_FEMININO_DESC, cadastros:get_value(?GENERO_FEMININO, TotalGen)]),
    io:format("~p = ~p~n", [?GENERO_UNDEFINED_DESC, cadastros:get_value(?GENERO_UNDEFINED, TotalGen)]),
    io:format("=========================================================================================================~n").



list_estatisticas_por_genero(Clients) ->
    {M, U, F} = divide_lista(Clients),
    io:format("================================================~n"),
    io:format("      <<< STATISTICS  FOR GENDER >>>           ~n"),
    io:format("AVERAGE MAN AGE:   ~p~n", [media_age(M)]),
    io:format("AVERAGE  WOMAN AGE:   ~p~n", [media_age(F)]),
    io:format("AVERAGE  UNDEFINED GENDER AGE:   ~p~n", [media_age(U)]),
    io:format("================================================~n"),
    io:format("AVERAGE MAN INCOME:"),
    io:format("~f~n", [media_salario(M)]),

    io:format("AVERAGE WOMAN INCOME:"),
    io:format("~f~n", [media_salario(F)]),
    io:format("AVERAGE UNDEFINED GENDER INCOME:"),
    io:format("~f~n", [media_salario(U)]),
    io:format("================================================~n"),
    io:format("    >>> MEN  SCHOOLING TOTALITY <<<~n~n"),
    TotalEsc = total_escolaridade(M),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_MEDIO_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_MEDIO_COMPLETO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_POS_GRADUACAO_DESC, cadastros:get_value(?ESCOLARIDADE_POS_GRADUACAO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_MESTRADO_DESC, cadastros:get_value(?ESCOLARIDADE_MESTRADO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_DOUTORADO_DESC, cadastros:get_value(?ESCOLARIDADE_DOUTORADO, TotalEsc)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_PHD_DESC, cadastros:get_value(?ESCOLARIDADE_PHD, TotalEsc)]),
    io:format("=========================================================================================================~n"),
    io:format("    >>> WOMAN SCHOOLING TOTALITY <<<~n~n"),
    TotalEsc1 = total_escolaridade(M),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO, TotalEsc1)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO, TotalEsc1)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_MEDIO_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_MEDIO_COMPLETO, TotalEsc1)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO, TotalEsc1)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO, TotalEsc1)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_POS_GRADUACAO_DESC, cadastros:get_value(?ESCOLARIDADE_POS_GRADUACAO, TotalEsc1)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_MESTRADO_DESC, cadastros:get_value(?ESCOLARIDADE_MESTRADO, TotalEsc1)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_DOUTORADO_DESC, cadastros:get_value(?ESCOLARIDADE_DOUTORADO, TotalEsc1)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_PHD_DESC, cadastros:get_value(?ESCOLARIDADE_PHD, TotalEsc1)]),
    io:format("=========================================================================================================~n"),
    io:format("    >>> UNDEFINED GENDER SCHOOLING TOTALITY <<<~n~n"),
    TotalEsc12 = total_escolaridade(U),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO, TotalEsc12)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO, TotalEsc12)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_MEDIO_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_MEDIO_COMPLETO, TotalEsc12)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO, TotalEsc12)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO_DESC, cadastros:get_value(?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO, TotalEsc12)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_POS_GRADUACAO_DESC, cadastros:get_value(?ESCOLARIDADE_POS_GRADUACAO, TotalEsc12)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_MESTRADO_DESC, cadastros:get_value(?ESCOLARIDADE_MESTRADO, TotalEsc12)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_DOUTORADO_DESC, cadastros:get_value(?ESCOLARIDADE_DOUTORADO, TotalEsc12)]),
    io:format("~p = ~p~n", [?ESCOLARIDADE_PHD_DESC, cadastros:get_value(?ESCOLARIDADE_PHD, TotalEsc12)]).

%tira a media salarial
media_salario(Clients) ->
    media_salario(Clients, 0.00, 0).

media_salario([], _SomaSalarios, QtClients) when QtClients =< 0 ->
    0;
media_salario([], SomaSalarios, QtClients) when QtClients >0 ->
    SomaSalarios/QtClients;
media_salario([Client|Clients], SomaSalarios, QtClients) ->
    Salario = cadastros:valida_float(cadastros:get_value(renda, Client)),
    media_salario(Clients, SomaSalarios + Salario, QtClients+1).

%media idade de uma forma nao simplificada
media_age(Clients) ->
    SomaIdades = soma_idades(Clients),
    QtClients = qt_clients(Clients).

media_age(_SomaIdades, QtClients) when QtClients =< 0 ->
    0;
media_age(SomaIdades, QtClients) when QtClients > 0 ->
    SomaIdades / QtClients.


qt_clients(Clients) ->
    qt_clients(Clients, 0).

qt_clients([], QtClients) ->
    QtClients;
qt_clients([_Client|Clients], QtClients) ->
    qt_clients(Clients, QtClients +1).

soma_idades(Clients) ->
    soma_idades(Clients, 0).

soma_idades([], SomaIdades) ->
    SomaIdades;
soma_idades([Client|Clients], SomaIdades) ->
    Age = busca_idade(Client),
    SumIdades = SomaIdades + Age,
    soma_idades(Clients, SumIdades).

busca_idade([]) ->
    0;
busca_idade([{age, Age} | _Resto]) ->
    Age;
busca_idade([_|Resto]) ->
    busca_idade(Resto).

replace_valor(Chave, NovoValor, Proplist) ->
    replace_valor(Chave, NovoValor, Proplist, []).


%substitui o valor inicial por um novo
replace_valor(_Chave, _NovoValor, [], Acc) ->
    Acc;
replace_valor(Chave, NovoValor, [{Chave, _Valor} | RestoProplist], Acc) ->
    lists:merge3([{Chave, NovoValor}], RestoProplist, Acc);
replace_valor(Chave, NovoValor, [X | RestoProplist], Acc) ->
    replace_valor(Chave, NovoValor, RestoProplist, [X|Acc]).

%% funcoes que fazem as totalidades
total_escolaridade(Clients) ->
    total_escolaridade(Clients, [{?ESCOLARIDADE_ENS_FUNDAMENTAL_INCOMPLETO, 0 }, {?ESCOLARIDADE_ENS_FUNDAMENTAL_COMPLETO, 0}, {?ESCOLARIDADE_ENS_MEDIO_COMPLETO, 0}, {?ESCOLARIDADE_ENS_SUPERIOR_INCOMPLETO, 0},{?ESCOLARIDADE_ENS_SUPERIOR_COMPLETO, 0}, {?ESCOLARIDADE_POS_GRADUACAO, 0 }, {?ESCOLARIDADE_MESTRADO, 0}, {?ESCOLARIDADE_DOUTORADO, 0}, {?ESCOLARIDADE_PHD, 0}]).

total_escolaridade([], Acc) ->
    Acc;
total_escolaridade([Client| Clients], Acc) ->
    Esc = cadastros:valida_int(cadastros:get_value(esc, Client)),
    EscAcc = cadastros:get_value(Esc, Acc),
    Acc2 = replace_valor(Esc, EscAcc+1, Acc),
    total_escolaridade(Clients, Acc2).

total_genero(Clients) ->
    total_genero(Clients, [{?GENERO_MASCULINO, 0}, {?GENERO_FEMININO, 0}, {?GENERO_UNDEFINED, 0}]).

total_genero([], Acc) ->
    Acc;
total_genero([Client| Clients], Acc) ->
    Gender = cadastros:valida_int(cadastros:get_value(genero, Client)),
    GenderAcc = cadastros:get_value(Gender, Acc),
    Acc2 = replace_valor(Gender, GenderAcc+1, Acc),
    total_genero(Clients, Acc2).

%separa por genero



divide_lista(Clients) ->
    divide_lista(Clients, {[], [], []}).

divide_lista([],  Acc) ->
    Acc;
divide_lista([Client|Clients], Acc) ->
    ClientGen = cadastros:get_value(genero , Client),
    Acc1 = coloca_na_lista(ClientGen, Client, Acc),
    divide_lista(Clients, Acc1).

coloca_na_lista(?GENERO_MASCULINO, Client, {M, U, F}) ->
    {[Client|M], F, U};
coloca_na_lista(?GENERO_UNDEFINED, Client, {M, U, F}) ->
    {M, [Client|U], F};
coloca_na_lista(?GENERO_FEMININO, Client, {M, U, F}) ->
    {M, U, [Client|F]}.
