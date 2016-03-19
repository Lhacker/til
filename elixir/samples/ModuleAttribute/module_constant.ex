defmodule MyServer do
  @initial_state %{host: "147.0.0.1", port: 3456}
  IO.inspect @initial_state # only output at compilation
end

defmodule MyServer2 do
  @my_data 14
  def first_data, do: @my_data
  @my_data 13
  def second_data, do: @my_data
end
IO.inspect MyServer2.first_data
IO.inspect MyServer2.second_data
