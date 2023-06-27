%%%-------------------------------------------------------------------
%% @doc db_access public API
%% @end
%%%-------------------------------------------------------------------

-module(db_access_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_Type, _Args) ->
	Dispatch = cowboy_router:compile([
	    {'_', [
	        {"/", toppage_h, []},
		{"/gfriends",get_friends,[]},
		{"/pfriends",set_friends,[]},
		{"/afriend",add_friend,[]}

	    ]}
	]),

	PrivDir = code:priv_dir(db_access),
        {ok,_} = cowboy:start_tls(https_listener, [
                  		{port, 443},
				{certfile, PrivDir ++ "/ssl/fullchain.pem"},
				{keyfile, PrivDir ++ "/ssl/privkey.pem"}
              		], #{env => #{dispatch => Dispatch}}),
	db_access_sup:start_link().
stop(_State) ->
    ok.

%% internal functions

%%%------------------------------------------------------------------- 
%% @doc test_server public API 
%% @end 
%%%------------------------------------------------------------------- 
 
% -module(test_server_app). 
 
% -behaviour(application). 
 
% -export([start/2, stop/1]). 
 
% start(_StartType, _StartArgs) -> 
%         Dispatch = cowboy_router:compile([ 
%             {'_', [ 
%                 {"/", toppage_h, []} 
%             ]} 
%         ]), 
 
%         %PrivDir = code:priv_dir(test_server_app), 
%         {ok,_} = cowboy:start_tls(https_listener, [ 
%                                 {port, 80} 
%                                 %{certfile, PrivDir ++ "/ssl/fullchain.pem"}, 
%                                 %{keyfile, PrivDir ++ "/ssl/privkey.pem"} 
%                         ], #{env => #{dispatch => Dispatch}}), 
%         test_server_sup:start_link(). 
 
% stop(_State) -> 
%     ok. 
 
% %% internal functions 