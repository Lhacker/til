-module(my_filter).
-export([remain_even/1, old_men/1, filter/2, main/1]).

%% only remain even value
remain_even(L) -> remain_even(L, []).

remain_even([], Acc) -> lists:reverse(Acc);
remain_even([H|T], Acc) when H rem 2 == 0 -> remain_even(T, [H|Acc]);
remain_even([_|T], Acc) -> remain_even(T, Acc).

%% only keep men older than 60
old_men(L) -> old_men(L, []).

old_men([], Acc) -> lists:reverse(Acc);
old_men([Person = {male,Age}|People], Acc) when Age > 60 ->
  old_men(People, [Person|Acc]);
old_men([_|People], Acc) ->
  old_men(People, Acc).

filter(Pred, L) -> filter(Pred, L, []).

filter(_, [], Acc) -> lists:reverse(Acc);
filter(Pred, [H|T], Acc) ->
  case Pred(H) of
    true -> filter(Pred, T, [H|Acc]);
    false -> filter(Pred, T, Acc)
  end.

%% test main
main(_) ->
  Numbers = lists:seq(1,10),
  People = [{male,45}, {female,67}, {male,66}, {female,12}, {unkown,174}, {male, 74}],
  io:format("~p~n", [remain_even(Numbers)]),
  io:format("~p~n", [old_men(People)]),
  io:format("~p~n", [filter(fun(X) -> X rem 2 == 0 end, Numbers)]).
