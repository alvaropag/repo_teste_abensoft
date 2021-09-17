-module(decode).
-export([lista_exemplo/0,
        lista_exemplo2/0,
        flatten_list/0,
        flatten_list1/0,
        procura/2]).

%retorna uma lista com 3 elementos.
lista_exemplo2() ->
    separa_list([1,2,[3,4],5,[6,7,8],9]).

separa_list(ListaUm) ->
    separa_list(ListaUm, []).

separa_list([], Acc) ->
    lists:reverse(Acc);
separa_list([B,C|Resto], Acc) ->
 separa_list(Resto, [[B,C]|Acc]).


%procura elemento da lista por ex elemento 4
procura(Lista, Idxprocurado) ->
    procura(Lista, Idxprocurado, 0).
procura([], _, _) ->
    not_found;
procura([E|_Resto], Idxprocurado, Idxprocurado) ->
    E;
procura([_E|Resto], Idxprocurado, IdxAtual) ->
    procura(Resto, Idxprocurado, IdxAtual+1).


%3 devolve apenas listas.
filter_lists() ->
     filter_list([1,2,[3,4],5,[6,7,8],9]).

filter_list(Lista) ->
    filter_list(Lista, []).

filter_list([], Acc) ->
    lists:reverse(Acc);
filter_list([Head|Resto], Acc) when is_list(Head) ->
    filter_list(Resto, [Head|Acc]);
filter_list([_|Resto], Acc) ->
    filter_list(Resto, Acc).


lista_exemplo() ->
    merge([1, 2], [3, 4]).

merge(Listas1, Listas2) ->
    merge(Listas1, Listas2, []).

merge([], [], Acc) ->
    lists:reverse(Acc);

merge([], [L2Cabeca|L2Resto], Acc) ->
    merge([], L2Resto, [L2Cabeca|Acc]);

merge([L1Cabeca|L1Resto], Lista2,  Acc) ->
    merge(L1Resto, Lista2, [L1Cabeca|Acc]).

    %4 lists:flatten
flatten_list() ->
    flatten_lists([1,2,[3,[4]],5,[6,7,8],9]).

flatten_lists(Lista) ->
    flatten_lists(Lista, []).

flatten_lists([], Acc) ->
    lists:reverse(Acc);
flatten_lists([Head|Tail], Acc) when is_list(Head) ->
    NovoAcc = merge(Head, Acc),
    flatten_lists(Tail, NovoAcc);
flatten_lists([Head|Tail], Acc) ->
    flatten_lists(Tail, [Head|Acc]).

flatten_list1() ->
    flatten_lists1([1,2,[3,[4]],5,[6,7,8],9]).

flatten_lists1(Lista) ->
    flatten_lists1(Lista, []).

flatten_lists1([], Acc) ->
    lists:reverse(Acc);
flatten_lists1([Head|Tail], Acc) when is_list(Head) ->
    %NovoAcc = merge(Head, Acc),
    NovoAcc = lists:reverse(flatten_lists1(Head, Acc)),
    flatten_lists1(Tail, NovoAcc);
flatten_lists1([Head|Tail], Acc) ->
    flatten_lists1(Tail, [Head|Acc]).


%5 exemplo de separação de lista e de adicionar um elemento na lista.
 %para separar um elemento da lista utilizamos "|" e adicionamos oq desejamos adicionar na lista no acumulador "Acc" e o que nao queremos adicionar na lista ignoramos com "_".
 filter_lists() ->
     filter_list([1,2,[3,4],5,[6,7,8],9]).

filter_list(Lista) ->
    filter_list(Lista, []).

filter_list([], Acc) -> % assim que a lista toda ja tiver passado pelo | retornamos o acc, a lista final
    lists:reverse(Acc);
filter_list([Head|Resto], Acc) when is_list(Head) -> % quando for uma lista
    filter_list(Resto, [Head|Acc]); %adiciona no acc e o resto fica para a esquerda pra ser comparado novamente
filter_list([_|Resto], Acc) -> % ignoramos o elemento "Head" se ele nao for uma lista, logo ele n sera adicionadono arrey
    filter_list(Resto, Acc).% e adicionamos o restante na lista desse modo



 %6 comando para pegar o 1 elemento da lista [{a,1}, {b, 2}]  separando a chave do valor na primeira tupla em duas variaveis
%{a}, {1}

separa_valor() ->
    tuple([{a,1}, {b, 2}]).

get_tuple(Lista) ->
    get_tuple(Lista, []).

get_tuple([{Head1, Head2} = Var1|_Tail]) ->
    io:format("~p  ~p Var1=~p~n", [Head1, Head2, Var1]).


%[{a,1}, {b, 2}] = [A], [B]
%{A1, A2} = [A]
%{B1, B2} = [B]




