-module(dicts).
-compile(export_all).

main(_) ->
  D0 = dict:new(),
  D1 = dict:store(files, [], D0),
  D2 = dict:append(files, f1, D1),
  D3 = dict:append(files, f2, D2),
  D4 = dict:append(files, f3, D3),
  io:format("~p~n~n", [dict:fetch(files, D4)]),

  List = dict:from_list([{1, "a"}, {2, "b"}, {3, "c"}]),
  io:format("~p~n~n", [List]),

  io:format("~p~n~n", [dict:erase(1, List)]),

  io:format("~n").
