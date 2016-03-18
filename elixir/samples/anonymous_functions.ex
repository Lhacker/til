add = fn a, b -> a + b end
IO.puts(is_function(add))
IO.puts(is_function(add, 2))
IO.puts(is_function(add, 1))
IO.puts(add.(1, 2))


add_two = fn a -> add.(a, 2) end
IO.puts(add_two.(2))
