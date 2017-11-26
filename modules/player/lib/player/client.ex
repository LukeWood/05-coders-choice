defmodule Player.Client do

  def action(pid, action) do
    GenServer.cast(pid, {:action, action});
  end

end
