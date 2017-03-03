%% last element of list
-module(last1).
-export([last/1]).

last([H|[]])->
	H;
last([H|T])->
	last(T).