-module(game).
-export(export_all).


start()->
	spawn(fun()->loop([]) end).


