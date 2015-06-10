-module(eunit1).
-export([fib/1]).

fib(0)->1;
fib(1)->1;
fib(N) when N>1->fib(N-1)+fib(N-2).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
fib_test_()->[
	?_assert(fib(0)=:=1),
	?_assert(fib(1)=:=1),
	?_assert(fib(5)=:=8),
	?_assertException(error,function_clause,fib(-1)),
	?_assert(fib(31)=:=2178309)].
-endif.