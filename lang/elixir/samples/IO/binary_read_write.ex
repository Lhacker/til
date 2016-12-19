{:ok, file} = File.open "hello.md", [:write]
IO.binwrite file, "hello, world!"
File.close file

case File.read "hello.md" do
  {:ok, text} -> IO.puts text
  {:error, message} -> IO.puts :stderr, message
end

# or
IO.puts File.read! "hello.md"
