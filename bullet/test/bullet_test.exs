defmodule BulletTest do
  use ExUnit.Case
  
  test "Bullet can be spawned" do
    Bullet.new :world
  end

end
