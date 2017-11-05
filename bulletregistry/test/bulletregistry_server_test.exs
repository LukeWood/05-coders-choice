defmodule ImplTest.Server do
  use ExUnit.Case

  test "the server boots into a new state" do
    pid = BulletRegistry.new_registry
    BulletRegistry.tick(:os.system_time(:millisecond), pid)
    assert Enum.count((BulletRegistry.peek(pid)).bullets) == 0
  end

  test "bullets can be added to the server" do
    pid = BulletRegistry.new_registry
    BulletRegistry.tick(:os.system_time(:millisecond), pid)
    BulletRegistry.add_bullet(0, 0, :up, :os.system_time(:millisecond), pid)
    BulletRegistry.tick(:os.system_time(:millisecond), pid)
    assert Enum.count((BulletRegistry.peek(pid)).bullets) == 1
  end

  test "bullets are removed after their expiration time" do
    pid = BulletRegistry.new_registry
    BulletRegistry.add_bullet(0, 0, :up, 0, pid)
    BulletRegistry.tick(1, pid)
    assert Enum.count((BulletRegistry.peek(pid)).bullets) == 1
    BulletRegistry.tick(BulletRegistry.Bullet.lifetime() + 1, pid)
    assert Enum.count((BulletRegistry.peek(pid)).bullets) == 0
  end

end
