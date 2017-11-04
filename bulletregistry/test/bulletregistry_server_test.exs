defmodule ImplTest.Server do
  use ExUnit.Case

  test "the server boots into a new state" do
    BulletRegistry.tick()
    assert Enum.count((BulletRegistry.peek).bullets) == 0
  end

  test "bullets can be added to the server" do
    BulletRegistry.tick()
    BulletRegistry.add_bullet(0, 0, :up)
    BulletRegistry.tick()
    assert Enum.count((BulletRegistry.peek).bullets) == 1
  end

end
