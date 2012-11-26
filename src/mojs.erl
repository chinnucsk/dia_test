%%% @author Andreas Hasselberg <andreas.hasselberg@gmail.com>
%%% @copyright (C) 2012, Andreas Hasselberg
%%% @doc
%%%
%%% @end
%%% Created : 26 Nov 2012 by Andreas Hasselberg <andreas.hasselberg@gmail.com>

-module(mojs).

-export([run/0]).

add_one(A) -> A+1.

run() ->
    add_one(1), % 2
    add_one(1.0), %2.0
    add_one("a"). %run time error ... not good.
