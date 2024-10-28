% Предикат вычисления длины списка
my_length([], 0).
my_length([_|Tail], N) :- my_length(Tail, N1), N is N1 + 1.

% Предикат принадлежности элемента списку
my_member(X, [X|_]).
my_member(X, [_|Tail]) :- my_member(X, Tail).

% Предикат объединения спискоыв
my_append([], L, L).
my_append([Head|Tail], L, [Head|NewTail]) :- my_append(Tail, L, NewTail).

% Предикат удаления элемента из списка
my_remove(X, [X|Tail], Tail).
my_remove(X, [Head|Tail], [Head|NewTail]) :- my_remove(X, Tail, NewTail).

% Предикат перестановок списка
my_permute([], []).
my_permute(List, [Head|Tail]) :- my_remove(Head, List, NewList), my_permute(NewList, Tail).

% Предикат проверки подсписка
my_sublist(List, List).
my_sublist(Sub, List) :- my_append(_, List2, List), my_append(Sub, _, List2).

% Предикат удаления первых n элементов списка
remove_n(0, List, List).
remove_n(_, [], []).
remove_n(N, [_|Tail], Res) :- N > 0, N1 is N - 1, remove_n(N1, Tail, Res).

% Предикат вычисления числа вхождений 1-го элемента
count_occurences(_, [], 0).
count_occurences(Elem, [Elem|Tail], N) :- count_occurences(Elem, Tail, N1), N is N1 + 1.

count_occurences(Elem, [_|Tail], N) :- count_occurences(Elem, Tail, N).


count_first_element([], 0).
count_first_element([Head|Tail], N) :- count_occurences(Head, Tail, N).

