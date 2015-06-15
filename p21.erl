-module(p21).
-export([words/1]).

words(Bin)->words(Bin, <<>>).


words(<<" ",Rest/binary>>, Acc)->
	Acc;

words(<<X,Rest/binary>>, Acc)->	words(Rest ,<<Acc/binary, X>>);


words(<<>>, Acc)->
	Acc.