map = %{:a => 1, 2 => :b}
IO.puts map[:a]
IO.puts map.a
IO.puts map[2]
IO.puts map[:c] # nil
IO.puts ""
IO.puts Map.get(%{:a => 1, 2 => :b}, :a)
#IO.puts Map.to_list(%{:a => 1, 2 => :b})
#IO.puts Dict.put(%{:a => 1, 2 => :b}, :c, 3)
