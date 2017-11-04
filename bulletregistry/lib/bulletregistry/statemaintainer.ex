defmodule BulletRegistry.StateMaintainer do

  @name StateMaintainer
  def start_link(name) do
    Agent.start_link(&BulletRegistry.new_registry/0, name: name)
  end
  def start_link do
    start_link(@name)
  end

  def get_state(name) do
    Agent.get(name, fn x -> x end)
  end
  def get_state do
    get_state(@name)
  end
end
