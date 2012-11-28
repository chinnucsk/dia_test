%%% @author Andreas Hasselberg <andreas.hasselberg@gmail.com>
%%% @copyright (C) 2012, Andreas Hasselberg
%%% @doc
%%%
%%% @end
%%% Created : 28 Nov 2012 by Andreas Hasselberg <andreas.hasselberg@gmail.com>

-module(no_warnings).

-export([func2/1]).


func1(A) when is_integer(A) -> A;
func1(A) -> {not_int, A}.

-spec func2(any()) -> any().
func2(A) ->
    case func1(A) of
        {not_int, Int} when is_integer(Int) ->
            %% this is not dead code according to dialyzer
            woho;
        Any -> Any
    end.

