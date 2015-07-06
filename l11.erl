%% last element of list
-module(l11).
-export([last/1]).

last([H|[]])->
	H;
last([H|T])->
	last(T).