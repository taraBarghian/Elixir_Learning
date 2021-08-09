defmodule MyApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :avatar, :string
      add :username, :string

      timestamps()
    end

  end
end
