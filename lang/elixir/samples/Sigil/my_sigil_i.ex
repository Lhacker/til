defmodule MySigils do
  def sigil_i(string, []), do: String.to_integer(string)
end

defmodule Hoge do
  import MySigils
  IO.inspect ~i(13)
end
