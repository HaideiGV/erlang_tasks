flat(L)->p05:revers(flat(L,[])).
flat([[_|_]=H|T],Acc)->Acc2=flat(H,Acc),flat(T,Acc2);
flat([[]|T],Acc)->flat(T,Acc);
flat([H|T],Acc)->flat(T,[H|Acc]);
flat([],Acc)->Acc.