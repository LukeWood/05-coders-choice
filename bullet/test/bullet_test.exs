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

  test "bullets die after their lifetime" do
    {:ok, pid} = state(0, 0, :down)
  end


end
