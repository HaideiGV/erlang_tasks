-module(p23).
-export([sp/2]).


sp(BinStr,Div)->
	BinDiv=list_to_binary(Div),
	Size=bit_size(term_to_binary(Div)),
	sp(BinStr,BinDiv,Size,<<>>,[]).


sp(BinStr,Div,Size,Word,Acc)->
	case BinStr of
		<<Div:Size/binary,Rest/binary>> -> 
			sp(Rest,Div,Size,<<>>,[Word|Acc]);
		
		<<X,Rest/binary>> -> 
			sp(Rest,Div,Size,<<Word/binary,X>>,Acc);
		
		<<>> -> 
			lists:reverse([Word|Acc])
	end.	