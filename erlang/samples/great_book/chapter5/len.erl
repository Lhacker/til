-module(len).
-export([len/1, main/1]).

len(L) -> len(L, 0).

len([], Acc) -> Acc;
len([_|T], Acc) -> len(T, Acc + 1).

%% test main
main(_) ->
  io:format("~p~n", [len([])]),
  io:format("~p~n", [len([1])]),
  io:format("~p~n", [len([1,2])]),
  io:format("~p~n", [len("123")]).
