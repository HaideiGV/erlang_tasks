-module(p02).
-export([but_last/1]).
but_last([A,B|[]]=L)->L;
but_last([A|B])->but_last(B).
