-module(records_demo).
-export([new/0,new/3,get_name/1,set_name/2,get_field_idx/1,fields/0]).
-record(person,{name="Joe",gender,age=56}).
new()->
    #person{}.

new(Name,Gender,Age)->
    #person{name=Name,gender=Gender,age=Age}.

get_name(Record)->
    Record#person.name.

set_name(Record,Name)->
    Record#person{name=Name}.

get_field_idx(name)->
    #person.name;
get_field_idx(gender)->
    #person.gender.

fields()->
    record_info(fields,person).