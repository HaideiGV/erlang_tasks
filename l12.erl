-module(l12).
-export([two_last/1]).


two_last([H1, H2|[]])->
	[H1, H2];
two_last([H|T])->
	two_last(T).