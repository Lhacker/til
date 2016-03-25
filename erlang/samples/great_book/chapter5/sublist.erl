-module(sublist).
-export([sublist/2, main/1]).

sublist(L, N) -> sublist(L, N, []).

sublist([], _, Acc) -> lists:reverse(Acc);
sublist(_, 0, Acc) -> lists:reverse(Acc);
sublist([H|T], N, Acc) when N > 0 ->
  sublist(T, N-1, [H|Acc]).

%% test main
main(_) ->
  io:format("~p~n", [sublist("", 1)]),
  io:format("~p~n", [sublist("hoge", 0)]),
  io:format("~p~n", [sublist("hoge", 1)]),
  io:format("~p~n", [sublist("hoge", 2)]),
  io:format("~p~n", [sublist([1,2,3,4], 5)]).
