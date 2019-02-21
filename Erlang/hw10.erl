% Luis Carlos Figueroa Rodriguez, A01113431
-module(hw10).
-export([sumFirst/1, nestedSum/1, removeNestedLists/1, cleanString/1, evaluate/2, toBinaryString/1, zip/2, tuplesToList/1]).

% Exercise 1: Sum range from 1 to N
sumFirst(N) when N == 0 -> N;
sumFirst(N) -> N + sumFirst(N-1).

% Exercise 2: Sum all elements in list including nested lists
nestedSum([]) -> 0;
nestedSum([H | T]) when is_list(H) -> nestedSum(H) + nestedSum(T);
nestedSum([H | T]) -> H + nestedSum(T).

% Exercise 3: Transform nested lists into a single list
removeNestedLists([]) -> [];
removeNestedLists([H | T]) when is_list(H) -> removeNestedLists(H) ++ removeNestedLists(T);
removeNestedLists([H | T]) -> [H] ++ removeNestedLists(T).

% Exercise 4: Remove adjacent identical chars
cleanString([]) -> [];
cleanString([H | T]) when H == hd(T) -> cleanString([H] ++ tl(T));
cleanString([H | T]) -> [H] ++ cleanString(T).

% Exercise 5: Evaluate polynomial
evaluate([], _) -> 0;
evaluate([H | T], X) -> (math:pow(X, length(T)) * H) + evaluate(T, X).

% Exercise 6: Convert N to binary as string
toBinaryString(0) -> "0";
toBinaryString(1) -> "1";
toBinaryString(X) when X div 2 == 0 -> toBinaryString(X rem 2) ++ "";
toBinaryString(X) when X rem 2 == 1 -> toBinaryString(X div 2) ++ "1";
toBinaryString(X) -> toBinaryString(X div 2) ++ "0".

% Exercise 7: Zips two lists
zip([], _) -> [];
zip(_,[]) -> [];
zip([H1 | T1], [H2 | T2]) when length(T1) >= length(T2) -> [{H1, H2}] ++ zip(T1, T2).

% Exercise 8: Create list from list of tuples as indicated. Example: [{a,x},{b,y},{c,z}] -> [a, b, c, z, y, x]
tuplesToList(L) -> lists:map(fun({A,_}) -> A end, L) ++ lists:reverse(lists:map(fun({_,B}) -> B end, L)).