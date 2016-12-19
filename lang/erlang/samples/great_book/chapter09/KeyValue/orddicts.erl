-module(orddicts).
-compile(export_all).

main(_) ->
  D0 = orddict:new(),
  D1 = orddict:store(files, [], D0),
  D2 = orddict:append(files, f1, D1),
  D3 = orddict:append(files, f2, D2),
  D4 = orddict:append(files, f3, D3),
  io:format("~p~n~n", [orddict:fetch(files, D4)]),

  List = orddict:from_list([{1, "a"}, {2, "b"}, {3, "c"}]),
  io:format("~p~n~n", [List]),

  io:format("~p~n~n", [orddict:erase(1, List)]),

  io:format("~n").
