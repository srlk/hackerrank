% Prefix Compression

-module(solution).
-compile(export_all).
-export([main/0, main/1]).

main(_) ->
    main().

main() ->
    {ok,[Line1]} = io:fread("","~s"),
    {ok,[Line2]} = io:fread("","~s"),
    compress(Line1, Line2).

compress(Line1, Line2) ->
    compress(Line1, Line2, []).

compress([], B, Com) ->
    print_solution([], B, Com);
compress(A, [], Com) ->
    print_solution(A, [], Com);
compress([A|As], [B|Bs], Com) when A =:= B ->
    compress(As, Bs, [A|Com]);
compress(A, B, Com) ->
    print_solution(A, B, Com).
    
print_solution(A, B, Com) ->
    io:format("~B ~s~n", [length(Com), lists:reverse(Com)]),
    io:format("~B ~s~n", [length(A), A]),
    io:format("~B ~s~n", [length(B), B]).
    