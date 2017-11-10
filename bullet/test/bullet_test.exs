defmodule BulletTest do
  use ExUnit.Case



  test "can be spawned" do
    {:ok, pid } = Bullet.new
    assert pid != nil
  end

  test "moves when tick is called" do
    {:ok, pid} = Bullet.new
    Observable.emit(Clock, {:tick})
    assert Bullet.peek(pid) |> Map.get(:x) == -1
  end

  test "be created to mirror a players" do
    # nil world pid
    {:ok, pid} = Bullet.new(%{x: 100, y: 100, direction: :right}, nil)
    Observable.emit(Clock, {:tick})
    assert Bullet.peek(pid) |> Map.get(:x) == 101
  end

end
