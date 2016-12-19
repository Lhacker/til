-module(binary_comprehension).

main(_) ->
  io:format("~p~n~n", [<< <<X>> || <<X>> <= <<1,2,3,4,5>>, X rem 2 == 0 >>]),
  Pixels = <<213,45,132,64,76,32,76,0,0,234,32,15>>,
  RGB = [ {R, G, B} || <<R:8, G:8, B:8>> <= Pixels],
  io:format("~p~n", [RGB]).
