-module(dead_code).

-export([hmm/1]).

-spec hmm(integer()) -> [integer()].
hmm(A) ->
    mapper(lists:seq(1, A)).

mapper([]) -> [];
mapper([H|T]) -> [math:pow(2, H)|mapper(T)];
%% Dialyser figures out that the following clause is dead code.
%% This function is called with "proper lists" in all places.
mapper(A) when is_tuple(A) -> mapper(tuple_to_list(A)).
