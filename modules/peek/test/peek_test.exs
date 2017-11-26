defmodule PeekTest do
  use ExUnit.Case
  doctest Peek

  test "greets the world" do
    assert Peek.hello() == :world
  end
end
