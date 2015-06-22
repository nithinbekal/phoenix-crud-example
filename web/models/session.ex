defmodule ElixirBlog.Session do
  import Ecto.Query

  alias ElixirBlog.User
  alias ElixirBlog.Repo

  def login(params) do
    user = find_user_by_email(params["email"])
    case user do
      nil -> {:error}
      _   -> {:ok, user}
    end
  end

  defp find_user_by_email(email) do
    Repo.get_by(User, email: String.downcase(email))
  end
end
