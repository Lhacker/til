-module(dolphins).
-compile(export_all).

dolphin1() ->
  receive
    do_a_flip ->
      io:format("How about no?~n");
    fish ->
      io:format("So long and thanks for all the fish!~n");
    _ ->
      io:format("Heh, we're smarter than you humans.~n")
  end.

dolphin2() ->
  receive
    {From, do_a_flip} ->
      From ! "How about no?";
    {From, fish} ->
      From ! "So long and thanks for all the fish!";
    _ ->
      io:format("Heh, we're smarter than you humans.~n")
  end.

dolphin3() ->
  receive
    {From, do_a_flip} ->
      From ! "How about no?",
      dolphin3();
    {From, fish} ->
      From ! "So long and thanks for all the fish!";
    _ ->
      io:format("Heh, we're smarter than you humans.~n"),
      dolphin3()
  end.

%% test main
main(_) ->
  Dolphin = spawn(dolphins, dolphin1, []),
  Dolphin ! "oh, hello dolphin!", %% fin process...
  Dolphin ! fish,

  Dolphin2 = spawn(dolphins, dolphin1, []), %% recreate process
  Dolphin2 ! fish,
  io:format("~n"),

  Dolphin3 = spawn(dolphins, dolphin2, []),
  Dolphin3 ! {self(), do_a_flip},
  io:format("~n").
