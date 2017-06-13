% String Reductions

-module(solution).
-compile(export_all).
-export([main/0, main/1]).

main(_) ->
    main().

main() ->
    {ok,[Line]} = io:fread("","~s"),
    reduce(Line).

reduce(Line) ->
    reduce(Line, gb_sets:new()).
    
reduce([], _) ->
    io:format("~n"),
    ok;
reduce([L|Ls], Set) ->
    case gb_sets:is_element(L, Set) of 
        true -> reduce(Ls, Set);
        false -> 
            io:format("~c", [L]),
            reduce(Ls, gb_sets:add_element(L, Set))
    end.