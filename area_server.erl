-module(area_server).
-export([loop/0, rpc/2]).


% start()-> spawn(fun loop/0).


% table(Pid, What)->
% 	rpc(Pid, What).

%%remote procedure call
rpc(Pid, Request)->
	Pid ! {self(), Request},
	receive
		{Pid, Response} -> Response
	end.



loop()->
	receive
		{From, {new, Name}}->
			From ! {self(), ets:new(Name,[bag, named_table, public])},
			loop();
		{From, {add, Name, Id, Txt}}->
			From ! {self(), ets:insert(Name,{Id, Txt, calendar:local_time()})},
			loop();
		{From, Other}->
			From ! {self(), {error, Other}},
			loop()
	end.


