defmodule BulletTest do
  use ExUnit.Case

  import Bullet

  test "Bullet process can be started" do
    bullet_pid = start(0, 0, :right)
    assert bullet_pid != nil
  end

  test "Bullets move right" do
    state = start(0, 0, :right)|>
    tick |>
    tick |>
    peek
    assert state.x == 2
  end

  test "bullets die after their lifetime" do
    
  end


end
