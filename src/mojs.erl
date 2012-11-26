%%% @author Andreas Hasselberg <andreas.hasselberg@gmail.com>
%%% @copyright (C) 2012, Andreas Hasselberg
%%% @doc
%%%
%%% @end
%%% Created : 26 Nov 2012 by Andreas Hasselberg <andreas.hasselberg@gmail.com>

-module(mojs).

-export([run/0]).

-spec run() -> number().

add_one(A) -> A+1.

yeah(A) -> add_one(A).

run() ->
    yeah(1), % 2
    yeah(1.0), %2.0
    yeah("a"). %run time error ... not good.
