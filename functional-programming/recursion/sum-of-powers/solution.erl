% Sum of Powers

-module(solution).
-compile(export_all).
-export([main/0, main/1]).

main(_) ->
    main().

main() ->
    {ok,[X]} = io:fread("","~d"),
    {ok,[N]} = io:fread("","~d"),
    solve(X, N).

solve(X, N) ->
    MaxSearch = trunc( math:pow(X, 1/N) ) + 1,
    List = lists:map(fun(A) -> math:pow(A, N) end, lists:seq(1, MaxSearch)),
    Ans = target_sum(List, X, 0),
    io:format("~B", [Ans]).
    
target_sum([], _, Acc) ->
    Acc;
target_sum(_, Target, Acc) when Target < 0 ->
    Acc;
target_sum(_, Target, Acc) when Target == 0 ->
    Acc + 1;
target_sum([L|Ls], Target, Acc) ->
    NewAcc = target_sum(Ls, Target - L, Acc),
    target_sum(Ls, Target, NewAcc).
