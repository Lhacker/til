string = ~s"""
this is
a heredoc string
"""
IO.inspect string

defmodule Hoge do
  @doc """
  Converts double-quotes to single-quotes.

  ## Examples

      iex> convert("\\\"foo\\\"")
      "'foo'"

  """
  def convert(string) do
    #nop
  end

  @doc ~S"""
  Converts double-quotes to single-quotes.

  ## Examples

      iex> convert("\"foo\"")
      "'foo'"

  """
  def convert2(string) do
    #nop
  end
end
