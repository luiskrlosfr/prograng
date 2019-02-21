% Luis Carlos Figueroa Rodriguez, A01113431
% ----------------------------------------------------------
% Exercise 1: Insertion Sort
insertionSort([], []).
insertionSort([X | Xs], P) :- insertionSort(Xs, P1), arrange(X, P1, P).

arrange(X, [], [X]).
arrange(X, [X1 | Xs], [X, X1 | Xs]) :- X =< X1.
arrange(X, [X1 | Xs], [X1 | Ys]) :- arrange(X, Xs, Ys).

% Exercise 2: Travelling Time Problem
timeTravel():-
    A is 4,
    C is A - 1,
    B is C * 4,
    R is B * 2,
    write(R),
    write(' hours').

% Exercise 3: Fighting Cell
cellTournament(Order):-
    length(Order, 3),
    member(vegeta, Order),
    member(gohan, Order),
    member(goku, Order),
    before(goku, gohan, Order),
    before(gohan, vegeta, Order).

before(X, Y, L) :-
    nth1(X1, L, X),
    nth1(Y1, L, Y),
    X1 < Y1.