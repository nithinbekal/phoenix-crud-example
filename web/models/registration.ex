defmodule ElixirBlog.Registration do
  import Ecto.Changeset, only: [put_change: 3]

  alias ElixirBlog.Repo

  def create(changeset) do
    changeset
    |> put_change(:crypted_password, changeset.params["password"])
    |> Repo.insert
  end
end
