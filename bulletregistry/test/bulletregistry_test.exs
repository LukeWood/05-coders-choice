defmodule BulletRegistryTest do
  use ExUnit.Case

  test "empty state construction" do
    state = BulletRegistry.new_registry
    assert state.bullets == []
    assert state.timestamp == 0
  end

  test "tick works" do
     state = BulletRegistry.new_registry |>
     BulletRegistry.tick(1000)
     assert state.timestamp == 1000
  end

  test "adding a bullet directly through tick works" do
    state = BulletRegistry.new_registry |>
    BulletRegistry.tick(0, [%BulletRegistry.Bullet{}])
    assert Enum.count(state.bullets) == 1
  end

  test "tick moves bullets" do
    state = BulletRegistry.new_registry |>
    BulletRegistry.tick(0, [%BulletRegistry.Bullet{}]) |>
    BulletRegistry.tick(1000, )
  end

end
