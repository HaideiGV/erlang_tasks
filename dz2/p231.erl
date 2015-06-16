-module(p231).
-export([concat/2]).



concat(L, <<>>)->p22:words(concat(L, <<>>, [])).



concat([H|T], <<>>)->
	[H|T];

concat([H|T],<<X>>)->
	concat(T, <<H, X>>).
