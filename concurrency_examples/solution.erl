% Enter your code here. Read input from STDIN. Print output to STDOUT
% Your class should be named solution

-module(solution).
-export([main/1]).

main(Args) ->
	[H | _]=Args,
	N=erlang:list_to_integer(H),
	L=lists:seq(1, N),
	pr("Hello World~n", L).



pr(St, [H|[]])->io:format(St);

pr(St, [H|T])->
	io:format(St),
	pr(St, T).
