% String Compression

-module(solution).
-compile(export_all).
-export([main/0, main/1]).

main(_) ->
    main().

main() ->
    Str = read_line(),
    compress(Str).
    
read_line() ->
    string:strip(io:get_line(""), right, $\n).

compress(Str) ->
    compress(Str, [], []).

compress([], CharStack, NumStack) -> 
    print_solution(lists:reverse(CharStack), lists:reverse(NumStack)),
    ok;
compress([X|Xs], [], []) -> % First case
    compress(Xs, [X], [1]);
compress([X|Xs], [X|Cs], [N|Ns]) -> % Same char
    compress(Xs, [X|Cs], [N+1|Ns]);
compress([X|Xs], [C|Cs], [N|Ns]) -> % different char
    compress(Xs, [X|[C|Cs]], [1|[N|Ns]]).

print_solution([], _) ->
    io:format("~n");
print_solution([C|Cs], [1|Ns]) ->
    io:format("~c", [C]),
    print_solution(Cs,Ns);
print_solution([C|Cs], [N|Ns]) ->
    io:format("~c~B", [C,N]),
    print_solution(Cs,Ns).
    
    
    
    