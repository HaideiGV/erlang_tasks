-module(p10).
-export([rle/1]).


rle([X|L]) ->
	rle(1,X,L).

rle(T,X,[])-> 
	[ {T,X} ];

rle(T,X,[X|L]) ->
	rle(T+1,X,L);

rle(T,X,[Y|L])->
	rle (T,X,[]) ++ rle(1,Y,L).