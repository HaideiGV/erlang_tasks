-module(filt).
-export([fl/2]).

fl(L, N)->lists:reverse(fl(L, N, [])).


fl([], N, Acc)->
	Acc;

fl([H|T], N, Acc) when H < N ->
	fl(T, N, [H|Acc]);


fl([H|T], N, Acc) when H >= N ->
	fl(T, N, Acc).
