-module(l19).
-export([pack/1]).


pack([[H1|T]|[H2|T]])->
	pack([H1|[H2|T]]);

pack([[H1|T]|[H2|[]]])->
	[H2,pack([H1|T])];

pack([[H1|T1]|[H2|T2]])->
	[[H1|T1],pack([H2|T2])];

pack([H|[H|T]])->
	[H|pack([H|T])];

pack([])->
	[].
