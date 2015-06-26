-module(l19).
-export([pack/1]).

pack(L)->
	l15:rev(pack(L, [], [])).

pack([H|[]],Acc1, Acc2)->
	[H|Acc1];
pack([H,H|T],Acc1,Acc2)->
	pack([H|T],[H|Acc1], Acc2);
pack([H1,H2|T], Acc1, Acc2)->
	pack([H2|T], Acc1,[H1|Acc2]);
pack([],Acc1,Acc2)->
	[Acc1|Acc2].
