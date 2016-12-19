cond do
  2 + 2 == 5 ->
    IO.puts "This will not be true"
  2 * 2 == 3 ->
    IO.puts "Not this"
  1 + 1 == 2 ->
    IO.puts "But this will"
  true ->
    IO.puts "This is always true"
end

cond do
  hd([1,2,3]) ->
    IO.puts "1 is considered as true"
end
