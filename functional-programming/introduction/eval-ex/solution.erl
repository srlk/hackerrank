-module(solution).

-export([main/0, main/1]).

main() ->
    {ok, [N]} = io:fread("", "~d"),
    List = read_list(io:fread("", "~f"), [], N),
    expandList(9, List).

main(_) ->
    main().
    
read_list({ok, [X]}, List, N) when N > 0 -> 
    read_list(io:fread("", "~f"), [X|List], N - 1);
read_list(eof, List, _) -> 
    List;
read_list(_, List, _) -> 
    List.

expandList(_, []) -> ok;
expandList(N, [H|T]) ->
    expandList(N, T),
    io:format("~.4f~n", [expand(N, H)]).

expand(1, X) -> 1 + X;
expand(N, X) when N > 1 ->
     (math:pow(X, N)/factorial(N)) + expand(N-1, X).

factorial(N) when is_integer(N) ->
    lists:foldl( fun(X, Prod) -> X * Prod end, 1, lists:seq(1, N) ).
