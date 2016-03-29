-module(exceptions).
-compile([export_all]).

throws(F) ->
  try F() of
    _ -> ok
  catch
    % if you didn't specify error type, same as specifying 'throw'.
    Throw -> {throw, caught, Throw}
  end.

errors(F) ->
  try F() of
    _ -> ok
  catch
    error:Error -> {error, caught, Error}
  end.

exits(F) ->
  try F() of
    _ -> ok
  catch
    exit:Exit -> {exit, caught, Exit}
  end.

%% 1> c(exceptions).
%% {ok,exceptions}
%% 2> exceptions:throws(fun() -> throw(thrown) end).
%% {throw,caught,thrown}
%% 3> exceptions:throws(fun() -> erlang:error(pang) end).
%% ** exception error: pang
%%      in function  exceptions:throws/1 (exceptions.erl, line 5)

sword(1) -> throw(slice);
sword(2) -> erlang:error(cut_arm);
sword(3) -> exit(cut_leg);
sword(4) -> throw(punch);
sword(5) -> exit(cross_bridge).

black_knight(Attack) when is_function(Attack, 0) ->
  try Attack() of
    _ -> "None shall pass."
  catch
    throw:slice -> "It is but a scratch.";
    error:cut_arm -> "I've had worse.";
    exit:cut_leg -> "Come on you pansy!";
    _:_ -> "Just a flesh wound."
  end.

talk() -> io:format("hoge").

whoa() ->
  try
    talk(),
    _Knight = "None shall pass!",
    _Double = [N * 2 || N <- lists:seq(1, 100)],
    throw(up),
    _WillReturnThis = tequila
  of
    tequila -> "Hey, this worked!"
  catch
    Exception:Reason -> {caught, Exception, Reason}
  end.

im_impressed() ->
  try
    talk(),
    _Knight = "None shall pass!",
    _Doubles = [N * 2 || N <- lists:seq(1, 100)],
    throw(up),
    _WillReturnThis = tequila
  catch
    Exception:Reason -> {caught, Exception, Reason}
  end.

catcher(X, Y) ->
  case catch X/Y of
    {'EXIT', {badarith, _}} -> "oh no";
    N -> N
  end.
