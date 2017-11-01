defmodule BouncingbulletWeb.PageController do
  use BouncingbulletWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
