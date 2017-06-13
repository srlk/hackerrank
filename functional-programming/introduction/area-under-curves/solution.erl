-module(solution).

-export([main/0, main/1]).

% Area Under Curves and Volume of Revolving a Curve

main() ->
    A = tokenize_line(read_line(), fun erlang:list_to_integer/1),
    B = tokenize_line(read_line(), fun erlang:list_to_integer/1),
    {ok, [L, R]} = io:fread("", "~d ~d"),    
    Area = area(A, B, L, R, 0),
    io:format("~f~n", [Area]),
    Volume = volume(A, B, L, R, 0),
    io:format("~f~n", [Volume]).

main(_) ->
    main().
    
read_line() ->
    string:strip(io:get_line(""), right, $\n).
    
tokenize_line(Str, Func) ->
    lists:map(Func, string:tokens(Str, " ") ).
    
area(_, _, X, R, Acc) when X > R ->
    Acc * 0.001;
area(A, B, X, R, Acc) ->
    PointLength = radius(A, B, X, 0),
    area(A, B, X + 0.001, R, Acc + PointLength).
    
volume(_, _, X, R, Acc) when X > R ->
    Acc;
volume(A, B, X, R, Acc) ->
    R1 = radius(A, B, X, 0),
    DiskArea = math:pi() * math:pow(R1, 2),
    PointVolume = DiskArea * 0.001,
    volume(A, B, X + 0.001, R, Acc + PointVolume).
    
radius([], _, _, Acc) ->
    Acc;
radius([A|As], [B|Bs], X, Acc) ->
    radius(As, Bs, X, Acc + (A * math:pow(X, B)) ).
    
    