-module(sets).
-compile(export_all).

main(_) ->
  S0 = sets:from_list([1, 2, 3, 4]),
  S1 = sets:add_element(5, S0),
  S2 = sets:add_element(5, S1),
  io:format("~p~n~n", [S2]),

  OtherS0 = sets:new(),
  OtherS1 = sets:add_element(6, OtherS0),
  OtherS2 = sets:add_element(7, OtherS1),
  io:format("~p~n~n", [sets:union(S2, OtherS2)]),

  io:format("~n").
