defmodule DrabSpeedWeb.PageController do
  use DrabSpeedWeb, :controller
  use Drab.Controller

  def main(conn, _params) do
    render(conn, "main.html", items: [], counter: 0, c1: "lightgray", c2: "lightgray", c3: "lightgray", c4: "lightgray", c5: "lightgray", c6: "lightgray")
  end

end
