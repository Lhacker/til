-module(ifdef_sample).
-compile([debug_info, export_all]).

-ifdef(DEBUGMODE).
-define(DEBUG(S), io:format("dbg: " ++ S ++ "~n")).
-else.
-define(DEBUG(S), ok).
-endif.

%% test main
%% > c(ifdef_sample, [{d, 'DEBUGMODE'}]).
main(_) ->
  ?DEBUG("dev-env test").
