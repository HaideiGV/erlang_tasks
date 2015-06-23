-module(library).
-behaviour(gen_server).
-export([start/0]).
%% gen_server callbacks
-export([
	init/1, 
	handle_call/3, 
	handle_cast/2, 
	handle_info/2,
	terminate/2, 
	code_change/3
	]).
-compile(export_all).


start() -> 
	gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).
stop()  -> 
	gen_server:call(?MODULE, stop).


add(?MODULE, Key, Value)	    -> gen_server:call(?MODULE, {insert, ?MODULE, Key, Value, erlang:localtime()}).
modify(?MODULE, Key, Value)		-> gen_server:call(?MODULE, {update, ?MODULE, Key, Value, erlang:localtime()}).
del(?MODULE, Key)				-> gen_server:call(?MODULE, {delete, ?MODULE, Key}).


init([]) -> 
	{ok, ets:new(?MODULE,[])}.


handle_call({insert,?MODULE, Key, Value}, _From, Tab) ->
    Reply = ets:insert(Tab, {?MODULE, Key, Value}),
    {reply, Reply, Tab};
handle_call({update,?MODULE, Key, Value}, _From, Tab) ->
    Reply = ets:insert(Tab, {?MODULE, Key, Value}),
    {reply, Reply, Tab};
handle_call({delete, ?MODULE, Key}, _From, Tab) ->
    Reply = ets:delete(Tab, ?MODULE, Key),
    {reply, Reply, Tab};
handle_call(stop, _From, Tab) ->
    {stop, normal, stopped, Tab}.

handle_cast(_Msg, State) -> 
	{noreply, State}.

handle_info(_Info, State) -> 
	{noreply, State}.

terminate(_Reason, _State) -> 
	ok.
	
code_change(_OldVsn, State, Extra) -> 
	{ok, State}.