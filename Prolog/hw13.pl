% Luis Carlos Figueroa Rodriguez, A01113431
% ----------------------------------------------------------
:- use_module(library(clpfd)).
:- use_module(library(clpb)).
% Exercise 1: Prepare a program in Prolog that duplicates the elements in a list.
duplicate([], []).
duplicate([X | Xs], Y) :- append([X,X], Z, Y), duplicate(Xs, Z).
% Exercise 2: Prepare a program in Prolog that sums all the elements in a list but ignores sublists.
sum([], 0).
sum([X | Xs], Y) :- is_list(X), sum(Xs, Y).
sum([X | Xs], Y) :- sum(Xs, Z), Y is Z + X.
% Exercise 3: Prepare a program in Prolog that receives a positive integer and returns a string with the binary representation of such an integer.
toBinaryString(0, '0').
toBinaryString(1, '1').
toBinaryString(X, Y) :- 0 is X mod 2, Z is X / 2, toBinaryString(Z, W), string_concat(W, '0', Y).
toBinaryString(X, Y) :- 1 is X mod 2, Z is (X-1) / 2, toBinaryString(Z, W), string_concat(W, '1', Y).
% Exercise 4: Write a program in Prolog that checks if there is at least one path between two given nodes in a directed graph.
% Graph:    (1) ---------- (2)
%            |              |
%            |      (5)     |
%            |          `   |
%           (3) ----------`(4)
% Set graph connections
connection(1, 2).
connection(1, 3).
connection(2, 4).
connection(3, 4).
connection(4, 5).

% Two nodes are connected if there exists a connection from X to Y or Y to X
connected(X, Y) :- connection(X, Y).
connected(X, Y) :- connection(Y, X).

% The path is the route going from Y to X
route(X, Y) :- go(X, Y, []), write(X).

% X can go to Y if they are directly connected or there exists another node that can go to Y and is connected to X
go(X, Y, L) :- connected(X, Z), not(memberchk(Z, L)), go(Z, Y, [X | L]), write(Z).
go(X, Y, L) :- connected(X, Z), not(memberchk(Z, L)), Y == Z, write(Y).

% Exercise 5: Get the 8 possible solutions to the 3 x 3 Magic Square (All rows, columns and diagonals sum is 15)
magic_square(Solution) :-
  Puzzle = [A, B, C,
            D, E, F,
            G, H, I],
  all_different(Puzzle),
  Puzzle ins 1..9,
  label(Puzzle),
  Row1 is A + B + C,
  Row2 is D + E + F,
  Row3 is G + H + I,
  Col1 is A + D + G,
  Col2 is B + E + H,
  Col3 is C + F + I,
  Diag1 is A + E + I,
  Diag2 is G + E + C,
  Row1 = Row2,
  Row2 = Row3,
  Row3 = Col1,
  Col1 = Col2,
  Col2 = Col3,
  Col3 = Diag1,
  Diag1 = Diag2,
  Diag2 = 15,
  Solution = Puzzle,
  write(A), write(" | "), write(B), write(" | "), write(C), nl,
  write("----------"), nl,
  write(D), write(" | "), write(E), write(" | "), write(F), nl,
  write("----------"), nl,
  write(G), write(" | "), write(H), write(" | "), write(I), nl,
  write("==============="), nl,
  fail.
% Exercise 6: Solve the Logic Puzzle. 
solvePuzzle(Solution) :-
    length(Solution, 5),
    member([red,_,_,_,english], Solution),
    member([_,dog,_,_,spanish], Solution),
    member([green,_,coffee,_,_], Solution),
    member([_,_,tea,_,ukranian], Solution),
    next([green,_,_,_,_], [white,_,_,_,_], Solution),
    member([_,serpent,_,winston,_], Solution),
    member([yellow,_,_,kool,_], Solution),
    Solution = [_,_,[_,_,milk,_,_],_,_],
    Solution = [[_,_,_,_,norwegian],_,_,_,_],
    next([_,_,_,chesterfield,_], [_,fox,_,_,_], Solution),
    next([_,_,_,kool,_], [_,horse,_,_,_], Solution),
    member([_,_,juice,lucky_strike,_], Solution),
    member([_,_,_,kent,japanese], Solution),
    next([_,_,_,_,norwegian], [blue,_,_,_,_], Solution),
    member([_,zebra,_,_,_], Solution),
    member([_,_,water,_,_], Solution), !.

right(X, Y, L) :-
    nth1(X1, L, X),
    nth1(Y1, L, Y),
    X1 is Y1 + 1.

next(X, Y, L) :-
    right(X, Y, L);
    right(Y, X, L).

printSolution([]) :- !.
printSolution([[Color, Pet, Drink, Cigar, Nationality] | L]) :-
    write("The "), write(Nationality), write(" has a "), write(Pet), write(", likes to drink "), write(Drink), 
    write(" and smokes "), write(Cigar), write(" and lives in the  "), write(Color), write(" house. "), printSolution(L).