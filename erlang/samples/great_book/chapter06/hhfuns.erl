-module(hhfuns).
-compile([export_all]).

one() -> 1.
two() -> 2.

add(FunX, FunY) -> FunX() + FunY().

%% test main
main(_) ->
  io:format("~p~n", [hhfuns:add(fun hhfuns:one/0, fun hhfuns:two/0)]).
