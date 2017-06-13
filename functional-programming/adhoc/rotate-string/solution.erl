% Rotate String

-module(solution).
-compile(export_all).

main(_) -> main.

main() ->
    {ok, [T]} = io:fread("", "~d"),
    solve(T).

solve(0) ->
    ok;
solve(N) ->
    Str = string:strip(io:get_line(""), right, $\n),
    ListSize = length(Str),
    rotate(Str, 1, ListSize),
    solve(N - 1).

rotate(Str, Count, ListSize) when Count == ListSize  ->
    io:format("~s~n", [Str]),
    ok;
rotate(Str, Count, ListSize) when Count > 0 ->
    First = lists:sublist(Str, Count + 1, ListSize - 1),
    Second = lists:sublist(Str, 1, Count),
    io:format("~s~s ", [First, Second]),
    rotate(Str, Count + 1, ListSize).
    
