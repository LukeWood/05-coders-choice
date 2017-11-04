defmodule ImplTest.Server do
  use ExUnit.Case

  test "the server boots into a new state" do
    BulletRegistry.tick()
    BulletRegistry.add_bullet(0, 0, :up)
  end

end
