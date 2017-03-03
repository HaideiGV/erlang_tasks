-module(packing).
-export([pack/1]).

%reverse the result list
pack(L) -> lists:reverse(pack(L, [])).


pack([H|T],[H|Res])->
	pack(T, [[H,H]|Res]);

pack([H|T],[[H|H1]|Res])->
	pack(T, [[H, H|H1]|Res]);

pack([H|T], Res)->
	pack(T, [H|Res]);

pack([], Res)->
	Res.