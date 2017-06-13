% String-o-Permute

-module(solution).
-compile(export_all).
-export([main/0, main/1]).

main(_) ->
    main().

main() ->
    {ok, [N]} = io:fread("", "~d"),
    read_line_and_perform(N, fun solution:permute/1).
    
read_line() ->
    string:strip(io:get_line(""), right, $\n).

read_line_and_perform(N, _) when N =:= 0 ->
    ok;
read_line_and_perform(N, Function) when N > 0 ->
    permute(read_line()),
    read_line_and_perform(N - 1, Function).
    
permute(Str) ->
    permute(Str, []).

permute([], Acc) ->
    io:format("~s~n", [lists:reverse(Acc)]);
permute([X, Y | Remain], Acc) ->
    permute(Remain, [X | [Y | Acc]]).