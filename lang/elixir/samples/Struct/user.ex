defmodule User do
  defstruct name: "john", age: 27
end

#IO.inspect %User{}
#IO.inspect is_map(%User{}) # true
#IO.inspect %{User | age: 30}
