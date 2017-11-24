defmodule Client.Updates do

  use Phoenix.Channel

  def join("updates", _message, socket) do
    { :ok, socket }
  end

  def handle_in("update", _options, socket) do
    %{bullets: bullets, players: players} = Client.state
    reply = %{
      bullets: Enum.map(bullets, &Bullet.peek/1),
      players: Enum.map(players, &Player.peek/1)
    }
    {:reply, reply, socket}
  end

end
