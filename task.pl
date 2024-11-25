points(sudak, 5).
points(lesh, 4).
points(okun, 2).
points(ersh, 1).


solve(Result) :-
    Sergeev = [1, Slesh, Sokun, Sersh],
    Panin = [0, Plesh, Pokun, Persh],
    Borisov = [0, Blesh, Bokun, Bersh],
    Lednev = [0, Llesh, Lokun, Lersh],

    Result = [Sergeev, Panin, Borisov, Lednev],
    
    member(Slesh, [0, 1, 2, 3, 4, 5]),
    member(Sokun, [0, 1, 2, 3]),
    member(Sersh, [0, 1, 2, 3, 4, 5]),
    member(Plesh, [0, 1, 2, 3, 4, 5]),
    member(Pokun, [0, 1, 2, 3]),
    member(Persh, [0, 1, 2, 3, 4, 5]),
    member(Blesh, [0, 1, 2, 3, 4, 5]),
    member(Bokun, [0, 1, 2, 3]),
    member(Bersh, [0, 1, 2, 3, 4, 5]),
    member(Llesh, [0, 1, 2, 3, 4, 5]),
    member(Lokun, [0, 1, 2, 3]),
    member(Lersh, [0, 1, 2, 3, 4, 5]),
    
    Sokun + Pokun + Bokun + Lokun =:= 3,

    calculate_points(Sergeev, ScoreS),
    calculate_points(Panin, ScoreP),
    calculate_points(Borisov, ScoreB),
    calculate_points(Lednev, ScoreL),
    ScoreS + ScoreP + ScoreB + ScoreL =:= 18,

    ScoreP < ScoreS, ScoreP < ScoreB, ScoreP < ScoreL,
    total_fish(Panin, TotalFishP),
    total_fish(Sergeev, TotalFishS),
    total_fish(Borisov, TotalFishB),
    total_fish(Lednev, TotalFishL),
    TotalFishP > TotalFishS,
    TotalFishP > TotalFishB,
    TotalFishP > TotalFishL,

    ScoreP + ScoreB =:= ScoreS + ScoreL,

    all_different([ScoreS, ScoreP, ScoreB, ScoreL]).


calculate_points([Sudak, Lesh, Okun, Ersh], Score) :-
    Score is 5 * Sudak + 4 * Lesh + 2 * Okun + 1 * Ersh.


total_fish([Sudak, Lesh, Okun, Ersh], Total) :-
    Total is Sudak + Lesh + Okun + Ersh.


all_different([]).
all_different([H|T]) :- \+ member(H, T), all_different(T).
