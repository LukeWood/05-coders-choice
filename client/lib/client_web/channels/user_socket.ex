defmodule Client.UserSocket do
  use Phoenix.Socket

  channel "updates", Client.Updates
  channel "input",   Client.Input

  transport :websocket, Phoenix.Transports.WebSocket

  def connect(_params, socket) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
