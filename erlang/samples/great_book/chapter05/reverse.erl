-module(reverse).
-export([reverse/1, main/1]).

reverse(L) -> reverse(L, []).

reverse([], R) -> R;
reverse([H|T], R) -> reverse(T, [H|R]).

%% test main
main(_) ->
  io:format("~p~n", [reverse("")]),
  io:format("~p~n", [reverse("hoge")]),
  io:format("~p~n", [reverse([1,2,3,4])]).
