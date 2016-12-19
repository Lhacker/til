-module(gb_trees).
-compile(export_all).

main(_) ->
  T0 = gb_trees:empty(),
  T1 = gb_trees:enter(1, "a", T0),
  T2 = gb_trees:insert(2, "b", T1),
  io:format("~p~n~n", [T2]),

  io:format("~p~n", [gb_trees:lookup(2, T2)]),
  io:format("~p~n~n", [gb_trees:lookup(3, T2)]),

  io:format("~n").
