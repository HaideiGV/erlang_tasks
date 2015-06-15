-module(p23).
-export([sp/2]).


sp(BinStr,Div)->
	BinDiv=list_to_binary(Div),
	Size=byte_size(Div),
	sp(BinStr,BinDiv,Size,<<>>,[]).


sp(BinStr,Div,Size,word,Acc)-> 
	
	case BinStr of
		<<Div:Size/binary,Rest/binary>> -> 
			sp(Rest,Div,Size,<<>>,[word|Acc]);
		
		<<X,Rest/binary>> -> 
			sp(Rest,Div,Size,<<word/binary,X>>,Acc);
		
		<<>> -> 
			list:reverse([word|Acc])
	end.	