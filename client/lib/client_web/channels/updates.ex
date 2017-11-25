defmodule Client.Updates do

  use Phoenix.Channel

  def join("updates", _message, socket) do
    { :ok, socket }
  end

  def handle_in("update", _options, socket) do
    %{bullets: bullets, players: players} = Client.state
    bullets = Enum.filter(bullets, &Process.alive?/1)
    players = Enum.filter(players, &Process.alive?/1)

    reply = %{
      bullets: Enum.map(bullets, &Bullet.peek/1),
      players: Enum.map(players, &Player.peek/1)
    }
    {:reply, {:ok, reply}, socket}
  end

end
