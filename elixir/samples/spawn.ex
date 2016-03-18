defmodule Hoge do
  def say(message) do
    IO.puts "Hello #{message}"
  end
end

child_pid = spawn(Hoge, :say, ["world"])
