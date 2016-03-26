-module(basic_operator).

main(_) ->
  io:format("5 =:= 5 => ~p~n", [5 =:= 5]),
  io:format("5 =:= 5.0 => ~p~n", [5 =:= 5.0]),
  io:format("1 =:= 0 => ~p~n", [1 =:= 0]),
  io:format("1 =/= 0 => ~p~n", [1 =/= 0]),
  io:format("1 =/= 1.0 => ~p~n", [1 =/= 1.0]),
  io:format("5 == 5.0 => ~p~n", [5 == 5.0]),
  io:format("5 /= 5.0 => ~p~n", [5 /= 5.0]).
