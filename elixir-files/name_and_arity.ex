defmodule NameArity do
	def hello() do 
		"Simple Hello!";
	def hello(name) do 
		"Hello with " <> name;
	def hello(name, age) do 
		"Hello name: #{name} with age #{age}"
end