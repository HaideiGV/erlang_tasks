split(BinStr,Div)->BinDiv=list_to_binary(Div),Size=byte_size(Div),split(BinStr,BinDiv,Size,<<>>,[]).
split(BinStr,Div,Size,word,Acc)-> 
	case BinStr of
		<<Div:Size/binary,Rest/binary>> -> split(Rest,Div,Size,<<>>,[word|Acc]);
		<<X,Rest/binary>> -> split(Rest,Div,Size,<<word/binary,X>>,Acc);
		<<>> -> reverse([word|Acc])
	end.	