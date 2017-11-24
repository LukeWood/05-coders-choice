defmodule WorldTest do

  use ExUnit.Case

  describe "Worlds can " do

    test "be started" do
      {:ok, pid} = World.new
      assert pid != nil
    end

    test "have players added" do
      {:ok, world} = World.new
      {:ok, placeholder} = Agent.start_link(fn -> [] end)
      World.new_player(world, placeholder)
      assert World.players(world) |> Enum.count == 1
    end

    test "have bullets added" do
      {:ok, world} = World.new
      {:ok, placeholder} = Agent.start_link(fn -> [] end)
      World.new_bullet(world, placeholder)
      assert World.bullets(world) |> Enum.count == 1
    end

   end

end
