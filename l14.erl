-module(l14).
-export([len/1]).


len(L)->
	len(L, []).

len([H|[]], Acc)->
	Acc;
len([H|T], Acc)->
	1+len(T, Acc).