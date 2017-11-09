defmodule ClockTest do
  use ExUnit.Case

  test "Clock can start" do
    Clock.start(nil, nil)
  end

end
