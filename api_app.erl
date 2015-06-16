-module(api_app).
-include_lib("stdlib/include/ms_transform.hrl").
-export([new/1,add/3, update/3, del/2, search/2, search_by_date/ 2]).


%create ETS
new(Name)->
	ets:new(Name,[bag, named_table, public]).

%add new post
add(Name, Id, Txt)->
	ets:insert(Name,{Id, Txt, calendar:local_time()}).

%update post
update(Name, Id, Txt)->
	ets:insert(Name,{Id, Txt, calendar:local_time()}).

%delete post
del(Name, Id)->
	ets:delete(Name, Id).

%search posts by id
search(Name, Id)->
	ets:lookup(Name, Id).

search_by_date(Name,{Y, M ,D})->
	ets:fun2ms(fun({Name, Id , Txt, Date}) when Date > calendar:local_time()--{{_,_,_}, {1,_,_}} -> {Id, Name} end).




%% testing api module
-ifdef (TEST).
-include_lib("eunit/include/eunit.hrl").

simple_test()->
	ok = application:start(api),
	?assertNot(undefined == whereis(api)).
-endif.
