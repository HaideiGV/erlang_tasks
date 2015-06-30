-module(l110).
-export([rle/1]).


%the first clouse
rle(L)->lists:reverse(rle(L,[])).


%the second clouse
rle([H|T], [{Acc,H}|Res])->
	rle(T, [{Acc+1, H}|Res]);

rle([H|T], Res) ->
	rle(T, [{1, H}|Res]);

rle([], Res) -> 
	Res.