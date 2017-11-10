defmodule BulletTest do
  use ExUnit.Case
  
  test "Bullet can be spawned" do
    {:ok, pid } = Bullet.new
    assert pid != nil
  end

  test "Bullet moves when tick is called" do
    {:ok, pid} = Bullet.new
    Observable.emit(Clock, {:tick})
    assert Bullet.peek(pid) |> Map.get(:x) == -1
  end

end
