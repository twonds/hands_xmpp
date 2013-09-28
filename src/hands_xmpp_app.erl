-module(hands_xmpp_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    hands_xmpp:start_xmpp(1, [], []),
    hands_xmpp_sup:start_link().

stop(_State) ->
    ok.
