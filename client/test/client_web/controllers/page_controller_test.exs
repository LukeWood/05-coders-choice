defmodule ClientWeb.PageControllerTest do
  use ClientWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Bull.et"
  end
end
