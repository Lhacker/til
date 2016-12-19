try do
  Enum.each -50..50, fn(x) ->
    if rem(x, 13) == 0, do: throw(x)
  end
catch
  x -> IO.inspect "Got #{x}"
end

# same as above process
IO.inspect Enum.find(-50..50, &rem(&1, 13) == 0)
