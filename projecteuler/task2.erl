-module(task2).
-export([fib/1]).

fib(Num)->fib(Num, 1, 1, 0).



fib(Num, _, Num, Sum)->Sum;

fib(Num, Prev, Current, Sum)->if
	(Current rem 2 =:= 0) and (Current =< Num) ->fib(Num, Current, Current+Prev, Sum+Current);
	(Current < Num) ->fib(Num, Current, Current+Prev, Sum);
	true->fib(Num, Prev, Num, Sum)
end.