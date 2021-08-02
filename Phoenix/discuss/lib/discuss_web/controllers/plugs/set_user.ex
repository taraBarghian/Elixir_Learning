defmodule DiscussWeb.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias DiscussWeb.User
  alias Discuss.Repo
  alias DiscussWeb.Router.Helpers

   def init(_params) do
   end

   def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user , user)
        #conn.assings.user => user struct
      true ->
        assign(conn,:user, nil)
    end
   end


end
