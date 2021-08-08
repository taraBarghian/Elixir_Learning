defmodule DiscussWeb.Topic do
  use DiscussWeb, :model
  use Arc.Ecto.Model
  alias Discuss.

  schema "topics" do
    field :title , :string
    field :picture,  Discuss.Avatar.Type

    belongs_to :user, DiscussWeb.User
  end
  @required_fields ~w()
  @optional_fields ~w(username email)

  @required_file_fields ~w()
  @optional_file_fields ~w(avatar)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """

  def changeset(struct, params \\ %{} ) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> cast_attachments(params, @required_file_fields, @optional_file_fields)
  end


end
