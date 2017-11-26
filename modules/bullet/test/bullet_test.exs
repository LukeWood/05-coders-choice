defmodule BulletTest do
  use ExUnit.Case

  def tick do
    :timer.sleep(Application.get_env(:world, :interval) + 2)
  end

  describe "bullets can be" do
      test "spawned" do
        {:ok, pid } = Bullet.new
        assert pid != nil
      end

      test "created to mirror a players" do
        # nil world pid
        {:ok, pid} = Bullet.new(%{x: 100, y: 100, direction: :right}, nil)
        tick()
        assert Peek.peek(pid) |> Map.get(:x) == 100 + Application.get_env(:bullet, :speed)
      end
  end

  describe "bullets will " do
    test "move when tick is called" do
      {:ok, pid} = Bullet.new
      tick()
      assert Peek.peek(pid) |> Map.get(:x) == - Application.get_env(:bullet, :speed)
    end
  end


end
