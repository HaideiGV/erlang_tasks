-module(flatten).
-export([flat/1]).

flat(L)->
	p05:rev(flat(L,[])).

flat([[_|_]==[H|T]], Acc)->
	Acc2=flat(H,Acc),flat(T,Acc2);
flat([[]|T], Acc)->
	flat(T, Acc);
flat([H|T], Acc)->
	flat(T, [Acc|H]);
flat([], Acc)->
	Acc.
