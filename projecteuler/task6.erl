-module(task6).
-export([diff/1]).


diff(N)->diff(N, 0, 0, 0).

diff(N, Index, Sum, Square)->if
	Index =< N ->
		diff(N, Index + 1, Sum+Index, Square + Index* Index);
	true->
		Sum*Sum-Square
end.