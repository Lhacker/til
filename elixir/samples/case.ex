case {1, 2, 3} do
  {4, 5, 6} ->
    IO.puts "This clause won't match"
  {1, x, 3} ->
    IO.puts "This clause will match and bind x to 2 in this clause"
    IO.puts x
  _ ->
    IO.puts "This clause would match any value"
end

# IO.puts x # will raise error

x = 1

y = case 10 do
  ^x -> "won't match"
  _ -> "will match"
end

IO.puts y
