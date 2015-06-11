-module(evenelem).
-export([even/1]).
even([])->[];
even([H|T]) when H rem 2 == 0 -> [H|even(T)];
even([_|T])->even(T).