-module(pack2).
-export([pack/1]).


pack(L)->p05:rev(pack(L, 0, [])).


pack([], C, Acc)->
	Acc;

pack([H|[H|T]], C,  Acc)->
	pack([H|T], C +1, Acc);

pack([H|T], C, Acc)->
	K = {C+1, H}, pack(T, 0, [K|Acc]).

