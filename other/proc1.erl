-module(proc1).
-export([start/0]).
-export([process_loop/0]).

start()->
	io:format("Starting proc1~n"),
	spawn(proc1, process_loop, []).

process_loop()->
	receive
		{ping, Pid} = Msg ->
			io:format("~p: receive ~p~n", [self(), Msg]),
			Pid ! pong
		end,
		process_loop().