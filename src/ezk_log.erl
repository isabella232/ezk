%% -------------------------------------------------------------------
%%
%% ezk_log: Used to log errors in a uniform way.
%%
%% Copyright (c) 2011 Marco Grebe. All Rights Reserved.
%% Copyright (c) 2011 global infinipool GmbH.  All Rights Reserved.
%%
%% This file is provided to you under the Apache License,
%% Version 2.0 (the "License"); you may not use this file
%% except in compliance with the License.  You may obtain
%% a copy of the License at
%%
%%   http://www.apache.org/licenses/LICENSE-2.0
%%
%% Unless required by applicable law or agreed to in writing,
%% software distributed under the License is distributed on an
%% "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
%% KIND, either express or implied.  See the License for the
%% specific language governing permissions and limitations
%% under the License.
%%
%% -------------------------------------------------------------------

-module(ezk_log).
-export([put/3, put/2]).

%%
%% Determines what kind of messages should be logged.
%%   0 - nothing
%%   1 - important things
%%   2 - even more things
%%   3 - most things
%%   4 - also heartbeats
-define(LEVEL, 3).

put(NeededLevel, Message) ->
    put(NeededLevel, Message, []).

put(NeededLevel, Message, Parameters) ->
    case NeededLevel =< ?LEVEL of
        true -> error_logger:info_msg("[ezk_log]: " ++ Message ++ "~n", Parameters);
        false -> ok
    end.
