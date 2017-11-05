defmodule BulletRegistry.Server do
  use GenServer

  alias BulletRegistry.Bullet,          as: Bullet
  alias BulletRegistry.ChangeList,      as: ChangeList
  alias BulletRegistry.Impl,            as: Impl
  alias KeyVal,                         as: ChildrenRegistry

  def start_link(name) do
    GenServer.start_link(BulletRegistry.Server,
      BulletRegistry.Impl.new_registry,
      name: name)
  end

  def start_link() do
    start_link(BulletRegistry)
  end

  def handle_call({:add_bullet, bullet}, _from, state) do
    Bullet.create_bullet(bullet) |>
    ChangeList.add
    {:reply, :ok, state}
  end

  def handle_call({:tick, timestamp}, _from, state) do
    pid = ChildrenRegistry.get(self())
    new_bullets = ChangeList.flush_changes(pid)
    state |>
    Impl.tick(timestamp, new_bullets) |>
    reply_good
  end

  def handle_call({:peek}, _from, state) do
    state |>
    reply_good
  end

  def handle_cast({:add_bullet, x, y, direction, timestamp}, state) do
    pid = ChildrenRegistry.get(self())
    ChangeList.add(
      %Bullet{x: x,
              y: y,
              direction: direction,
              timestamp: timestamp
    }, pid)
    {:noreply, state}
  end

  defp reply_good(state) do
    {:reply, state, state}
  end

end
