-module(comp).
-export([comp/1]).


comp(L)->
	l15:rev(comp(L,[])).

comp([H|[]],Acc)->
	[H|Acc];
comp([H,H|[]],Acc)->
	[H|Acc];
comp([H,H|T],Acc)->
	comp(T, [H|Acc]);
comp([H1,H2|T],Acc)->
	comp([H2|T], [H1|Acc]).