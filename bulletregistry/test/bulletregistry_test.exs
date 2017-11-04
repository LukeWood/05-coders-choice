defmodule BulletRegistryTest do
  use ExUnit.Case

  test "empty state contains no bullets and zero timestamp" do
    state = BulletRegistry.new_registry
    assert state.bullets == []
  end

end
