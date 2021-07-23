defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias DiscussWeb.Topic
  alias Discuss.Repo

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render conn, "new.html" , changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
   # %{"topic" => topic} = params
   changeset = Topic.changeset(%Topic{}, topic)

   case Repo.insert(changeset) do
    {:ok ,post} -> IO.inspect(post)
    {:error, changeset} -> IO.inspect(changeset)
   end
  end

end
