## how to execute main(_) function.

```erlang:hoge.erl
-module(hoge).

main(_) ->
  io.format("~p~n", ["hello, world"]).
```

```
escript hoge.erl
```
