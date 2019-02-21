% Luis Carlos Figueroa Rodriguez, A01113431
-module(hw12).
-export([pow/2, fibonacci/1, myReverse/1, myCount/2]).

% Exercise 1: Tail-recursive version of pow function
pow(N, X) -> powAux(N, N, X).

powAux(_,_,0) -> 1;
powAux(N, _, 1) -> N;
powAux(N, B, X) -> powAux(N*B,B,X-1).

% Exercise 2: Tail-recursive version of getting N number of fibonacci sequence
fibonacci(X) -> fibAux(1,1,X).

fibAux(_, _, 0) -> 0;
fibAux(_, _, 1) -> 1;
fibAux(_, Y, 2) -> Y;
fibAux(X, Y, N) -> fibAux(Y, X+Y, N-1).

% Exercise 3: Tail-recursive of reversing a list
myReverse(L) -> reverseAux([hd(L)], tl(L)).

reverseAux(L, []) -> L;
reverseAux(L, [H | T]) -> reverseAux([H]++L, T).

% Exercise 4: Tail-recoursive of counting occurences of N in a list
myCount(L, N) -> countAux(L, N, 0).

countAux([], _, C) -> C;
countAux([H | T], N, C) when H == N -> countAux(T, N, C + 1);
countAux([_ | T], N, C) -> countAux(T, N, C).