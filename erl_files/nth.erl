-module(nth).
-export([nth/2]).

% nth(L, N)->
% 	nth(L, N, []).

nth([H|T],1)->
	H;
nth([H|T],N)->
	nth(T, N-1).