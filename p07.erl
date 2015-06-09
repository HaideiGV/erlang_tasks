-module(p07).
-export([ln/1]).
ln([])->[];
ln([[]|T])->ln(T);
ln([[H|T]|T2])->ln([H|[T|T2]]);
ln([H|T])->[H|ln(T)].