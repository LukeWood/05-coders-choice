defmodule ImplTest.Server do
  use ExUnit.Case

  test "the server boots into a new state" do
    pid = BulletServer.new_registry
    BulletServer.tick(:os.system_time(:millisecond), pid)
    assert Enum.count((BulletServer.peek(pid)).bullets) == 0
  end

  test "bullets can be added to the server" do
    pid = BulletServer.new_registry
    BulletServer.tick(:os.system_time(:millisecond), pid)
    BulletServer.add_bullet(0, 0, :up, :os.system_time(:millisecond), pid)
    BulletServer.tick(:os.system_time(:millisecond), pid)
    assert Enum.count((BulletServer.peek(pid)).bullets) == 1
  end

  test "bullets are removed after their expiration time" do
    pid = BulletServer.new_registry
    BulletServer.add_bullet(0, 0, :up, 0, pid)
    BulletServer.tick(1, pid)
    assert Enum.count((BulletServer.peek(pid)).bullets) == 1
    BulletServer.tick(BulletServer.Bullet.lifetime() + 1, pid)
    assert Enum.count((BulletServer.peek(pid)).bullets) == 0
  end

end
