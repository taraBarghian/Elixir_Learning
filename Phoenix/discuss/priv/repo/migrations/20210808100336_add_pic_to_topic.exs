defmodule Discuss.Repo.Migrations.AddPicToTopic do
  use Ecto.Migration

  def change do
    alter table(:topics) do
      add :picture, :string
  end
end
