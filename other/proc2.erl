-module(proc2).
-export([start/0]).
-export([process_loop/0]).

start()->
	io:format("Starting proc2~n"),
	spawn(proc2, process_loop, []).

stop(Pid)->
	Pid!stop.

process_loop()->
	receive
		{ping, Pid} = Msg ->
			io:format("~p: receive ~p~n", [self(), Msg]),
			Pid ! pong;
			process_loop();
		Msg ->
			io:format("~p: receive wrong message ~p~n", [self(), Msg])
		end,
		process_loop().