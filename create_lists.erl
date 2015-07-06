-module(create_lists).
-export([create/1]).


create(N)->
	create(N, []).


create(0, Acc)->
	Acc;

create(N, Acc)->create(N-1, [N|Acc]).
