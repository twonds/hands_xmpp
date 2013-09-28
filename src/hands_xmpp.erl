-module(hands_xmpp).

%% API.
-export([start/0]).
-export([start_xmpp/4]).
-export([stop_listener/1]).


%% @doc Start up applications
-spec start() ->
                   ok.
start() ->
	ok = application:start(ranch),
	ok = application:start(hands_xmpp).


%% @doc Start an XMPP listener.
-spec start_xmpp(integer(), any(), any()) -> {ok, pid()}.
start_xmpp(NbAcceptors, TransOpts, ProtoOpts)
		when is_integer(NbAcceptors), NbAcceptors > 0 ->
	ranch:start_listener(hands_xmpp, NbAcceptors,
		ranch_tcp, TransOpts, hands_xmpp_protocol, ProtoOpts).

%% @doc Stop a ranch listener.
-spec stop_listener(any()) -> ok.
stop_listener(Ref) ->
	ranch:stop_listener(Ref).

