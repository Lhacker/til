-module(zip).
-export([zip/2, main/1]).

zip(La, Lb) -> zip(La, Lb, []).

zip([], _, Acc) -> lists:reverse(Acc);
zip(_, [], Acc) -> lists:reverse(Acc);
zip([Ha|Ta], [Hb|Tb], Acc) ->
  zip(Ta, Tb, [{Ha, Hb}|Acc]).

%% test main
main(_) ->
  io:format("~p~n", [zip([], [1,2,3,4])]),
  io:format("~p~n", [zip([a, b, c, d], [])]),
  io:format("~p~n", [zip([a, b, c, d], [1,2,3,4])]),
  io:format("~p~n", [zip([a, b, c, d, e], [1,2,3,4])]),
  io:format("~p~n", [zip([a, b, c, d], [1,2,3,4,5])]).

