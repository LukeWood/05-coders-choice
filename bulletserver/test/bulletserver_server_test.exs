defmodule ImplTest.Server do
  use ExUnit.Case

  test "the server boots into a new state" do
    pid = BulletServer.new_registry
    BulletServer.tick(pid, :os.system_time(:millisecond))
    assert Enum.count((BulletServer.peek(pid)).bullets) == 0
  end

  test "bullets can be added to the server" do
    pid = BulletServer.new_registry
    BulletServer.tick(pid, :os.system_time(:millisecond))
    BulletServer.add_bullet(pid, 0, 0, :up, :os.system_time(:millisecond))
    BulletServer.tick(pid, :os.system_time(:millisecond))
    assert Enum.count((BulletServer.peek(pid)).bullets) == 1
  end

  test "bullets are removed after their expiration time" do
    pid = BulletServer.new_registry
    BulletServer.add_bullet(pid, 0, 0, :up, 0)
    BulletServer.tick(pid, 1)
    assert Enum.count((BulletServer.peek(pid)).bullets) == 1
    BulletServer.tick(pid, BulletServer.Bullet.lifetime() + 1)
    assert Enum.count((BulletServer.peek(pid)).bullets) == 0
  end

end
