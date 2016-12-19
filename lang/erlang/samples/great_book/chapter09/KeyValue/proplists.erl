-module(proplists).
-compile(export_all).

main(_) ->
  List = [{1,"a"}, {1,"b"}, {{1,2},"c"}, {2,"d"}],
  io:format("~p~n", [proplists:get_value(1, List)]),
  io:format("~p~n", [proplists:get_value(3, List)]),
  io:format("~p~n~n", [proplists:get_value(3, List, "z")]),

  io:format("~p~n", [proplists:lookup(1, List)]),
  io:format("~p~n~n", [proplists:lookup(3, List)]),

  io:format("~p~n", [proplists:is_defined(1, List)]),
  io:format("~p~n~n", [proplists:is_defined(3, List)]),

  io:format("~p~n", [proplists:delete(1, List)]),
  io:format("~p~n~n", [List]),


  io:format("~p~n", [lists:keyreplace(1, 1, List, {1, "x"})]),
  io:format("~p~n~n", [List]),

  io:format("~n").
