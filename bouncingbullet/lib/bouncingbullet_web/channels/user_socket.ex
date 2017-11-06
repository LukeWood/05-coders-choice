defmodule BouncingbulletWeb.UserSocket do
  use Phoenix.Socket

  channel "updates", BouncingbulletWeb.Updates
  channel "input",   BouncingbulletWeb.Input

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
