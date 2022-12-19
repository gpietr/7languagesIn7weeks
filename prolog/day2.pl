rev([], Y, R) :- R = Y.

rev([Head|Tail], Y, R) :- rev(Tail, [Head|Y], R).


min([H|T], Min) :- min(T, H, Min).

min([], Min, Min).

min([H|T], Min0, Min) :- Min1 is min(H, Min0), min(T, Min1, Min).


isOne(X, R) :- X = 1 -> R is 1; R is 0.


sort([], R, R).

sort([H|T], [], R) :- sort(T, H, R).

sort([H|T], L, R) :- min(L, MinL), H < MinL -> sort(T, [H|L], R); sort(T, [L|H], R).