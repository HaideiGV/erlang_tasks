-module(sp).
-export([sp/2]).


sp(BinStr,Div)->
	BinDiv=list_to_binary(Div),
	Size=bit_size(term_to_binary(Div)),
	sp(BinStr,BinDiv,Size,<<>>,[]).


sp(BinStr,BinDiv,Size,Word,Acc)->
	case BinStr of
		<<BinDiv:Size/binary,Rest/binary>> -> 
			sp(Rest,BinDiv,Size,<<>>,[Word|Acc]);
		
		<<X,Rest/binary>> -> 
			sp(Rest,BinDiv,Size,<<Word/binary,X>>,Acc);
		
		<<>> -> 
			lists:reverse([Word|Acc])
	end.	