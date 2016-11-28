-module(area_server0).
-export([loop/0]).



loop()->
	receive
		{From, {rectangle, W, H}} -> case is_number(W) and is_number(H) of
				true -> From ! io:format("Rectangle area = ~w~n", [W*H]);
				_ -> From ! io:format("One of numbers is not valid!~nPlease try again!~n")
			end,
			loop();
		{From, {circle, R}} -> case is_number(R) of
				true -> From ! io:format("Circle area = ~w~n", [3.14*R*R]);
				_ -> From ! io:format("Number is not valid~nPlease try again!~n")
			end,
			loop();
		Other->
			io:format("Unknown shape ~p~n", [Other]),
			loop()
	end.