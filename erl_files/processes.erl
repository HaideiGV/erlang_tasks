-module(processes).
-export([max/1]).


max(N)->
	Max = erlang:system_info(process_limit),
	io:format("Max allowed proc~p~n", [Max]),
	statistics(runtime),

	statistics(wall_clock),
	L = for(1, N, fun()->spawn(fun()->wait(2) end) end),
	{_, T1} = statistics(runtime),
	{_, T2} = statistics(wall_clock),
	lists:foreach(fun(Pid)-> Pid ! die, io:format("Die ~p ~n", [Pid]) end, L),
	U1 = T1 *1000 / N,
	U2 = T2* 1000 / N,
	io:format("processes spawn time ~p (~p) mks ", [U1, U2]).


for(N, N, F)->[F()];
for(I, N, F)->[F()|for(I+1, N, F)].


wait(T)->
	receive
		die-> void
	after T ->
		true
	end.

