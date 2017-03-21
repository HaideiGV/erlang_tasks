-module(hello_n_times).
-export([main/1]).

main(Args) ->
	[H|_] = Args,
	Num = erlang:list_to_integer(H),
	io:format("Hello World~p~n", [Num]),
	L=lists:seq(1, Num),
	pr("Hello World~n", L).


pr(St, [_|[]])->io:format(St);

pr(St, [_|T])->
	io:format(St),
	pr(St, T).