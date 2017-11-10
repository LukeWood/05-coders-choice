defmodule BulletTest do
  use ExUnit.Case

  describe "bullets can be" do
      test "spawned" do
        {:ok, pid } = Bullet.new
        assert pid != nil
      end

      test "created to mirror a players" do
        # nil world pid
        {:ok, pid} = Bullet.new(%{x: 100, y: 100, direction: :right}, nil)
        Observable.emit(Clock, {:tick})
        assert Bullet.peek(pid) |> Map.get(:x) == 101
      end
  end
  describe "bullets will " do
    test "move when tick is called" do
      {:ok, pid} = Bullet.new
      Observable.emit(Clock, {:tick})
      assert Bullet.peek(pid) |> Map.get(:x) == -1
    end
  end


end
