-module(math_server).
-export([start/0, call/2]).

start() ->
  spawn(fun() -> loop() end).

call(Pid, Message) ->
  Pid ! {self(), Message},
  receive
    Return ->
      Return
  end.

loop() ->
  receive
    {From, {add, X, Y}} ->
      Z = X + Y,
      From ! Z,
      loop();

    {From, {mult, X, Y}} ->
      Z = X * Y,
      From ! Z,
      loop();

    {From, stop} ->
      io:format("stop server~n", []),
      From ! {ok, stop_server};

    {From, Other} ->
      io:format("~p is not supported. stop server~n", [Other]),
      From ! {get_unknown_type, server_killed}
  end.
