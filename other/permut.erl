-module(permut).
-export([combs_out/2, permuts_out/2]).



combs_out(List, Number) -> combs_out(List, [], Number).

combs_out(_Remain, Result, Number) when length(Result) == Number ->
    io:format("~w~n", [Result]);
combs_out([], _Result, _Number) -> ok;
combs_out([RemainH|RemainT], Result, Number) ->
    combs_out(RemainT, Result, Number),
    combs_out(RemainT, [RemainH|Result], Number).



permuts_out(List, Number) -> permuts_out(List, [], Number, List).
permuts_out(_Remain, Result, Number, _List) when length(Result) == Number ->
    io:format("~w~n", [Result]);
permuts_out([], _Result, _Number, _List) -> ok;
permuts_out([RemainH|RemainT], Result, Number, List) ->
    permuts_out(RemainT, Result, Number, List),
    permuts_out(List -- [RemainH|Result], [RemainH|Result], Number, List).