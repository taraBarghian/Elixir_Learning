defmodule MyApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  use Arc.Ecto.Schema

  schema "users" do
    field :avatar, MyApp.Avatar.Type
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username])
    |> cast_attachments(attrs,[:avatar])
    |> validate_required([:username])
  end
end
