-module(p07).
-export([ln/1]).
ln([H|[]])->H;
ln([H|T])->[H,ln(T)].