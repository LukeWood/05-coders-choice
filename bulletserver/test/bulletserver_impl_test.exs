defmodule ImplTest do
  use ExUnit.Case

  alias BulletServer.Impl, as: Impl

  test "empty state construction" do
    state = Impl.new_registry
    assert state.bullets == []
    assert state.timestamp == 0
  end

  test "tick works" do
     state = Impl.new_registry |>
     Impl.tick(1000)
     assert state.timestamp == 1000
  end

  test "adding a bullet directly through tick works" do
    state = Impl.new_registry |>
    Impl.tick(0, [%BulletServer.Bullet{}])
    assert Enum.count(state.bullets) == 1
  end

  test "tick moves bullets" do
    state = Impl.new_registry |>
    Impl.tick(0, [%BulletServer.Bullet{}]) |>
    Impl.tick(1000, [%BulletServer.Bullet{}]) |>
    Impl.tick(2000, [%BulletServer.Bullet{direction: :down}])

    assert Enum.at(state.bullets, 0).x == -3
    assert Enum.at(state.bullets, 1).x == -2
    assert Enum.at(state.bullets, 2).x ==  0
    assert Enum.at(state.bullets, 2).y ==  1
  end

  test "bullets are removed after lifetime" do
    state = Impl.new_registry |>
    Impl.tick(0, [%BulletServer.Bullet{}]) |>
    Impl.tick(BulletServer.Bullet.lifetime() + 1)
    assert Enum.count(state.bullets) == 0
  end

end
