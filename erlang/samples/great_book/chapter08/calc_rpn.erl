-module(calc_rpn).
-export([rpn/1, rpn_test/0]).

rpn(L) when is_list(L) ->
  [Res] = lists:foldl(fun rpn/2, [], string:tokens(L, " \n")),
  Res.

rpn("+", [X,Y|Stack]) -> [Y+X|Stack];
rpn("-", [X,Y|Stack]) -> [Y-X|Stack];
rpn("*", [X,Y|Stack]) -> [Y*X|Stack];
rpn("/", [X,Y|Stack]) -> [Y/X|Stack];
rpn("^", [X,Y|Stack]) -> [math:pow(Y, X)|Stack];
rpn("ln", [X|Stack]) -> [math:log(X)|Stack];
rpn("log10", [X|Stack]) -> [math:log10(X)|Stack];
rpn("sum", Stack) -> [lists:sum(Stack)];
rpn("prod", Stack) -> [lists:foldl(fun(X, Acc) -> X * Acc end, 1, Stack)];
rpn(X, Stack) -> [read(X)|Stack].

read(X) ->
  case string:to_float(X) of
    {error, no_float} -> list_to_integer(X);
    {F, _} -> F
  end.

rpn_test() ->
  5 = rpn("2 3 +"),
  87 = rpn("90 3 -"),
  -4 = rpn("10 4 3 + 2 * -"),
  -2.0 = rpn("10 4 3 + 2 * - 2 /"),
  ok = try
    rpn("90 34 12 33 55 66 + * - +")
  catch
    error:{badmatch, _} -> ok
  end,
  4037 = rpn("90 34 12 33 55 66 + * - + -"),
  8.0 = rpn("2 3 ^"),
  true = math:sqrt(2) == rpn("2 0.5 ^"),
  true = math:log(2.7) == rpn("2.7 ln"),
  true = math:log10(2.7) == rpn("2.7 log10"),
  50 = rpn("10 10 10 20 sum"),
  10.0 = rpn("10 10 10 20 sum 5 /"),
  1000.0 = rpn("10 10 20 0.5 prod"),
  ok.
