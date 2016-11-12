-module(p4readfile).
-export([out/1]).

out(Name)->out({ok, <<>>}, Name).

out({ok, _}, Name)->file:read_file(Name).

