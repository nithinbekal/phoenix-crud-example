defmodule ElixirBlog.Session do
  import Ecto.Query

  alias ElixirBlog.User
  alias ElixirBlog.Repo

  def login(params) do
    user = find_user_by_email(params["email"])
    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _    -> {:error}
    end
  end

  defp authenticate(user, password) do
    user.crypted_password == password
  end

  defp find_user_by_email(email) do
    Repo.get_by(User, email: String.downcase(email))
  end

end
