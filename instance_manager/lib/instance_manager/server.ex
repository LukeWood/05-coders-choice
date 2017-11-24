defmodule InstanceManager.Server do
  def start_link() do
    GenServer.start_link(__MODULE__, %InstanceManager{
      world: World.new
    })
  end
end
