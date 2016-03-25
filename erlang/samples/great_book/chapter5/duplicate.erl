-module(duplicate).
-export([duplicate/2, main/1]).

duplicate(N, X) -> duplicate(N, X, []).

duplicate(0, X, List) -> List;
duplicate(N, X, List) when N > 0 -> duplicate(N-1, X, [X|List]).

%% test main
main(_) ->
  io:format("~p~n", [duplicate(0, "hoge")]),
  io:format("~p~n", [duplicate(1, "hoge")]),
  io:format("~p~n", [duplicate(2, "hoge")]),
  io:format("~p~n", [duplicate(3, ["hoge"])]).
