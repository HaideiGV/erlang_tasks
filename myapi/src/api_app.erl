-module(api_app).
-include_lib("stdlib/include/ms_transform.hrl").
-export([
	new/1,
	add/3, 
	update/3, 
	del/2, 
	% search/2, 
	% search_by_date/ 2, 
	% search_beetwen_date/2,
	search_by_id/2,
	get_all/1
	]).

% one_hour()->

%create ETS
new(Name)->
	ets:new(Name,[bag, named_table, public]).

%add new post
add(Name, Id, Txt)->
	% ets:select_delete(Name, ets:fun2ms(fun({Name, {Date}) when Date =< erlang:localtime() {{Y, M ,D},{H, Min, S}} -> {Id, Name, Date} end)),
	ets:insert(Name,{Id, Txt, erlang:localtime()}).

%update post
update(Name, Id, Txt)->
	ets:insert(Name,{Id, Txt, erlang:localtime()}).

%delete post
del(Name, Id)->
	ets:delete(Name, Id).

get_all(Name)->
	ets:select(Name, [{{'$1','$2','$3'},[],['$$']}]).

%search posts by id
search_by_id(Name, Id)->
	ets:lookup(Name, Id).



% %search by date
% search_by_date([],{{Y, M ,D},{H, Min, S}})->
% 	search_by_date([], {{Y, M ,D},{H, Min, S}}, []).

% search_by_date([Name|Rest], {{Y, M ,D},{H, Min, S}}, Acc)->
% 	{name, _, _, Date} = Name,
% 	if Date == {{Y, M ,D},{H, Min, S}} -> search_by_date(Rest, {{Y, M ,D},{H, Min, S}}, [Name|Acc]);
% 		true-> "no such post"
% 	end.



% search_by_date(Name,{{Y, M ,D},{H, Min, S}})->
% 	T=get_all(Name),
% 	ets:fun2ms(fun({Name, T = [{_, _, Date}]) when Date == {{Y, M ,D},{H, Min, S}} -> {Id, Name, Date} end).

% search_beetwen_date(Name,{{Y, M ,D},{H, Min, S}})->
% 	ets:fun2ms(fun({Name, Id , Txt, Date}) when Date =:= erlang:localtime()--{{_,_,_}, {1,_,_}} -> {Id, Name} end).





%% testing api module
%%-ifdef (TEST).
-include_lib("eunit/include/eunit.hrl").

api_app_test_()->[
	
	?assertEqual(tab, new(tab)),
	?assertEqual(true,add(tab, key, value)),
	?assertEqual(true,del(tab, key))
	].
-endif.
