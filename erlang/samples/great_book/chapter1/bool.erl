-module(bool).

%%% test main
main(_) ->
  io:format("true and false = ~p~n", [true and false]),
  io:format("true or false = ~p~n", [true or false]),
  io:format("true xor false = ~p~n", [true xor false]),
  io:format("true andalso false = ~p~n", [true andalso false]),
  io:format("true orelse false = ~p~n", [true orelse false]).
