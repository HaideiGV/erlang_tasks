-module(l17).
-export([flat/1]).


flat(L)->
	l15:rev(flat(L, [])).


flat([[_|_]=H|T], Acc)->
	Acc2=flat(H, Acc),flat(T, Acc2);
flat([[]|T], Acc)->
	flat(T, Acc);
flat([H|T], Acc)->
	flat(T, [H|Acc]);
flat([], Acc)->
	Acc.
