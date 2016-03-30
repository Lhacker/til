-module(queue_sample).
-compile(export_all).

main(_) ->
  Q0 = queue:from_list([1,2,3,4,5]),
  Q1 = queue:in(6, Q0),
  Q2 = queue:in(7, Q1),
  io:format("~p~n~n", [Q2]),

  Result = queue:out(Q2),
  Value = element(2, element(1, Result)),
  Q3 = element(2, Result),
  io:format("~p~n", [Value]),
  io:format("~p~n~n", [Q3]),

  io:format("~p~n", [queue:get(Q3)]),
  io:format("~p~n~n", [queue:get_r(Q3)]),

  io:format("~n").
