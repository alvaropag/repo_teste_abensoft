-module (utilitario_clientes).
-export ([pede_converte_binario/1,
            pede_tira_n/1,
            compare_chave/3,
            compare_vazio/1,
            remove_barra_n/1,
            get_value/2]).

get_value(_, []) ->
    [];
get_value(Chave, [{Chave, Valor} | _OutrasPropriedades]) ->
   Valor;
get_value(Chave, [_|Resto]) ->
    get_value(Chave, Resto).


pede_converte_binario(Valor) ->
    list_to_binary(string:strip(io:get_line(Valor), right, $\n)).

remove_barra_n(Valor) ->
    string:strip(Valor,right,$\n).

pede_tira_n(Msg) ->
   string:strip(io:get_line(Msg), right, $\n).


compare_chave(Key, NewValue, Empreendimento) ->
  case NewValue == "" of
        true -> get_value(Key, Empreendimento);
        _ -> NewValue
    end.


compare_vazio(Value) ->
  case Value == "" of
        true -> undefined;
        _ -> Value
    end.



compare_renda(Valor) ->
    case Valor > 0.0 of
        true -> Valor;
        _ -> get_value(renda, Cliente)
    end.
