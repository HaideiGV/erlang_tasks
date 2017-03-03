-module(pack3).
-export([pack/1]).


pack(L)->p05:rev(pack(L, 0, [])).


pack([], C, Acc)->
	Acc;

pack([H|[]], 0, Acc)->
	pack([], 0, [H|Acc]);

pack([H,H|T], C,  Acc)->
	pack([H|T], C +1, [H|Acc]);

pack([H,A|T], C, Acc)->
	pack([A|T], 0, [H]);

pack([H|T], C, Acc)->
	K = {C+1, H}, pack(T, 0, [K|Acc]).
