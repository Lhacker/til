try do
  raise "oops"
rescue
  e in ArgumentError -> IO.inspect "ArgumentError... #{inspect e}"
  e in RuntimeError -> IO.inspect "RuntimeError... #{inspect e}"
  e -> IO.inspect "else #{inspect e}"
end

