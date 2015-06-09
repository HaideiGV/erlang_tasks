	-module(p06).
-export([pal/1]).
last([H|[]])->H;
last([H|T])->last(T).
pal([H|[]])->true;
pal([H|T])->[H=:=last(T)].
