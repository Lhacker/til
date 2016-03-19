defprotocol Blank do
  @fallback_to_any true
  @doc "Returns true if data is considered blank/empty"
  def blank?(data)
end

# @fallback_to_any true時に有効
defimpl Blank, for: Any do
  def blank?(_), do: false
end

defimpl Blank, for: Integer do
  def blank?(_), do: false
end

defimpl Blank, for: List do
  def blank?([]), do: true
  def blank?(_), do: false
end

defimpl Blank, for: Map do
  def blank?(map), do: map_size(map) == 0
end

defimpl Blank, for: Atom do
  def blank?(false), do: true
  def blank?(nil), do: true
  def blank?(_), do: false
end

# test
IO.inspect Blank.blank?(0)
IO.inspect Blank.blank?([])
IO.inspect Blank.blank?([1, 2, 3])
IO.inspect Blank.blank?("hoge")
