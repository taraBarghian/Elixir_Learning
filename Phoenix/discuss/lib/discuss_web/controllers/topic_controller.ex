defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias DiscussWeb.Topic
  alias Discuss.Repo


  def index(conn, _params) do
    topics = Repo.all(Topic)
    render( conn, "index.html" , topics: topics)
  end


  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render conn, "new.html" , changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
   # %{"topic" => topic} = params
   changeset = Topic.changeset(%Topic{}, topic)

   case Repo.insert(changeset) do
    {:ok ,post} ->
      conn
      |> put_flash(:info, "Topic Created!")
      |> redirect(to: Routes.topic_path(conn, :index))

    {:error, changeset} ->
      render conn, "new.html" , changeset: changeset
   end
  end





end
