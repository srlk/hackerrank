% Sequence full of colors

-module(solution).
-compile(export_all).
-export([main/0, main/1]).

main(_) ->
    main().

main() ->
    {ok,[T]} = io:fread("","~d"),
    read_line_and_solve(T).
    
read_line_and_solve(0) -> ok;
read_line_and_solve(N) ->
    {ok, [Line]} = io:fread("", "~s"),
    solve(Line, 0, 0, 0, 0),
    read_line_and_solve(N - 1).

solve([], R, G, Y, B) when R == G, Y == B ->
    io:format("True~n");
solve([], _, _, _, _) ->
    io:format("False~n");
solve(_, R, G, Y, B) when R - G > 1; R - G < -1;  Y - B > 1; Y - B < -1 ->
    io:format("False~n");
solve([L|Ls], R, G, Y, B) when L =:= $R -> solve(Ls, R + 1, G, Y, B);
solve([L|Ls], R, G, Y, B) when L =:= $G -> solve(Ls, R, G + 1, Y, B);
solve([L|Ls], R, G, Y, B) when L =:= $Y -> solve(Ls, R, G, Y + 1, B);
solve([L|Ls], R, G, Y, B) when L =:= $B -> solve(Ls, R, G, Y, B + 1).

    