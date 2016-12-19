{:ok, file} = File.open "hello.md", [:utf8, :write]
try do
  IO.write file, "olá"
  raise "oops, something went wrong"
after
  File.close(file)
end
