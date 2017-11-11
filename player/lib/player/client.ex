defmodule Player.Client do

  def peek(pid) do
    GenServer.call(pid, {:peek})
  end

  def action(pid, action) do
    GenServer.cast(pid, {:action, action});
  end

end
