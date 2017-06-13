% Remove Duplicates

-module(solution).
-compile(export_all).

main(_) ->
    main().

main() ->
    Line = string:strip(io:get_line(""), right, $\n),
    solve(Line).

solve(Line) ->
    solve(Line, gb_sets:empty()).

solve([], _) -> ok;
solve([L|Ls], PrintSet) ->
    case gb_sets:is_element(L, PrintSet) of
        true -> solve(Ls, PrintSet);
        false -> 
            io:format("~c", [L]),
            solve(Ls, gb_sets:add(L, PrintSet))
    end.
    