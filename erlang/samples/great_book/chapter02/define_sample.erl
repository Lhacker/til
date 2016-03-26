-module(define_sample).
-compile([debug_info, export_all]).

-define(HOUR, 3600). % in seconds
-define(sub(X, Y), X - Y).

main(_) ->
  io:format("~p~n", [?HOUR]),
  io:format("~p~n", [?sub(3, 1)]).
