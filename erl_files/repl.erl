-module(repl).
-export([repl/2]).

repl(L,N)->
	lists:reverse(repl(L,N,[])).



repl([H|T], N, Acc)->
	repl(T, N-1, [H|Acc]);

repl([H|T], 0, Acc)->
	Acc;	

repl([], N, Acc)->
	Acc.