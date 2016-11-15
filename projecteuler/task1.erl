-module(task1).
-export([
	count/1,
	count_without_list/1
]).


%% Count with creating list of numbers
count(N)->count(lists:seq(1, N-1), 0).


count([], Sum)->Sum;

count([H|T], Sum)->if
	H rem 3 =:= 0 ->
		count(T, Sum+H);
	H rem 5 =:= 0 ->
		count(T, Sum+H);
	true->count(T, Sum)
end.


% Count without creating list of numbers
count_without_list(N)->count_without_list(N, 1, 0).

count_without_list(N, N, Sum)->Sum;

count_without_list(N, Global, Sum)->if
	(Global rem 3 =:= 0) and (Global < N) ->
		count_without_list(N, Global+1, Sum+Global);
	(Global rem 5 =:= 0) and (Global < N) ->
		count_without_list(N, Global+1, Sum+Global);
	true->
		count_without_list(N, Global+1, Sum)
end.