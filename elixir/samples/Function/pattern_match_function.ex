#defmodule Math do
#  def zero?(0) do
#    true
#  end
#
#  def zero?(x) when is_number(x) do
#    false
#  end
#end
defmodule Math do
  def zero?(0), do: true
  def zero?(x) when is_number(x), do: false
end

IO.puts Math.zero?(0)
IO.puts Math.zero?(1)
#IO.puts Math.zero?([1, 2, 3])
