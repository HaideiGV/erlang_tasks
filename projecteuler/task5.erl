-module(task5).
-export([small/1]).


%% Not efficient way
small(N)->small(N, 1).

small(N, Acc)->case length(lists:filter(fun(X)-> Acc rem X =:= 0 end, lists:seq(1, N))) of
	N->Acc;
	_->small(N, Acc+1)
end.


%% Refactoring code
