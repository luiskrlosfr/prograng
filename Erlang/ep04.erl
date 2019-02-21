% Luis Carlos Figueroa Rodriguez, A01113431
-module(ep04).
-export([startSelective/0, selectiveResponse/0, doMath/3, operation/0, startSum/1, sumList/0]).

% Exercise 1: Responds only to numbers
startSelective() ->
    Pid = spawn(ep04, selectiveResponse, []),
    Pid ! 1,
    Pid ! "Message".

selectiveResponse() ->
    receive
        X when is_number(X) ->
            io:format("~p\n", [X+1]),
            selectiveResponse();
        _ ->
            io:format("I'm dead\n")
    end.

% Exercise 2
doMath(X, Y, Z) ->
    PidS = spawn(ep04, operation, []),
    PidM = spawn(ep04, operation, []),
    PidS ! {self(), "+", Y, Z},
    receive
        {PidS, R} -> PidM ! {self(), "*", X, R}
    end,
    receive
        {PidM, R2} -> R2
    end.

operation() ->
    receive
        {Pid, "+", X, Y} -> Pid ! {self(), X + Y};
        {Pid, "*", X, Y} -> Pid ! {self(), X * Y}
    end.

% Exercise 2
startSum(L) ->
    Pid = spawn(ep04, sumList, []),
    Pid ! L.

sumList() ->
    receive
        L when is_list(L) -> io:format("~p\n",[lists:sum(L)])
    end.