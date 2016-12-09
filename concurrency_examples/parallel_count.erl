-module(parallel_count).
-export([start/1]).

sqr(X)->X*X.


start(N)->spawn(fun()->loop(N) end).


rpc(Pid, Response)->
	Pid ! {self(), Request}
	receive
		{Pid, Response} ->
			Response
	end.


loop(N)->
	receive
		{Pid, N}->
			spawn(fun(N)->lists:map(io:format("~p is square of ~p~n", [I, sqr(I)]), lists:seq(1, N))),
			Pid ! 
		Other->Other,
		loop()
	end.