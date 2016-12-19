-module(spawn_sample).
-compile(export_all).

main(_) ->
  F = fun() -> 2 + 2 end,
  io:format("~p~n~n", [spawn(F)]),

  G = fun(X) -> timer:sleep(10), io:format("~p~n", [X]) end,
  [spawn(fun() -> G(X) end) || X <- lists:seq(1,10)],

  io:format("~n").
