defmodule Client do

  def start() do
    {:ok, pid} = World.new
    Agent.start_link(fn -> pid end, name: __MODULE__)
  end

  def world() do
    Agent.get(__MODULE__, fn pid -> pid end)
  end

  def state do
    pid = Agent.get(__MODULE__, fn pid -> pid end)
    players = World.players(pid)
    bullets = World.bullets(pid)
    %{
      bullets: bullets,
      players: players
    }
  end

end
