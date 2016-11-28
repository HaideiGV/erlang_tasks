-module(task9).
-export([product/1]).

product(N)->product(N, 1, 1, 1, 1).

product(Number, A, B, C, Range)->if A*A+B*B =:= C*C