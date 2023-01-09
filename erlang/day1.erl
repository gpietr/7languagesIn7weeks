-module(day1).
-export([numWords/1]).
-export([countToTen/0]).
-export([printMessage/1]).

numWords(S) -> numWords(S, 0).

numWords([32 | Tail], CurrentNumber) -> numWords(Tail, CurrentNumber);

numWords([_ | Tail], 0) -> numWordsInTheMiddleOfAWord(Tail, 1);

numWords([_ | Tail], CurrentNumber) -> numWordsInTheMiddleOfAWord(Tail, CurrentNumber).


numWordsInTheMiddleOfAWord([32 | Tail], CurrentNumber) -> numWordsInBetweenWords(Tail, CurrentNumber);

numWordsInTheMiddleOfAWord([_ | Tail], CurrentNumber) -> numWordsInTheMiddleOfAWord(Tail, CurrentNumber);

numWordsInTheMiddleOfAWord([], CurrentNumber) -> CurrentNumber.


numWordsInBetweenWords([32 | Tail], CurrentNumber) -> numWordsInBetweenWords(Tail, CurrentNumber);

numWordsInBetweenWords([_ | Tail], CurrentNumber) -> 1 + numWordsInTheMiddleOfAWord(Tail, CurrentNumber);

numWordsInBetweenWords([], CurrentNumber) -> CurrentNumber.


countToTen() -> countToTen(1).

countToTen(11) -> ok;

countToTen(X) -> 
    io:format("~.B~n", [X]),
    countToTen(X + 1).



printMessage({error, Message}) -> io:fwrite("error:~s~n", [Message]);

printMessage(success) -> io:fwrite("success~n").