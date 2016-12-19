if true do
  IO.puts "true"
else
  IO.puts "won't be seen"
end

unless nil do
  IO.puts "unless nil"
end

IO.puts if true, do: 1 + 2

IO.puts if true, do: (
  a = 1 + 2
  a + 10
)
