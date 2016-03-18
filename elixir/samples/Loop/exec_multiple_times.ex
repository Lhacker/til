defmodule For do
  def exec_multiple_times(fun, n) when n <= 1 do
    fun.()
  end

  def exec_multiple_times(fun, n) do
    fun.()
    exec_multiple_times(fun, n - 1)
  end
end

For.exec_multiple_times(fn -> IO.puts("hoge") end, 3)
