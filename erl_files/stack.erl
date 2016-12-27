-module(stack).
-export([
	pop/1, 
	push/2, 
	new/0, 
	peek/1, 
	stack_size/1,
	isEmpty/1
]).

%% Return new empty list
new()->[].

%% Return tuple with first element and new list without first element
pop([H|T])->{H, T}.

%% Add new element into head of stack
push(L, Elem)->[Elem| L].

%% Return tuple with first element and list with first element
peek([H|T])->{H, [H|T]}.

%% Return size of stack
stack_size(L)->stack_size(L, 0).

stack_size([], Length)->Length;
stack_size([H|T], Length)->stack_size(T, Length+1).

%% Return true if stack is empty and false otherwise
isEmpty(L)->case stack_size(L) of
	0->true;
	_->false
end.
