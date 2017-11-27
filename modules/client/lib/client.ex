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

  def bundle_item(env, item, value) do
    Atom.to_string(env)<>"_"<>Atom.to_string(item)<>"="<>Integer.to_string(value)
  end

  def bundle_config() do
    player_config = Application.get_all_env(:player)
    bullet_config = Application.get_all_env(:bullet)
    #bundled_config = Enum.map(player_config, fn {item, value} ->
    #  bundle_item(:player, item, value)
    #end)
    #IO.inspect bullet_config
    "<meta id=\"config\">"
  end

end
