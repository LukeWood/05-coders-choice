defmodule ImplTest.Impl do
  use ExUnit.Case

  alias PlayerRegistry.Impl, as: Impl

  test "add player to registry" do
    state = Impl.zero_state
    state = Impl.add_player(state, %PlayerRegistry.Player{})
  end

end
