% String Mingling

-module(solution).
-compile(export_all).
-export([main/0, main/1]).

main(_) ->
    main().

main() ->
    { [X, Y | _], _} = read_console([], 0),
    mingle(lists:flatten(Y), lists:flatten(X)).

read_console(Acc, N) ->
    case io:get_line("") of
        Done when Done == eof; Done == "\n"; Done == "" ->
            {Acc, N};
        Line ->
            Val = string:strip(Line, right, $\n),
            read_console([ [Val] | Acc], N + 1)
    end.

mingle([], _) ->
    ok;
mingle(_, []) ->
    ok;
mingle( [X|Xs], [Y|Ys]) ->
    io:format("~c~c", [X, Y]),
    mingle(Xs, Ys).
