-module(activity06).
-export([removeFirst/2, sum/1, quicksort/1, transposeMatrix/1, getDegrees/1, summarizationTable/1]).

% Removes first N Elements of a List
removeFirst(0, L) -> L;
removeFirst(X, [_ | L]) -> removeFirst(X - 1, L).

% Sums all elements of a list, ignores nested lists
sum([]) -> 0;
sum([H | T]) when is_list(H) -> sum(T);
sum([H | T]) -> H + sum(T).

% Quicksort Algorithm
lessthan(_, []) -> [];
lessthan(X, [H | T]) when H < X ->  [H] ++ lessthan(X, T);
lessthan(X, [H | T]) when H >= X ->  lessthan(X, T).

morethan(_, []) -> [];
morethan(X, [H | T]) when H >= X ->  [H] ++ morethan(X, T);
morethan(X, [H | T]) when H < X ->  morethan(X, T).

quicksort([]) -> [];
quicksort([H | T]) -> quicksort(lessthan(H, T)) ++ [H] ++ quicksort(morethan(H, T)).

% Gets transpose of matrix
transposeMatrix ([[] | _]) -> [];
transposeMatrix (M) -> [lists:map(fun(H) -> hd(H) end, M) | (transposeMatrix(lists:map(fun(T) -> tl(T) end, M)))].

%  Get list of degrees of each node 
getDegrees ([]) -> [];
getDegrees ([H | T]) -> [length(tl(H))] ++ getDegrees(T).

% Get Average of each Height according to Gender
first({X, _}) -> X.
second({_,Y}) -> Y.
mean(T) -> [{first(hd(T)), lists:sum(lists:map(fun(X) -> second(X) end, T)) / length(T)}].
summarizationTable(T) -> mean(lists:filter(fun({X, _}) -> X == "Male" end, T)) ++ mean(lists:filter(fun({X, _}) -> X == "Female" end, T)).