defmodule Client.Updates do

  use Phoenix.Channel

  def join("updates", _message, socket) do
    { :ok, socket }
  end

  def not_nil val do
    val != nil
  end

  def handle_in("bullets", _options, socket) do
    %{bullets: bullets, players: _players} = Client.state
    bullets = Enum.map(bullets, &Peek.peek/1) |> Enum.filter(&not_nil/1)

    reply = %{
      bullets: bullets,
    }
    {:reply, {:ok, reply}, socket}
  end

  def handle_in("players", _options, socket) do
    %{bullets: _bullets, players: players} = Client.state
    players = Enum.map(players, &Peek.peek/1) |> Enum.filter(&not_nil/1)

    reply = %{
      players: players,
    }
    {:reply, {:ok, reply}, socket}
  end
end
