defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias DisscussWeb.Topic

  def new(conn, params) do
    # struct = %Topic{}
    # params=%{}
    changeset = Topic.changeset(%Topic{}, %{})
  end

end
