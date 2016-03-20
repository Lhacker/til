regex = ~r/foo|bar/
IO.puts "foo" =~ regex
IO.puts "bat" =~ regex

IO.puts "HELLO" =~ ~r/hello/i
