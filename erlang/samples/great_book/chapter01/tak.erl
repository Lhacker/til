-module(tak).
-export([tak/3]).

tak(X, Y, Z) when X =< Y -> Z;
tak(X, Y, Z) -> tak(tak(X-1,Y,Z), tak(Y-1,Z,X), tak(Z-1,X,Y)).
