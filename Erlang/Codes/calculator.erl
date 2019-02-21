% Luis Carlos Figueroa Rodríguez, A01113431
-module(calculator).
-export([start/1, listen/1]).

listen(0) -> io:format("You don't have any more operations left!~n", []);
listen(N) -> 
	receive
		{"+", X, Y} -> io:format("Sum of numbers: ~p.~n", [X + Y]), listen(N - 1);
		{"-", X, Y} -> io:format("Difference of numbers: ~p.~n", [X - Y]), listen(N - 1);
		{"*", X, Y} -> io:format("Product of numbers: ~p.~n", [X * Y]), listen(N - 1);
		{"/", X, Y} -> io:format("Division of numbers: ~p.~n", [X / Y]), listen(N - 1);
		{_, _, _} -> io:format("There must be an error with the operand!~n", [])
  	end.

start(N) ->
	io:format("Calculator started...~n"),
	register(calculator, spawn(calculator, listen, [N])).
