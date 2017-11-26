defmodule PlayerTest do
  use ExUnit.Case
  import Player

  defp tick() do
    :timer.sleep(Application.get_env(:world, :interval) + 2)
  end

  defp defaults pid do
    default_x = Peek.peek(pid) |> Map.get(:x)
    default_y = Peek.peek(pid) |> Map.get(:y)
    {default_x, default_y}
  end

  describe "Players can be " do
    test "created" do
      {:ok, pid} = new()
      assert pid != nil
    end

    test "associated with a world" do
      {:ok, world} = Agent.start_link(fn -> [] end)
      {:ok, pid} = new(world)
      assert pid != nil
    end
  end

  describe "Players will " do

    test "respond to updates" do
      {:ok, pid} = new()

      action(pid, :left)
      assert Peek.peek(pid) |> Map.get(:direction) == :left
    end

    test "move right" do
      {:ok, pid} = new()
      {default_x, _} = defaults(pid)

      action(pid, :right)
      tick()
      assert Peek.peek(pid) |> Map.get(:x) == default_x + Application.get_env(:player, :speed)
    end

    test "move left" do
      {:ok, pid} = new()
      {default_x, _} = defaults(pid)

      action(pid, :right)
      tick()
      tick()
      assert Peek.peek(pid) |> Map.get(:x) == default_x + 2*Application.get_env(:player, :speed)
      action(pid, :left)
      tick()
      assert Peek.peek(pid) |> Map.get(:x) == default_x + Application.get_env(:player, :speed)
    end

    test "move down" do
      {:ok, pid} = new()
      {_, default_y} = defaults(pid)

      action(pid, :down)
      tick()
      assert Peek.peek(pid) |> Map.get(:y) == default_y + Application.get_env(:player, :speed)
    end

    test "move up" do
      {:ok, pid} = new()
      {_, default_y} = defaults(pid)

      action(pid, :down)
      tick()
      tick()
      assert Peek.peek(pid) |> Map.get(:y) == default_y + 2*Application.get_env(:player, :speed)
      action(pid, :up)
      tick()
      assert Peek.peek(pid) |> Map.get(:y) == default_y + Application.get_env(:player, :speed)
    end



    test "not move past the world's boundaries" do
      {:ok, pid} = new_zero_state(nil)
      {default_x, _} = defaults(pid)

      action(pid, :left)
      tick()
      assert Peek.peek(pid) |> Map.get(:x) == default_x
    end

  end

end
