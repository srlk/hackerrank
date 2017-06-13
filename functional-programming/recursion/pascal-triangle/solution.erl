-module(solution).
-compile(export_all).
-export([main/0, main/1]).

main(_) ->
    main().

main() ->
    {ok, [X]} = io:fread("", "~d"),
    pascal(1, X).

fact(N) when is_integer(N) ->
    lists:foldl( fun(X, Prod) -> X * Prod end, 1, lists:seq(1, N) ).

coeff(Row, Col) when is_integer(Row), is_integer(Col) ->
    fact(Row) / ( fact(Col) * fact(Row - Col) ).

pascal(1, X) ->
    io:format("~B~n", [1]),
    pascal(2, X);
pascal(N, X) when N > X ->
    ok;
pascal(N, X) ->
    Values = lists:map( fun(A) -> coeff(N - 1, A - 1) end, lists:seq(1, N) ),
    Out = string:join( lists:map(fun(A) -> float_to_list(A, [{decimals,0},compact]) end, Values) , " "),
    io:format("~s~n", [Out]),
    pascal(N + 1, X).
