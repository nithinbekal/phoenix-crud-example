defmodule ElixirBlog.SessionController do
  use ElixirBlog.Web, :controller

  plug :action

  def new(conn, _params) do
    render conn, "new.html"
  end
end
