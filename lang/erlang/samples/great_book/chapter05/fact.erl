-module(math).
-export([fact/1, main/1]).

fact(N) when N >= 0 -> fact(N, 1).

fact(0, Acc) -> Acc;
fact(N, Acc) when N > 0 -> fact(N - 1, N * Acc).

%% test main
main(_) ->
  io:format("~p~n", [fact(0)]),
  io:format("~p~n", [fact(1)]),
  io:format("~p~n", [fact(2)]),
  io:format("~p~n", [fact(3)]),
  io:format("~p~n", [fact(4)]),
  io:format("~p~n", [fact(5)]),
  io:format("~p~n", [fact(50)]).
