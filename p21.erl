-module(p21).
-export([words/1]).

words(Bin)->
	lists:reverse(words(Bin,[])).


words(<<" ">>, Acc)->
	Acc;

words(<<Val:8,Rest/binary>>, Acc)->
	words(Rest,[Val|Acc]).