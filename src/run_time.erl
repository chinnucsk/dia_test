-module(run_time).

-export([run/0]).

-spec run() -> number().

add_one(A) -> A+1.

yeah(A) -> add_one(A).

run() ->
    yeah(1), % 2
    yeah(1.0), %2.0
    yeah("a"). %run time error.
