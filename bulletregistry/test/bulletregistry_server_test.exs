defmodule ImplTest.Server do
  use ExUnit.Case

  test "the server boots into a new state" do
    pid = BulletRegistry.new_registry
    IO.inspect pid
    BulletRegistry.tick(pid)
    assert Enum.count((BulletRegistry.peek(pid)).bullets) == 0
  end

  test "bullets can be added to the server" do
    pid = BulletRegistry.new_registry
    BulletRegistry.tick(pid)
    BulletRegistry.add_bullet(0, 0, :up, pid)
    BulletRegistry.tick(pid)
    assert Enum.count((BulletRegistry.peek).bullets) == 1
  end

end
