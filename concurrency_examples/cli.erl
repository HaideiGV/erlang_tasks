-module(cli).
-export([main/1]).


%% To run this -> erl -run cli main 4 -s init stop

main(Args)->io:format("End~n~p~p~p~p", Args).

% main([H|[]], Acc])->
% 	io:format("list ~p~n ", lists:seq(1, H)),
% 	io:format("END!~n~p", [Acc]);

% main([H|T], Acc)->
% 	io:format(" Acc ~p~n ", [H]),
% 	main(T, [H|Acc]).