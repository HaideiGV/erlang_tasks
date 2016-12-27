-module(sum_of_N).
-export([sum/1]).

sum(N)->sum(N, 0).


sum(0, Acc)->Acc;
sum(N, Acc)->sum(N-1, Acc+N).

