-module(p08).
-export([pack/1]).


% comp(L)->
% 	p05:rev(comp(L,[])).


% comp([],Acc)->
% 	Acc;

% comp([H|[]],Acc)->
% 	[H|Acc];

% comp([H,H|T],Acc)->
% 	comp([A|T],[H|Acc]).



pack(L) -> p05:rev(pack(L, [])).


pack([First|Tail], [First|Result]) ->
	pack(Tail, [[First,First]|Result]);


pack([First|Tail], [[First|MoreFirst]|Result]) ->
	pack(Tail, [[First,First|MoreFirst]|Result]);


pack([First|Tail], Result) ->
	pack(Tail, [First|Result]);


pack([], Result) -> 
	Result.