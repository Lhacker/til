-module(tree).
-export([empty/0, insert/3, lookup/2, main/1]).

empty() -> {node, 'nil'}.

insert(NewKey, NewValue, {node, 'nil'}) -> {node, {NewKey, NewValue, empty(), empty()}};
insert(NewKey, _, {node, {Key, Value, Smaller, Larger}}) when NewKey == Key ->
  {node, {Key, Value, Smaller, Larger}};
insert(NewKey, NewValue, {node, {Key, Value, Smaller, Larger}}) when NewKey < Key ->
  {node, {Key, Value, insert(NewKey, NewValue, Smaller), Larger}};
insert(NewKey, NewValue, {node, {Key, Value, Smaller, Larger}}) when NewKey > Key ->
  {node, {Key, Value, Smaller, insert(NewKey, NewValue, Larger)}}.

lookup(_, {node, 'nil'}) -> undefined;
lookup(Key, {node, {K, Value, _, _}}) when Key == K -> {ok, Value};
lookup(Key, {node, {K, _, Smaller, _}}) when Key < K ->
  lookup(Key, Smaller);
lookup(Key, {node, {K, _, _, Larger}}) when Key > K ->
  lookup(Key, Larger).

%% test main
main(_) ->
  T1 = insert("Jim Woodland", "jim.woodland@gmail.com", empty()),
  T2 = insert("Mark Anderson", "i.am.a@hotmail.com", T1),
  Addresses = insert("Anita Bath", "abath@someuni.edu",
                   insert("Kevin Robert", "myfairy@yahoo.com",
                          insert("Wilson Longbrow", "longwil@gmail.com", T2))),
  io:format("Address = ~p~n~n", [Addresses]),
  io:format("~p~n", [lookup("Anita Bath", Addresses)]),
  io:format("~p~n", [lookup("Jacques Requin", Addresses)]).
