defmodule BulletTest do
  use ExUnit.Case

  import Bullet

  test "Bullet process can be started" do
    {:ok, bullet_pid} = start(0, 0, :right)
    assert bullet_pid != nil
  end

  test "Bullets move right" do
    {:ok, pid} = start(0, 0, :right)
    state = pid |>
            tick |>
            tick |>
            peek
    assert state.x == 2
  end

  def obj(x, y, radius) do
    %{x: x, y: y, radius: radius}
  end

  test "bullets find colissions properly" do
    {:ok, pid} = start(0, 0, :right)

    objects = [
      obj(1, 1, 2),
      obj(1, 0, 1),
      obj(-50, -25, 5),
      obj(5, 5, 3)
    ]

    num_colls = pid  |>
                tick |>
                find_collisions(objects) |>
                Enum.count
    assert num_colls == 3
  end

  test "bullets die after their lifetime" do

  end


end
