-module(records).
-compile(export_all).

% The truth is that we should use record declaration in one module.
-include("records.hrl").

admin_panel(#user{name=Name, group=admin}) ->
  Name ++ " is allowed!";
admin_panel(#user{name=Name}) ->
  Name ++ " is not allowed!".

adult_section(U = #user{}) when U#user.age >= 18 ->
  allowed;
adult_section(_) ->
  forbidden.

%% test_main
main(_) ->
  Ferd=#user{id=1, name="ferd", group=admin, age=96},
  You=#user{id=2, name="you", group=users, age=13},
  io:format("~p~n", [Ferd]),
  io:format("~p~n", [Ferd#user.name]),
  NewFerd = Ferd#user{age=24},
  io:format("~p~n", [NewFerd]),
  io:format("~p~n", [admin_panel(NewFerd)]),
  io:format("~p~n", [admin_panel(You)]),
  io:format("~p~n", [adult_section(NewFerd)]),
  io:format("~p~n", [adult_section(You)]).
