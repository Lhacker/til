-module(list_comprehension).

main(_) ->
  io:format("~p~n", [[2*N || N <- [1,2,3,4]]]),
  io:format("~p~n", [[X || X <- [1,2,3,4,5,6,7,8,9,10], X rem 2 =:= 0]]).
