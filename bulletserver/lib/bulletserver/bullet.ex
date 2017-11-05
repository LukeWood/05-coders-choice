defmodule BulletServer.Bullet do

  @lifetime 10000
  
  defstruct [
    expiration: 0,
    timestamp:  0,
    x:          0,
    y:          0,
    direction:  :left
  ]

  def lifetime do
    @lifetime
  end

  def create_bullet(%{timestamp: timestamp, direction: direction, x: x, y: y}) do
    create_bullet(timestamp, direction, x, y)
  end
  def create_bullet(%{direction: direction, x: x, y: y}) do
    create_bullet(:os.system_time(:millisecond), direction, x, y)
  end
  def create_bullet(timestamp, direction, x, y) do
    %BulletServer.Bullet{
      expiration: timestamp + @lifetime,
      timestamp:  timestamp,
      direction:  direction,
      x:          x,
      y:          y
    }
  end

end
