defmodule BulletRegistry.Bullet do

  @lifetime 10000
  defstruct [
    expiration: 0,
    timestamp:  0,
    x:          0,
    y:          0,
    direction:  :left
  ]

  def create_bullet(%{timestamp: timestamp, direction: direction, x: x, y: y}) do
    create_bullet(timestamp, direction, x, y)
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
