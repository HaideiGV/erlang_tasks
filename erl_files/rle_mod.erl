-module(rle_mod).
-export([rle_mod/1]).


rle_mod(L)->
	lists:reverse(rle_mod(L, [])).



rle_mod([H|T], [H, H|Res])->
	rle_mod(T, [{Acc+1, H}|Res]);

rle_mod([H|T], [H,H1|Res])->
	rle_mod(T, [H,H1|Res]);

rle_mod([H|T], Res) ->
	rle_mod(T, [{1, H}|Res]);

rle_mod([], Res) -> 
	Res.