defmodule BulletRegistry.Server do
  use GenServer

  alias BulletRegistry.Bullet,          as: Bullet
  alias BulletRegistry.ChangeList,      as: ChangeList
  alias BulletRegistry.Impl,            as: Impl
  alias BulletRegistry.StateMaintainer, as: StateMaintainer

  def handle_call({:add_bullet, bullet}, _from, _) do
    Bullet.create_bullet(bullet) |>
    ChangeList.add
    {:reply, :ok}
  end

  def handle_call({:tick}, _from, _) do
    new_bullets = ChangeList.flush_changes
    StateMaintainer.get_state() |>
    Impl.tick(:os.system_time(:millisecond), new_bullets) |>
    StateMaintainer.update_state() |>
    reply_good
  end

  def handle_cast({:add_bullet, bullet}, _) do
    ChangeList.add(bullet)
    {:no_reply, :ok}
  end

  defp reply_good(state) do
    {:reply, state, state}
  end

end
