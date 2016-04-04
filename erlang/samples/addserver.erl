-module(addserver).
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
  link(Pid),
  handler_loop(Pid).

handler_loop(Pid) ->
  receive
    Message ->
      Pid ! Message,
      handler_loop(Pid)
  end.

%% 1> Pid = addserver:start_server().
%% 2> Handler = addserver:start_handler(Pid).
%% 3> Handler ! {add, 3, 8}
%% 4> is_process_alive(Handler).
%% 
%% 5> Handler ! {add, dog, cat}
%% 6> is_process_alive(Handler).
