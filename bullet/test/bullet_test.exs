defmodule BulletTest do
  use ExUnit.Case
  
  test "Bullet can be spawned" do
    {:ok, pid } = Bullet.new
    assert pid != nil
  end

  test "Bullet " do
    
  end

end
