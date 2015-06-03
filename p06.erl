-module(p06).
-export([pal/1]).
pal([])->true;
pal([H|[]])->true;
pal([H,H|[]])->true;
pal([H|T])->[H,pal([H|T]),H].
