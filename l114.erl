-module(l114).
-export([dup/1]).

dup(L)->
	lists:reverse(dup(L, [])).


dup([H|T], Acc)->
	dup(T, [H|[H|Acc]]);

dup([], Acc)->
	Acc.

