% Filter Elements

-module(solution).
-compile(export_all).
-export([main/0, main/1]).

main(_) ->
    main().

main() ->
    {ok,[T]} = io:fread("","~d"),
    read_and_solve(T).
    
read_and_solve(0) -> ok;
read_and_solve(N) ->
    {ok, [_, K]} = io:fread("", "~d ~d"),
    Line = string:strip(io:get_line(""), right, $\n),
    List = lists:map(fun erlang:list_to_integer/1, string:tokens(Line, " ") ),
    solve(K, List),
    read_and_solve(N - 1).

solve(K, List) ->
    Dict = count_all(List, gb_trees:empty()),
    print_solution(K, List, Dict, false).

print_solution(_, [], _, true) ->
    io:format("~n");
print_solution(_, [], _, false) ->
    io:format("-1~n");
print_solution(K, [L|Ls], Dict, FoundAny) ->
    case gb_trees:is_defined(L, Dict) of
        false -> print_solution(K, Ls, Dict, FoundAny);
        true ->
            Count = gb_trees:get(L, Dict),
            if
                Count >= K -> 
                    io:format("~B ", [L]);
                true -> ok
            end,
            print_solution(K, Ls, gb_trees:delete_any(L, Dict), FoundAny orelse Count >= K)
    end.

count_all([], Dict) ->
    Dict;
count_all([L|Ls], Dict) ->
    case gb_trees:is_defined(L, Dict) of
        false ->
            count_all(Ls, gb_trees:insert(L, 1, Dict));
        true ->
            NewCount = gb_trees:get(L, Dict) + 1,
            count_all(Ls, gb_trees:update(L, NewCount, Dict))
    end.