1..1000
  |> Enum.map(&(&1 * &1))
  |> Enum.filter(&(&1 > 40))
  |> IO.inspect(limit: :infinity)
