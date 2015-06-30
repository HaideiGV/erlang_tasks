-module(l112).
-export([decode/1]).


decode(L)->lists:reverse(decode(L, [])).




decode([H, T], [{N, H}|Res])->
	decode(T, [{N-1, H}|Res]);

decode([H|T], Res)->
	decode(T, [H|Res]);

decode([H|[]], Res)->
	H;

decode([], Res)->
	Res.

