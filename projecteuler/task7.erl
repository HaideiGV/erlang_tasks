-module(task7).
-export([isPrime/1, prime/1]).


%% Return true if N is prime
isPrime(N)->case length(lists:filter(fun(X)-> N rem X =:= 0 end, lists:seq(2, round(math:sqrt(N))))) of
	0->true;
	_->false
end.


prime(NthPrime)->prime(NthPrime, 2, 0).


prime(NthPrime, CurrentNumber, CountPrimes) when CountPrimes =:= NthPrime ->CurrentNumber-1;

prime(NthPrime, CurrentNumber, CountPrimes)->case isPrime(CurrentNumber) of
	true->prime(NthPrime, CurrentNumber+1, CountPrimes+1);
	_->prime(NthPrime, CurrentNumber+1, CountPrimes)
end.

