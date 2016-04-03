-module(mymonitor).
-export([start_monitor/0, start_server/0]).

start_server() ->
  spawn(fun() -> server_loop() end).

server_loop() ->
  receive
    {add, X, Y} ->
      io:format("add: ~p~n", [X + Y]),
      server_loop()
  end.

start_monitor() ->
  spawn(fun() -> monitor_loop() end).

monitor_loop() ->
  receive
    {monitor, Pid} ->
      erlang:monitor(process, Pid),
      monitor_loop();

    {exit, Why} ->
      erlang:exit(Why);

    Other ->
      io:format("In monitor:~p~n", [Other]),
      monitor_loop()
  end.
