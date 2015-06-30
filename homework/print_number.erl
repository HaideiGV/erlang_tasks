-module(print_number).
-export([out_n/1]).

out_n(N)->out_n(N, []).

out_n(0, Acc)->
	io:format("Number:~p~n", [Acc]);

out_n(N, Acc)->
	out_n(N-1, [N|Acc]).


