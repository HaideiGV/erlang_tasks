-module(p05).
-export([rev/1]).
rev([])->[];
rev([H|[T|[]])->[T|H];
rev([H|T])->rev([T|H]).