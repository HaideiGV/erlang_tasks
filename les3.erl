-module(les3).
-export([get_users/0, get_females/1, get_id_name/1, get_female_id_name/1, get_stat/1, split_by_age/1]).	


get_users()->
	[{user, 1, "Bob", male, 22},
	 {user, 2, "Helen", female, 14},
	 {user, 3, "Bill", male, 14},
	 {user, 4, "Kate", female, 18}
	
	].


get_females(Users)->
	lists:filter(fun({user, _, _, Gender,_}) -> Gender =:= female end, Users).

get_id_name(Users)->
	lists:map(fun({user, Id, Name, _, _})-> {Id, Name} end, Users).


get_female_id_name(Users)->
	%Females = get_females(Users),
	%lists:map(fun({user, Id, Name,_, _})-> {Id, Name} end, Females).   or other variant   get_id_name(Females).

	lists:filtermap(fun({user, _Id, _Name, male, _})-> false;
					   ({user, Id, Name, female, _})-> {true, {Id, Name}}
					end, Users). 


get_stat(Users)->
	lists:foldl(fun({user, _, _, female, Age}, {NumFemale, NumMale, TotalUsers, TotalAge })->
						{NumFemale+1, NumMale, TotalUsers+1, TotalAge+Age};
					({user, _, _, male, Age}, {NumMale, NumFemale, TotalUsers, TotalAge})->
						{NumFemale, NumMale+1, TotalUsers+1, TotalAge+Age}
				end,
				{0,0,0,0},
				Users).

split_by_age(Users)->
	lists:foldl(fun({user,_,_,_,Age} = User, {Acc1, Acc2})->
							if
								Age < 18 ->
									{[User |Acc1], Acc2};
								true ->
									{Acc1, [User|Acc2]}
							end
				end,
				{[],[]},
				Users).

