-module(reverse_list).
-export([rev/1]).

rev(L)->rev(L, []).

rev([H|T], Acc)->rev(T, [H|Acc]);
rev([], Acc)-> Acc.