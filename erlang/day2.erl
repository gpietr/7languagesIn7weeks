-module(day2).
-export([keywordValue/2]).
-export([totalPrices/1]).
-export([ticTacToe/1]).

keywordValue([{Key, Value} | _], Key) -> Value;
keywordValue([_ | Tail], Key) -> keywordValue(Tail, Key).


totalPrices(List) -> [{Name, Price * Quantity} || {Name, Price, Quantity} <- List].


ticTacToe({S, S, S,
           _21, _22, _23,
           _31, _32, _33}) -> S;

ticTacToe({_11, _12, _13,
           S, S, S,
           _31, _32, _33}) -> S;

ticTacToe({_11, _12, _13,
           _21, _22, _23,
           S, S, S}) -> S;

ticTacToe({_11, _12, _13,
           _21, _22, _23,
           _31, _32, _33}) -> cat.