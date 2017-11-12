defmodule WorldTest do

  use ExUnit.Case

  describe "Worlds can " do
  
    test "be started" do
      {:ok, pid} = World.new
      assert pid != nil
    end

    test "be associated with a player" do
      {:ok, world } = World.new
      {:ok, _player} = Player.new world

    end

    test "be associated with a bullet" do

    end

    test "give a list of active players" do

    end

  end  

end
