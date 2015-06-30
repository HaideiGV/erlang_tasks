-module(sum_beetween_N_and_M).
-export([sum/2]).

sum(N, M)->
	sum(N, M, 0).

sum(M, M, Acc)->Acc+M;
sum(N, M, Acc)->sum(N+1, M, Acc+N).

