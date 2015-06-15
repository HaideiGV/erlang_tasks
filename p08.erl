-module(p08).
-export([pack/1]).



pack(L) -> p05:rev(pack(L, [])).


pack([First|Tail], [First|Result]) ->
	pack(Tail, [First|Result]);


pack([First|Tail], [[First|MoreFirst]|Result]) ->
	pack(Tail, [[First|MoreFirst]|Result]);


pack([First|Tail], Result) ->
	pack(Tail, [First|Result]);


pack([], Result) -> 
	Result.