defmodule ElixirBlog.PageController do
  use ElixirBlog.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
