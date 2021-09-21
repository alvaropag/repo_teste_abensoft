-module(atividades).
-export([lista_exemplo/0,
        filter_list1/0,
        achata_flatten1/0,
        procura/2,
        separa_proplist1/0,
        lista_exemplo2/0]).


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




lista_exemplo2() ->
    separa_list([1,2,[3,4],5,[6,7,8],9]).

separa_list(ListaUm) ->
    separa_list(ListaUm, []).

separa_list([], Acc) ->
    lists:reverse(Acc);
separa_list([B,C|Resto], Acc) ->
 separa_list(Resto, [[B,C]|Acc]).



procura(Lista, Idxprocurado) ->
    procura(Lista, Idxprocurado, 0).
procura([], _, _) ->
    not_found;
procura([E|_Resto], Idxprocurado, Idxprocurado) ->
    E;
procura([_E|Resto], Idxprocurado, IdxAtual) ->
    procura(Resto, Idxprocurado, IdxAtual+1).



filter_list1() ->
    filter_list([1,2,[3,4],5,[6,7,8],9, [0]]).

filter_list(ListaUm) ->
    filter_list(ListaUm, []).

filter_list([], Acc) ->
    lists:reverse(Acc);
filter_list([ [_|_] = Elem|ListaResto], Acc) ->
    filter_list(ListaResto, [Elem|Acc]);

filter_list([_|ListaResto], Acc) ->
    filter_list(ListaResto, Acc).


achata_flatten1() ->
    achata_flatten([1,2,[3,[4]],5,[6,7,8],9, [0]]).

achata_flatten(Lista) ->
    achata_flatten(Lista
    []).

achata_flatten([], Acc) ->
    io:format("SAIDA: ~n~p~n", [Acc]),
    lists:reverse(Acc);


achata_flatten([[_|_] = ListaCabeca|ListaResto], Acc) ->
    io:format("Valor da ListaCabeca: ~p~n, Valor do Resto da lista: ~p~n, Valor do Acumulador: ~p~n", [ListaCabeca, ListaResto, Acc]),
    NovoAcc = lists:reverse(achata_flatten(ListaCabeca, Acc)),
    io:format("Novo Acumulador recebe: ~p~n", [NovoAcc]),
    achata_flatten(ListaResto, NovoAcc);

achata_flatten([ListaCabeca|ListaResto] , Acc) ->
    achata_flatten(ListaResto, [ListaCabeca|Acc]).




%Exemplo de separação de lista e adicionar elementos: uma das principais ferramentas utilizidas para criar uma lista, ou desmontala é o |, que usado na cabeça da função ou no lado esquerdo quer dizer que esta desmontando uma lista, ja ela no final de uma função ou lado direito esta remontando uma lista nova. Ou seja a gente divide a lista, em partes sendo assim, a primeira divisão que fica ao lado esquerdo do | recebe o valor do primeiro elemento da lista, seja ele qual for. ja a variavel que fica ao lado direito da lista, recebe o valor do ''Corpo'' da lista, ou seja passa a valer todo o resto da lista, tirando obviamente o primeiro elemento, que esta divido na variavel ao lado esquerdo. Após isso existe um acomulador, geralmente chamado de ''Acc'' que ele recebe o valor, já retirado da lista e deixa guardado, usando a forma de remontar uma lista, que é o | no fim da função, o ponto de parada dessa função, é quando a lista retornar todalmente vazia, ou seja quandpo ele percorrer toda a lista e separar ela, e juntar ao acumulador ele via retornar o acumulador, ja com todos os elemtnos nele.


%separa_list(ListaUm) ->
%    separa_list(ListaUm, []).       Aqui por exemplo, é feito a separação de uma lista, em uma nova lista com 2 elementos cada, primeiro passo é passar a lista por
 %                                    parametro na função, e dps converter ela para dois parametros, ou seja adicionar o acumulador com  o valor vazio, sem valor nenhum
%separa_list([], Acc) ->              dps é passado o ponto de parada, que é quando a lista retornar totalmente vazia, e passado o acumulador por parametro, que esta
%    lists:reverse(Acc);             valendo 0 por conta do vazio na função de cima, ai quando chegar no seu ponto de parada, é retornado o proprio acumulador.
%separa_list([B,C|Resto], Acc) ->    aqui é feito a separação da lista, ou seja o | está na cabeça da função ou no lado esquerdo, ele separa os dois elemtnos da lista, e
% separa_list(Resto, [[B,C]|Acc]).   o restante na variavel resto, o acc aainda esta valendo 0. ate na linha de baixo onde como o | esta na direita ou final da função
%                                    está reconstruindo a lista ou seja você ta adicionando uma lista nova, para o acumulador e passando ela como parametro la encima quando retornar vazio e percorrer toda a lista.


separa_proplist1() ->
    separa_proplist([{a, 1}, {b,2}]).

separa_proplist([{Elem1, Elem2} = Elem|_Resto]) ->
    io:format("Elem1: ~p, Elem2: ~p, Elem: ~p~n", [Elem1, Elem2, Elem]).










(










