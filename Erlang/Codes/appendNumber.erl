% Luis Carlos Figueroa Rodriguez, A01113431
-module(appendNumber).
-export([start/0, listen/1]).

listen(L) ->
	receive
		X when is_number(X), X > 0 -> io:format("#~p added to list ~n", [X]), listen(L ++ [X]);
		_ -> io:format("List created: ~p ~n", [L])
	end.
	% Complete your code here.

start() ->
	register(appendNumber, spawn(appendNumber, listen, [[]])).
