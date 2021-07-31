defmodule DiscussWeb.AuthController do

  use DiscussWeb, :controller
  plug Ueberauth

  alias DiscussWeb.User
  alias Discuss.Repo

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{
      token: auth.credentials.token ,
      email: auth.info.email,
      provider: "google"
    }

    changeset = User.changeset(%User{}, user_params)

    singin(conn, changeset)
  end

  defp singin(conn, changeset) do
    case insert_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: Routes.topic_path(conn, :index))
    end
  end

  defp insert_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end


end
