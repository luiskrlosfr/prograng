% Luis Carlos Figueroa Rodriguez, A01113431
% ----------------------------------------------------------
% Exercise 1: Calculate the square of the elements in a list
square([], []).
square([X | Xs], [Y | Ys]) :- is_list(X), Y = X, square(Xs, Ys).
square([X | Xs], [Y | Ys]) :- not(is_list(X)), Y is X * X, square(Xs, Ys).

% Exercise 2: Sum the first N numbers
sum(N, X) :- N > 0, X is div(N * (N+1), 2).

% Exercise 3: Calculate the length of a list
xLength([], 0).
xLength([_ | Xs], Y) :- xLength(Xs, Z), Y is Z + 1.

% Exercise 4: Calculate the length of a list (considering sublists)
nLength([], 0).
nLength([X | Xs], Y) :- is_list(X), nLength(X, Z), nLength(Xs, W), Y is Z + W. 
nLength([_ | Xs], Y) :- nLength(Xs, Z), Y is Z + 1.

% Exercise 5: Calculating the dot product
dotProduct([],[],0).
dotProduct([X | Xs],[Y | Ys], Z) :- dotProduct(Xs, Ys, W), Z is (X*Y) + W.
