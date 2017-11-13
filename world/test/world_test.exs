defmodule WorldTest do

  use ExUnit.Case

  describe "Worlds can " do
  
    test "be started" do
      {:ok, pid} = World.new
      assert pid != nil
    end

    test "give a list of active players" do
      {:ok, world} = World.new
      {:ok, placeholder} = Agent.start_link(fn -> [] end)
      World.new_player(world, placeholder)
      assert World.get_players(world) |> Enum.count == 1
    end

   end  

end
