defmodule BulletRegistry.Bullet do

  @lifetime 10000
  defstruct [
    expiration: 0,
    timestamp:  0,
    x:          0,
    y:          0,
    direction:  :left
  ]

  def create_bullet(bullet_data) do
    create_bullet(
      bullet_data["timestamp"],
      bullet_data["direction"],
      bullet_data["x"],
      bullet_data["y"]
    )
  end

  def create_bullet(timestamp, direction, x, y) do
    %BulletRegistry.Bullet{
      expiration: timestamp + @lifetime,
      timestamp:  timestamp,
      direction:  direction,
      x:          x,
      y:          y
    }
  end

end
