words(Bin)->lists:reverse(words(Bin,<<>>,[])).
words(<<" ",Rest/binary>>,Accbin,Acc)->
	words(Rest,<<>>,[Accbin|Acc]);
words(<<X,Rest/binary>>,Accbin,Acc)->words(Rest,<<Acc/binary,X>>,Acc);
words(<<>>,Accbin,Acc)->[Accbin|Acc].