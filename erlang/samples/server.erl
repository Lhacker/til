-module(server).
-export([start1/0, start2/0]).

start1() ->
  spawn(fun() -> loop() end).

start2() ->
  spawn(fun() -> reg() end).

reg() ->
  register(serv2, self()),
  loop().

loop() ->
  receive
    {add, X, Y} ->
      io:format("~p + ~p = ~p~n", [X, Y, X+Y]),
      loop();

    {mult, X, Y} ->
      io:format("~p * ~p = ~p~n", [X, Y, X*Y]),
      loop()
  end.
