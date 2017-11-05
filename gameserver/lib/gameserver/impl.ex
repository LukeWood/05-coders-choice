defmodule GameServer.Impl do

  def create_bullet_callback(pid) do
    fn(player, timestamp) ->
      BulletServer.add_bullet(pid, player.x, player.y, player.direction, timestamp)
    end
  end

end
