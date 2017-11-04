defmodule BulletRegistry.Server do
  use GenServer

  alias BulletRegistry.Bullet,          as: Bullet
  alias BulletRegistry.ChangeList,      as: ChangeList
  alias BulletRegistry.Impl,            as: Impl

  def handle_call({:add_bullet, bullet}, _from, state) do
    Bullet.create_bullet(bullet) |>
    ChangeList.add
    {:reply, :ok, state}
  end

  def handle_call({:tick}, _from, state) do
    new_bullets = ChangeList.flush_changes
    state |>
    Impl.tick(:os.system_time(:millisecond), new_bullets) |>
    reply_good
  end

  def handle_call({:peek}, _from, state) do
    state |>
    reply_good
  end

  def handle_cast({:add_bullet, x, y, direction}, state) do
    ChangeList.add(
      %Bullet{x: x,
              y: y,
              direction: direction,
              timestamp: :os.system_time(:millisecond)
    })
    {:noreply, state}
  end

  defp reply_good(state) do
    {:reply, state, state}
  end

end
