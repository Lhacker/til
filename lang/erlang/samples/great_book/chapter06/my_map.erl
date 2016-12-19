-module(my_map).
-export([map/2, main/1]).

map(F, L) -> lists:reverse(map(F, L, [])).

map(_, [], List) -> List;
map(F, [H|T], List) -> map(F, T, [F(H)|List]).

%% test main
main(_) ->
  io:format("map(fun(X) -> X + 1 end, [1,2,3,4]) -> ~p~n", [map(fun(X) -> X + 1 end, [1,2,3,4])]).
