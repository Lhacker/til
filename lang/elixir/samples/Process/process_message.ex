defmodule Hoge do
  def say do
    receive do
      {sender, msg} ->
        send sender, {:ok, "Hello #{msg}"}
    end
  end
end

child_pid = spawn(Hoge, :say, [])
send child_pid, {self, "world!"}

receive do
  {:ok, message} ->
    IO.puts message
end

