defmodule ElixirBlog.Session do
  import Ecto.Query

  alias ElixirBlog.User
  alias ElixirBlog.Repo

  def login(params) do
    user = Repo.get_by(User, email: String.downcase(params["email"]))
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
    case user do
      nil -> false
      _ -> Comeonin.Bcrypt.checkpw(password, user.crypted_password)
    end
  end

end
