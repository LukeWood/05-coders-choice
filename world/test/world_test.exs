defmodule WorldTest do

  use ExUnit.Case

  describe "Worlds can " do
  
    test "be started" do
      {:ok, pid} = World.new
      assert pid != nil
    end
    test "give a list of active players" do

    end

  end  

end
