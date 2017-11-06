defmodule GameServer.Impl do

  def create_bullet_callback(bullet_pid) do
    fn(player, timestamp) ->
      BulletServer.add_bullet(bullet_pid, player.x, player.y, player.direction, timestamp)
    end
  end

  def detect_single_collision({x1, y1, radius1}, {x2, y2, radius2}) do
    distance = :math.sqrt(:math.pow(x1 - x2, 2) + :math.pow(y1 - y2, 2))
    distance < radius1 + radius2
  end

  def detect_collisions_per_bullet(bullet, players) do
    Enum.map(players, fn player ->


    end)
  end

  def detect_collisions(bullets, players) do
    Enum.map(bullets,
      fn bullet ->
        detect_collisions_per_bullet(bullet, players)
      end
    )
  end

end
