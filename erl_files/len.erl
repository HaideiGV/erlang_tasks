-module(len).
-export([len/1]).

len(L)->
	len(L,0).

len([H|T],Acc)->
	1+len(T,Acc);
len([],Acc)->
	Acc.
