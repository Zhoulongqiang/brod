%%%
%%%   Copyright (c) 2014-2016, Klarna AB
%%%
%%%   Licensed under the Apache License, Version 2.0 (the "License");
%%%   you may not use this file except in compliance with the License.
%%%   You may obtain a copy of the License at
%%%
%%%       http://www.apache.org/licenses/LICENSE-2.0
%%%
%%%   Unless required by applicable law or agreed to in writing, software
%%%   distributed under the License is distributed on an "AS IS" BASIS,
%%%   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
%%%   See the License for the specific language governing permissions and
%%%   limitations under the License.
%%%

-ifndef(__BROD_INT_HRL).
-define(__BROD_INT_HRL, true).

-include("brod.hrl").
-include_lib("kafka_protocol/include/kpro.hrl").

-type consumer_option() :: begin_offset
                         | min_bytes
                         | max_bytes
                         | max_wait_time
                         | sleep_timeout
                         | prefetch_count.

%% common
-type hostname()         :: string().
-type portnum()          :: pos_integer().
-type endpoint()         :: {hostname(), portnum()}.
-type leader_id()        :: non_neg_integer().
-type client_config()    :: brod_client_config().
-type producer_config()  :: brod_producer_config().
-type consumer_config()  :: brod_consumer_config().
-type consumer_options() :: [{consumer_option(), integer()}].
-type client()           :: brod_client_id() | pid().
-type required_acks()    :: -1..1.
-type key()              :: kafka_key().
-type value()            :: kafka_value().
-type kv_list()          :: kafka_kv_list().
-type offset()           :: kafka_offset().
-type partition()        :: kafka_partition().
-type topic()            :: kafka_topic().
-type corr_id()          :: kpro:corr_id().

%% consumer groups
-type group_id()             :: kafka_group_id().
-type member_id()            :: kafka_group_member_id().
-type group_config()         :: brod_group_config().

-record(socket, { pid     :: pid()
                , host    :: string()
                , port    :: integer()
                , node_id :: integer()
                }).

-define(undef, undefined).

-define(OFFSET_EARLIEST, earliest).
-define(OFFSET_LATEST, latest).

-define(IS_SPECIAL_OFFSET(O), (O =:= ?OFFSET_EARLIEST orelse
                               O =:= ?OFFSET_LATEST orelse
                               O =:= -2 orelse
                               O =:= -1)).

-type offset_time() :: integer()
                     | ?OFFSET_EARLIEST
                     | ?OFFSET_LATEST.

-type sasl_opt() :: {plain, User :: string() | binary(),
                            Pass :: string() | binary() |
                                    fun(() -> string() | binary())}
                  | {plain, File :: file:name_all()}
                  | {callback, module(), term()}
                  | ?undef.

-endif. % include brod_int.hrl

%%%_* Emacs ====================================================================
%%% Local Variables:
%%% allout-layout: t
%%% erlang-indent-level: 2
%%% End:
