-module(no_warnings).

-export([func2/1]).

func1(A) when is_integer(A) -> A;
func1(A) -> {not_int, A}.

-spec func2(any()) -> any().
func2(A) ->
    case func1(A) of
        {not_int, Int} when is_integer(Int) ->
            %% This is not dead code according to dialyzer
            %% The return type of func1/1 is integer | {not_int, any()}.
            %% {not_int, any()} matches {not_int, integer()}.
            woho;
        Any -> Any
    end.

