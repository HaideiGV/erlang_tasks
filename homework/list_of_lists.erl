-module(list_of_lists).
-export([ls/1]).


ls(L)->lists:reverse(ls(L, [])).

% убрать пустые списки при выводе
ls([], Acc)->
	Acc;

ls([H|[]], Acc)->
	[H|Acc];

ls([[_|_]=[H1|T1]|T], Acc)->
	ls([T1|T], [H1|Acc]);

ls([H|T], Acc)->
	ls(T,[H|Acc]).