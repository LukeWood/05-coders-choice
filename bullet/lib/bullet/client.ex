defmodule Bullet.Client do
  
  def peek(pid) do
    GenServer.call(pid, {:peek})
  end

end

