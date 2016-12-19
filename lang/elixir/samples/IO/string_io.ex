{:ok, pid} = StringIO.open("hello")
IO.inspect IO.read(pid, 2)
IO.inspect IO.read(pid, 3)
