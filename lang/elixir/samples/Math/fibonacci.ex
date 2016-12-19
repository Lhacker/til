Stream.unfold({1,1}, fn {f1, f2} -> {f1, {f2, f1 + f2}} end)
  |> Enum.take(10)
  |> IO.inspect
