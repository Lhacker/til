defmodule Math do
  def sum_list([h|t], accumlator) do
    sum_list(t, h + accumlator)
  end

  def sum_list([], accumlator) do
    accumlator
  end

  def double_each([h|t]) do
    [h * 2 | double_each(t)]
  end

  def double_each([]) do
    []
  end
end

IO.puts Math.sum_list([], 0)
IO.puts Math.sum_list([1, 2, 4, 6], 0)
IO.puts ""
IO.puts Math.double_each([])
IO.puts Math.double_each([2])
IO.puts Math.double_each([3, 5])
