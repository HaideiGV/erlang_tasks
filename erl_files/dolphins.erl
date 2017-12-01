-module(dolphins).
-compile(export_all).

dol() ->
  receive
    do_a_flip ->
      io:format("How about no?~n");
    fish ->
      io:format("Fish~n");
    _ ->
      io:format("Other")
  end.
