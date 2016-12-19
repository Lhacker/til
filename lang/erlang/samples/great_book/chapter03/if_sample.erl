-module(if_sample).
-export([help_me/1]).

help_me(Animal) ->
  Talk = if Animal == cat -> "meow";
            Animal == beef -> "mooo";
            Animal == dog -> "bark";
            Animal == tree -> "bark";
            true -> "fgdadfgna"
         end,
  {Animal, "says " ++ Talk ++ "!"}.
