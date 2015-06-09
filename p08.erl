-module(p08).
-export([co/1]).
co([H|[]])->H;
co([H,T|[]])->H,T;
co([H,H|T])->[H,co(T)];
co([H,X|T])->[H,X,co(T)].