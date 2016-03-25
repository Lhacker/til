-module(quicksort).
-export([quicksort/1, main/1]).

quicksort([]) -> [];
quicksort([P|T]) ->
  {Smaller, Larger} = partition(P, T, [], []),
  quicksort(Smaller) ++ [P] ++ quicksort(Larger).

partition(_, [], L, R) -> {L, R};
partition(P, [H|T], L, R) when H < P ->
  partition(P, T, [H|L], R);
partition(P, [H|T], L, R) when H >= P ->
  partition(P, T, L, [H|R]).

%% list comprehention version.
lc_quicksort([]) -> [];
lc_quicksort([P|T]) ->
  lc_quicksort([X || X <- T, X < P]) ++
  [P] ++
  lc_quicksort([X || X <- T, X >= P]).

%% test main
main(_) ->
  io:format("~p~n", [quicksort([])]),
  io:format("~p~n", [quicksort([1])]),
  io:format("~p~n", [quicksort([2,1,3,7,6,5,8])]),
  io:format("~p~n", [lc_quicksort([2,1,3,7,6,5,8])]).
