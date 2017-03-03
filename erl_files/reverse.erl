-module(reverse).
-export([rev/1]).


rev(L)->
	rev(L, []).

rev([], Acc)->
	Acc;
rev([H|T], Acc)->
	rev(T, [H|Acc]).