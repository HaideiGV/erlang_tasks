-module(rev).
-export([rev/1]).


rev(L)->
	rev(L,[]).


rev([H|T],A)->
	rev(T,[H|A]);

rev([],A)->
	A.