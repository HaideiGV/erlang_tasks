-module(p4readfile).
-export([out/1, out_by_line/1]).


%% Return tuple {ok, Bitsring} 
out(Name)->out({ok, <<>>}, Name).

out({ok, _}, Name)->file:read_file(Name).


%%%% Print file line by line
out_by_line(Name)->out_by_line({ok, <<>>}, Name).


%out_by_line({ok, <<>>}, _)->ok;

%out_by_line({ok, <<Word:8, Rest>>}, _)->out_by_line({ok, <<Rest>>}, _);

out_by_line({ok, _}, Name)->out_by_line(file:read_file(Name), _);

out_by_line({ok, Bin}, _)->binary:replace(Bin, <<"\n">>, <<" ">>).
