defmodule LousyCalculator do
  @typedoc """
  Just a number followed by a string.
  """
  @type number_with_remark :: {number, String.t}

  @spec add(number, number) :: number_with_remark
  def add(x, y), do: {x + y, "You need a calculator to do that?"}

  @spec multiply(number, number) :: number_with_remark
  def multiply(x, y), do: {x * y, "It is like addition on steroids."}
end

defmodule QuietCalculator do
  @spec add(number, number) :: number
  def add(x, y), do: make_quiet(LousyCalculator.add(x, y))

  @doc """
  multiply two values

  ## Example

      iex> QuietCalculator.multiply(1, 2)
      2
  """
  @spec multiply(number, number) :: number
  def multiply(x, y), do: make_quiet(LousyCalculator.multiply(x, y))

  @spec make_quiet(LousyCalculator.number_with_remark) :: number
  defp make_quiet({num, _}), do: num
end

IO.inspect QuietCalculator.add(2, 3)
IO.inspect QuietCalculator.multiply(2, 3)
