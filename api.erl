-module(api).
-export([new/1,add/2, update/3, del/2, search/2]).


%create ETS
new(name)->
	ets:new(name,[bag, named_table, public]).

%add new post
add(name, {id, text})->
	ets:insert(name,{id, text, calendar:local_time()}).

%update post
update(name, id, text)->
	ets:insert(name,{id, text, calendar:local_time()}).

%delete post
del(name, id)->
	ets:delete(name, id).

%search posts by id
search(name, id)->
	ets:lookup(name, id).

search_by_date(name,{y, m ,d})->
	ets:select(name, [{$1,$2,$3}, {}, {}]).