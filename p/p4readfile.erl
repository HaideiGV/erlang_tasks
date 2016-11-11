-module(p4readfile).
-export([file_out/1]).

file_out(file_name)->{ok, Bin}=file:read_file(file_name).

