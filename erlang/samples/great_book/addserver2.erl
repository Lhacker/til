-module(addserver2).
-export([start_server/0, start_handler/1]).

start_server() ->
  spawn(fun() -> server_loop() end).

server_loop() ->
  receive
    {add, X, Y} ->
      io:format("~p~n", [X + Y]),
      server_loop()
  end.

start_handler(Pid) ->
  spawn(fun() -> handler(Pid) end).

handler(Pid) ->
  process_flag(trap_exit, true),
  link(Pid),
  handler_loop(Pid).

handler_loop(Pid) ->
  receive
    {send, Message} ->
      Pid ! Message,
      handler_loop(Pid);

    Other ->
      io:format("Receive in handler : ~p~n", [Other]),
      handler_loop(Pid)
  end.
