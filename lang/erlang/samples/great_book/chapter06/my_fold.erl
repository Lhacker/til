-module(my_fold).
-export([fold/3]).

fold(_, Acc, []) -> Acc;
fold(F, Acc, [H|T]) -> fold(F, F(Acc, H), T).

%% test main
main(_) ->
  F = fun(Acc, X) -> Acc * X end,
  Numbers = lists:seq(1, 5),
  io:format("~p~n", [fold(F, 1, Numbers)]).
