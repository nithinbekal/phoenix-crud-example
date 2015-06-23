defmodule ElixirBlog.Session do
  import Ecto.Query

  alias ElixirBlog.User
  alias ElixirBlog.Repo

  require Logger

  def login(params) do
    user = find_user_by_email(params["email"])
    case authenticate(user, params["password"]) do
      true -> {:ok, user}
      _    -> {:error}
    end
  end

  def current_user(conn) do
    id = Plug.Conn.get_session(conn, :current_user) || 0
    Repo.get(User, id)
  end

  def logged_in?(conn) do
    case current_user(conn) do
      nil -> false
      _   -> true
    end
  end

  defp authenticate(user, password) do
    Comeonin.Bcrypt.checkpw(password, user.crypted_password)
  end

  defp find_user_by_email(email) do
    Repo.get_by(User, email: String.downcase(email))
  end

end
