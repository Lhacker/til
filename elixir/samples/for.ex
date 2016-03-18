IO.inspect for x <- 1..10, x * x < 40, do: x * x
IO.inspect (for x <- 1..10, x * x < 40 do
  x * x
end)
