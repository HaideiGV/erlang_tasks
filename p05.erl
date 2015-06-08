-module(p05).
-export([rev/1]).
rev1([H|T])->[T,H].
rev([H|[]])->H;
%%rev([H|T])->[rev(T),H].
rev([H|T])->([rev1(T),H]).