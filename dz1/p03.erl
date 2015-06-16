-module(p03).
-export([el/2]).
el([H|T],1)->H;
el([H|T],N)->el(T,N-1);
el([],_)->undef.
