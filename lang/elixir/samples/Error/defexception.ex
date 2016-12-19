defmodule MyError do
  defexception message: "default message"
end

#raise MyError
raise MyError, message: "custom message"
