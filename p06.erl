-module(p06).
-export([pal/1]).
pal([H|[]])->true;
pal([H,H|[]])->true;
pal([H,A,H|[]])->true;
pal([H|T])->[H,pal([T]),H].
