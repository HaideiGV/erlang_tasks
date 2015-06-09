-module(p11).
-export([rled/1]).
rled([{T,X}|L]) -> rled(T,X) ++ rled(L);
rled([]) -> [].
rled(1,X) -> [X];
rled(T,X) -> [X] ++ rled(T-1,X).